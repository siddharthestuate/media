package com.medialounge.reevo.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.UserDao;
import com.medialounge.reevo.dto.ActiveLoginDTO;
import com.medialounge.reevo.dto.BumpDTO;
import com.medialounge.reevo.dto.BumpFavDTO;
import com.medialounge.reevo.dto.BumpMutualDTO;
import com.medialounge.reevo.dto.ContactDto;
import com.medialounge.reevo.dto.InspireDTO;
import com.medialounge.reevo.dto.MonitorDTO;
import com.medialounge.reevo.dto.OverviewDTO;
import com.medialounge.reevo.dto.SkillDTO;
import com.medialounge.reevo.dto.StatusDTO;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.entity.ActiveLoginEntity;
import com.medialounge.reevo.entity.BumpEntity;
import com.medialounge.reevo.entity.BumpFavEntity;
import com.medialounge.reevo.entity.BumpMutualEntity;
import com.medialounge.reevo.entity.ContactEntity;
import com.medialounge.reevo.entity.InspireEntity;
import com.medialounge.reevo.entity.JobTypeEntity;
import com.medialounge.reevo.entity.ModuleEntity;
import com.medialounge.reevo.entity.MonitorEntity;
import com.medialounge.reevo.entity.MonitorEntityWeek;
import com.medialounge.reevo.entity.OverViewModulesEntity;
import com.medialounge.reevo.entity.OverviewEntity;
import com.medialounge.reevo.entity.SkillEntity;
import com.medialounge.reevo.entity.StatusEntity;
import com.medialounge.reevo.entity.UserEntity;
import com.medialounge.reevo.util.MediaLoungeConstant;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	private static Logger logger = Logger.getLogger(UserDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	UserDto userDto;
	StatusDTO statusDTO;
	ContactDto contactDto;
	BumpDTO bumpDTO;
	BumpFavDTO bumpFavDTO;
	BumpMutualDTO bumpMutualDTO;
	BumpMutualEntity bumpMutualEntity;
	BumpFavEntity bumpFavEntity;
	UserEntity entity;
	BumpEntity bumpEntity;
	ContactEntity contactEntity = null;
	Query query = null;
	private ArrayList<UserDto> userArrraylist, contactArrayList;

	OverviewEntity overviewEntity;
	OverViewModulesEntity overViewModulesEntity;
	OverviewDTO overviewDTO;
	private ArrayList<OverviewDTO> overViewArrraylist;
	String hql = "";

	public void addUser(UserDto userDto) throws Exception {
		try {
			UserEntity entity = new UserEntity();
			BeanUtils.copyProperties(entity, userDto);
			sessionFactory.getCurrentSession().save(entity);
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	public ArrayList<UserDto> listUsers(UserDto userDto) throws Exception {
		try {
			entity = new UserEntity();
			String criteria = "";
			try {
				if (!userDto.getEmail().equalsIgnoreCase("")) {
					criteria = " where email not in ('" + userDto.getEmail()
							+ "')";
				}
			} catch (NullPointerException e) {
				// e.printStackTrace();
				criteria = "";
			}
			List users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity"
									+ criteria).list();
			userArrraylist = new ArrayList<UserDto>();
			for (Iterator iterator = users.iterator(); iterator.hasNext();) {
				UserEntity userEntity = (UserEntity) iterator.next();
				this.userDto = new UserDto();
				BeanUtils.copyProperties(this.userDto, userEntity);
				userArrraylist.add(this.userDto);
			}

		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return userArrraylist;
	}

	@SuppressWarnings("unchecked")
	public UserDto loginUser(UserDto userDto) throws Exception {
		try {
			UserDto localUserDto = new UserDto();
			List<UserEntity> userList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity where password = '"
									+ userDto.getPassword() + "' and email = '"
									+ userDto.getEmail() + "'").list();
			if (userList.size() > 0) {

				try {
					UserEntity userEntity = (UserEntity) userList.get(0);
					BeanUtils.copyProperties(localUserDto, userEntity);
					return localUserDto;
				} catch (Exception e) {
					e.printStackTrace();
				}

				try {
					for (UserEntity user : userList) {
						BeanUtils.copyProperties(localUserDto, user);
						return localUserDto;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<UserDto> getPendingContacts(int userId) throws Exception {
		try {

			List<UserEntity> users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity as u"
									+ " where  u.userId in (select fromUserId from ContactEntity c where toUserId = "
									+ userId + " and status = 'pending')")
					.list();
			contactArrayList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				contactArrayList.add(userDto);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return contactArrayList;
	}

	public String addContacts(String userId, String[] contactArr)
			throws Exception {
		String status = "";
		ContactEntity contactEntity = null;
		try {
			for (int i = 0; i < contactArr.length; i++) {
				contactEntity = new ContactEntity();
				contactEntity.setFromUserId(Integer.parseInt(userId));
				contactEntity.setToUserId(Integer.parseInt(contactArr[i]));
				contactEntity.setReadStatus("unread");
				contactEntity.setStatus("pending");
				sessionFactory.getCurrentSession().saveOrUpdate(contactEntity);
			}

			status = "success";
		} catch (Exception e) {
			// e.printStackTrace();
			status = "failure";
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return status;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<UserDto> getContacts(int userId) throws Exception {
		try {
			List<UserEntity> users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity as u"
									+ " where u.userId in (select toUserId from ContactEntity c where fromUserId = "
									+ userId
									+ " and status = 'active') or "
									+ " u.userId in (select fromUserId from ContactEntity c where toUserId = "
									+ userId + " and status = 'active') ")
					.list();
			contactArrayList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				contactArrayList.add(userDto);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return contactArrayList;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<UserDto> getNewContactsList(int userId) throws Exception {
		try {
			List<UserEntity> users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity as u"
									+ " where u.userId not in (select toUserId from ContactEntity c where fromUserId = "
									+ userId
									+ " "
									+ "and (status != 'rejected')) and "
									+ " u.userId not in (select fromUserId from ContactEntity c where toUserId = "
									+ userId
									+ " "
									+ "and (status != 'rejected')) and u.userId <> "
									+ userId
									+ " "
									+ "and u.email <> '"
									+ MediaLoungeConstant.ADMIN + "'").list();
			contactArrayList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				contactArrayList.add(userDto);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return contactArrayList;
	}

	public int setPendingContactsToContacts(String[] contactArr) {
		int numberOfRowUpdate = 0, indRowUpdate = 0;

		Query query = null;

		for (String contact : contactArr) {
			query = sessionFactory
					.getCurrentSession()
					.createQuery(
							"update ContactEntity as c set c.statatus = 'active' where (c.fromUserId = userId and c.toUserId = "
									+ Integer.parseInt(contact)
									+ ")  or (c.toUserId = userId and c.fromUserId = "
									+ Integer.parseInt(contact) + ")");
			indRowUpdate = query.executeUpdate();
			if (indRowUpdate > 0)
				numberOfRowUpdate++;
		}
		return numberOfRowUpdate;
	}

	public String setPendingContactsToContacts(int userId, int contactId,
			String status) throws Exception {

		String updateStatus = "";
		try {
			int noofRowsUpdated = 0;
			if (status.equals("confirm")) {
				query = sessionFactory.getCurrentSession().createQuery(
						"update ContactEntity as c set c.status = 'active' where (c.fromUserId = "
								+ contactId + " and c.toUserId = " + userId
								+ ") ");
			}
			if (status.equals("reject")) {
				query = sessionFactory.getCurrentSession().createQuery(
						"update ContactEntity as c set c.status = 'rejected' where (c.fromUserId = "
								+ contactId + " and c.toUserId = " + userId
								+ ") ");
			}
			noofRowsUpdated = query.executeUpdate();
			if (noofRowsUpdated > 0)
				updateStatus = "success";
			else
				updateStatus = "failure";
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return updateStatus;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<UserDto> viewMyInfo(String userName) throws Exception {
		ArrayList<UserDto> myInfoArrList = null;
		try {

			List<UserEntity> users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity as u where  u.email= '"
									+ userName + "'").list();
			myInfoArrList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				myInfoArrList.add(userDto);
			}
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return myInfoArrList;
	}

	@Override
	public String addSkill(int id, int jobTypeId, String skillName)
			throws Exception {
		String msg = "";
		try {
			SkillEntity skillEntity = new SkillEntity();

			JobTypeEntity jobTypeEntity = new JobTypeEntity();
			jobTypeEntity.setJobTypeId(jobTypeId);

			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(id);

			skillEntity.setJobTypeId(jobTypeEntity);
			skillEntity.setUserId(userEntity);
			skillEntity.setSkills(skillName);

			sessionFactory.getCurrentSession().saveOrUpdate(skillEntity);
			msg = "Successfully saved";
		} catch (Exception e) {
			msg = "Error in update";
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@Override
	public String saveUserPhoto(UserDto userDto) throws Exception {
		String msg = "Fail";
		int updatedRow = 0;
		try {
			query = sessionFactory.getCurrentSession().createQuery(
					"update UserEntity as u set u.contentPath= '"
							+ userDto.getContentPath() + "' where u.email='"
							+ userDto.getEmail() + "'");

			updatedRow = query.executeUpdate();
			if (updatedRow > 0)
				msg = "SUCCESS";
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@Override
	public ArrayList<SkillDTO> getMySkills(int userId) throws Exception {
		ArrayList<SkillDTO> mySkillArryList = new ArrayList<SkillDTO>();
		try {
			SkillDTO skillDTO = null;
			List skillList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.SkillEntity as s where s.userId.userId="
									+ userId + "  ORDER BY skillId DESC")
					.list();
			for (Iterator skillEntityIttr = skillList.iterator(); skillEntityIttr
					.hasNext();) {
				skillDTO = new SkillDTO();
				BeanUtils.copyProperties(skillDTO,
						(SkillEntity) skillEntityIttr.next());
				mySkillArryList.add(skillDTO);
			}
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return mySkillArryList;
	}

	@Override
	public String setUserCategories(int userId, String dj, String vs,
			String journalist, String anchor) throws Exception {
		String msg = "Fail";
		int updatedRow = 0;
		try {
			query = sessionFactory
					.getCurrentSession()
					.createQuery(
							"update UserEntity as u set u.dj = :dj, u.vs = :vs, "
									+ "u.journalist = :journalist, u.anchor = :anchor where u.userId = :userId");
			query.setParameter("dj", dj);
			query.setParameter("vs", vs);
			query.setParameter("journalist", journalist);
			query.setParameter("anchor", anchor);
			query.setParameter("userId", userId);

			updatedRow = query.executeUpdate();
			if (updatedRow > 0)
				msg = "SUCCESS";
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<UserDto> getUsersByType(String userType) throws Exception {
		ArrayList<UserDto> userTypeList = null;
		try {
			List<UserEntity> users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity as u where  u."
									+ userType + "= 'Y'").list();
			userTypeList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				userTypeList.add(userDto);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return userTypeList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<UserDto> fetchSearchUser(String searchUser)
			throws Exception {
		ArrayList<UserDto> searchUserList = null;
		try {
			List<UserEntity> users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity as u where  u."
									+ searchUser.toLowerCase() + "= 'Y'")
					.list();
			searchUserList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				searchUserList.add(userDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Exception");
		}
		return searchUserList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<UserDto> getUserDetailsById(int userId) {
		ArrayList<UserDto> userList = null;
		try {
			List<UserEntity> users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity as u where  u.userId ="
									+ userId).list();
			userList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				userList.add(userDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<StatusDTO> getStatusById(int userId) {
		ArrayList<StatusDTO> statusList = null;

		try {
			List<StatusEntity> status = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.StatusEntity where  statusId in (select max(statusId) from StatusEntity where user_id ="
									+ userId + ")").list();
			statusList = new ArrayList<StatusDTO>();
			for (StatusEntity user : status) {
				StatusDTO statusDTO = new StatusDTO();
				BeanUtils.copyProperties(statusDTO, user);

				statusList.add(statusDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return statusList;
	}

	/*
	 * @author: Mahesh
	 * 
	 * @see com.medialounge.reevo.dao.UserDao#getOverviewList(java.lang.String,
	 * int)
	 */

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OverviewDTO> getOverviewList(String loginUser,
			int overViewId) {

		String hqlQuery;
		try {

			if (loginUser.equalsIgnoreCase(MediaLoungeConstant.ADMIN)) {

				// loginUser);

				if (overViewId == 0)
					/*
					 * hqlQuery =
					 * "FROM OverviewEntity  where  isDeleted like 'N' ORDER BY id DESC "
					 * ;
					 */
					hqlQuery = "FROM OverviewEntity  where  isDeleted like 'N'";
				else
					/*
					 * hqlQuery =
					 * "FROM OverviewEntity as O where  isDeleted like 'N' and  O.id= "
					 * + overViewId ;
					 */
					hqlQuery = "FROM OverviewEntity as O where  isDeleted like 'N' and  O.overViewModulesEntity.quickOverViewModuleId= "
							+ overViewId;

			} else {

				hqlQuery = "FROM OverviewEntity as O where isDeleted like 'N' and status='Y' and O.overViewModulesEntity.quickOverViewModuleId= "
						+ overViewId + " ORDER BY id DESC ";
			}

			List<OverviewEntity> modulesList = sessionFactory
					.getCurrentSession().createQuery(hqlQuery).list();
			overViewArrraylist = new ArrayList<OverviewDTO>();

			for (OverviewEntity moduleList : modulesList) {

				OverviewDTO overviewDTO = new OverviewDTO();
				BeanUtils.copyProperties(overviewDTO, moduleList);
				overViewArrraylist.add(overviewDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return overViewArrraylist;
	}

	/*
	 * @author:Mahesh
	 * 
	 * @see com.medialounge.reevo.dao.UserDao#deleteOverViewData(int,
	 * java.lang.String)
	 */
	@Override
	public void deleteOverViewData(int quickOverViewId, String loginUser)
			throws Exception {

		try {

			int noOfRowsUpdated = 0;
			String hqlQuery = "update OverviewEntity O set O.isDeleted='Y'  where O.overViewModulesEntity.quickOverViewModuleId= "
					+ quickOverViewId;
			Query query = sessionFactory.getCurrentSession().createQuery(
					hqlQuery);
			noOfRowsUpdated = query.executeUpdate();

			if (noOfRowsUpdated > 0) {

			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@Override
	public void setActiveOrDeactive(int quickOverViewId, String status)
			throws Exception {
		try {
			String hqlQuery = "update OverviewEntity  as O  set O.status=\'"
					+ status
					+ "\'  where O.overViewModulesEntity.quickOverViewModuleId= "
					+ quickOverViewId;
			/*
			 * Query query = sessionFactory.getCurrentSession().createQuery(
			 * "update OverviewEntity  as O  set O.status=\'" + status +
			 * "\'  where o.id=" + quickOverViewId);
			 */
			Query query = sessionFactory.getCurrentSession().createQuery(
					hqlQuery);

			int noofRowsUpdated = query.executeUpdate();

			if (noofRowsUpdated > 0) {
			}

		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@Override
	public String checkOverViewModuleExisting(int overViewModuleId)
			throws Exception {

		String moduleStatus = "";
		try {

			String hqlQuery = "FROM OverviewEntity where isDeleted = 'N' and overViewModulesEntity.quickOverViewModuleId="
					+ overViewModuleId;
			List overViewModulesList = sessionFactory.getCurrentSession()
					.createQuery(hqlQuery).list();

			if (overViewModulesList.size() > 0) {
				// + " 1 row Existed");
				moduleStatus = "This Module is Already Added";
			} else {

				moduleStatus = "Not Added";
			}
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return moduleStatus;
	}

	// Quick Over view
	@Override
	public String addOverViewData(int overViewModuleId, String description,
			String functionWork, String whyToUse, String status)
			throws Exception {
		OverviewEntity overviewEntity;
		String s = "";
		try {
			overviewEntity = new OverviewEntity();

			OverViewModulesEntity modulesEntity = new OverViewModulesEntity();
			modulesEntity.setQuickOverViewModuleId(overViewModuleId);

			overviewEntity.setOverViewModulesEntity(modulesEntity);
			overviewEntity.setDescription(description);
			overviewEntity.setFunctionWork(functionWork);
			overviewEntity.setWhyToUse(whyToUse);
			overviewEntity.setStatus(status);
			overviewEntity.setIsDeleted("N");

			sessionFactory.getCurrentSession().saveOrUpdate(overviewEntity);
			s = "success";
		} catch (Exception e) {
			// e.printStackTrace();
			s = "failure";
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return s;
	}

	@Override
	public ArrayList<OverviewDTO> getAllOverViewModules() throws Exception {
		ArrayList<OverviewDTO> overViewModulesArrList = new ArrayList<OverviewDTO>();
		try {

			/*
			 * String hqlQuery=
			 * "FROM com.medialounge.reevo.entity.OverViewModulesEntity ORDER BY description ASC"
			 * ;
			 */
			String hqlQuery = "FROM OverViewModulesEntity";
			List overViewModulesList = sessionFactory.getCurrentSession()
					.createQuery(hqlQuery).list();

			OverviewDTO overviewDTO = null;
			for (Iterator iterator = overViewModulesList.iterator(); iterator
					.hasNext();) {

				OverViewModulesEntity overViewModulesEntity = (OverViewModulesEntity) iterator
						.next();
				overviewDTO = new OverviewDTO();
				BeanUtils.copyProperties(overviewDTO, overViewModulesEntity);
				overViewModulesArrList.add(overviewDTO);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return overViewModulesArrList;
	}

	/*
	 * @Override public String startMonitor(int userId, int moduleId, Date date)
	 * { String msg = ""; ArrayList<MonitorDTO> monitorList = null; try { //
	 * checking the condition previous module is closed or not
	 * previousModuleMonitor(userId, moduleId, date);
	 * 
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 * String endTime = sdf.format(date); // checking the condition existing
	 * user or new monitorList = getMonitorId(userId, moduleId); // if existing
	 * user, it will take data and update startTime if (monitorList.size() > 0)
	 * { for (MonitorDTO monitorDTO : monitorList) { query =
	 * sessionFactory.getCurrentSession().createQuery(
	 * "update MonitorEntity as m set m.startTime ='" + endTime +
	 * "' where m.monitorId = " + monitorDTO.getMonitorId()); // , //
	 * m.timeSpend // = 20 query.executeUpdate(); } msg = "monitoring updated";
	 * } else { // if new user UserEntity userEntity = new UserEntity();
	 * userEntity.setUserId(userId); MonitorEntity monitorEntity = new
	 * MonitorEntity(); monitorEntity.setUserEntity(userEntity); ModuleEntity
	 * moduleEntity = new ModuleEntity(); moduleEntity.setModuleId(moduleId);
	 * monitorEntity.setModuleEntity(moduleEntity);
	 * monitorEntity.setStartTime(date);
	 * sessionFactory.getCurrentSession().saveOrUpdate(monitorEntity); msg =
	 * "monitoring started"; } } catch (Exception e) { msg =
	 * "Error in monitoring"; e.printStackTrace(); } return msg; }
	 */

	/*
	 * Checking previous module start monitor is closed or not. If not taking
	 * last record and updating stop monitor.
	 */
	/*
	 * public void previousModuleMonitor(int userId, int moduleId, Date date) {
	 * try { // taking last record with conditions // hql = //
	 * "from MonitorEntity m where m.endTime is null and m.timeSpend=0 ORDER BY m.monitorId desc limit 1"
	 * ; hql =
	 * "from MonitorEntity m where m.endTime is null and m.timeSpend=0 and m.userEntity.userId= "
	 * + userId + " ORDER BY m.monitorId desc limit 1"; List list =
	 * sessionFactory.getCurrentSession().createQuery(hql) .list(); for
	 * (Iterator iterator = list.iterator(); iterator.hasNext();) {
	 * MonitorEntity entity = (MonitorEntity) iterator.next(); if
	 * (entity.getModuleEntity().getModuleId() != moduleId) {
	 * 
	 * SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
	 * String endTime = sdf.format(date); long endTimes = date.getTime() -
	 * entity.getStartTime().getTime(); long timeSpend = endTimes / 1000;
	 * 
	 * query = sessionFactory.getCurrentSession().createQuery(
	 * "update MonitorEntity as m set m.endTime ='" + endTime +
	 * "', m.timeSpend = " + timeSpend + " where m.monitorId = " +
	 * entity.getMonitorId()); query.executeUpdate(); } } } catch (Exception e)
	 * { e.printStackTrace(); } }
	 */
	/*
	 * @Override public ArrayList<MonitorDTO> getMonitorId(int userId, int
	 * moduleId) { ArrayList<MonitorDTO> monitorList = null; int monitorId = 0;
	 * try {
	 * 
	 * @SuppressWarnings("unchecked") List<MonitorEntity> list = sessionFactory
	 * .getCurrentSession() .createQuery(
	 * "FROM com.medialounge.reevo.entity.MonitorEntity where userEntity.userId = "
	 * + userId + " and moduleEntity.moduleId = '" + moduleId + "'").list();
	 * monitorList = new ArrayList<MonitorDTO>(); for (MonitorEntity monitor :
	 * list) { MonitorDTO monitorDTO = new MonitorDTO();
	 * BeanUtils.copyProperties(monitorDTO, monitor);
	 * monitorList.add(monitorDTO); } } catch (Exception e) {
	 * e.printStackTrace(); } return monitorList; }
	 */

	/*
	 * @Override public String stopMonitor(MonitorDTO monitorDTO) { String msg =
	 * ""; int updatedRow = 0; try { // String endTime = //
	 * ConvertDate.utilDateToString(monitorDTO.getEndTime()); Date date = new
	 * Date(); SimpleDateFormat sdf = new
	 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String endTime =
	 * sdf.format(date); SimpleDateFormat formatter = new SimpleDateFormat(
	 * "yyyy-MM-dd HH:mm:ss"); Date date2 = formatter.parse(endTime);
	 * 
	 * query = sessionFactory.getCurrentSession().createQuery(
	 * "update MonitorEntity as m set m.endTime ='" + formatter.format(date2) +
	 * "', m.timeSpend = " + monitorDTO.getTimeSpend() +
	 * "  where m.monitorId = " + monitorDTO.getMonitorId()); updatedRow =
	 * query.executeUpdate(); if (updatedRow > 0) msg =
	 * "monitor updated successfully"; } catch (Exception e) { msg = "Error";
	 * e.printStackTrace(); } return msg; }
	 */

	@Override
	public ArrayList<MonitorDTO> getCountForEachModule() throws Exception {

		ArrayList<MonitorDTO> monitorListArr = new ArrayList<MonitorDTO>();
		MonitorDTO monitorDTO = null;
		float WEEK_AVERAGE = 0;
		try {
			MonitorEntityWeek monitorEntityWeek = new MonitorEntityWeek();
			hql = "from MonitorEntityWeek";
			List fmfList = sessionFactory.getCurrentSession().createQuery(hql)
					.list();
			monitorListArr = new ArrayList<MonitorDTO>();
			for (Iterator iterator = fmfList.iterator(); iterator.hasNext();) {
				float BASE_RATE = 1;
				MonitorEntityWeek entity = (MonitorEntityWeek) iterator.next();
				monitorDTO = new MonitorDTO();
				monitorDTO.setUserCount(entity.getUserCount());
				monitorDTO.setModuleId(entity.getModuleEntity().getModuleId());
				monitorDTO.setModuleName(entity.getModuleEntity()
						.getModuleName());
				monitorDTO.setAverage(entity.getWeeklyAvg());
				WEEK_AVERAGE = entity.getWeeklyAvg() / 60;
				if (WEEK_AVERAGE >= 10) {
					BASE_RATE = (float) (BASE_RATE + 0.03);
				} else if (WEEK_AVERAGE < 10) {
					BASE_RATE = BASE_RATE;
				}
				monitorDTO.setBaseRate4b(BASE_RATE);
				// BeanUtils.copyProperties(monitorDTO, entity);
				monitorListArr.add(monitorDTO);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return monitorListArr;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String checkEmail(String email) throws Exception {

		try {
			List<UserEntity> emails = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity where email='"
									+ email + "'").list();
			int count = emails.size();
			if (count > 0) {
				return "failure";
			} else
				return "success";

		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@Override
	public void saveActiveLogins(ActiveLoginDTO activeLoginDTO)
			throws Exception {
		try {
			ActiveLoginEntity activeLoginEntity = new ActiveLoginEntity();
			BeanUtils.copyProperties(activeLoginEntity, activeLoginDTO);
			sessionFactory.getCurrentSession().saveOrUpdate(activeLoginEntity);
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ActiveLoginDTO> getActiveLogins() throws Exception {

		try {
			List<ActiveLoginEntity> activeLogin = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.ActiveLoginEntity order by activeLoginId DESC")
					.list();
			ArrayList<ActiveLoginDTO> activeLoginList = new ArrayList<ActiveLoginDTO>();
			for (ActiveLoginEntity logins : activeLogin) {
				ActiveLoginDTO activeLoginDTO = new ActiveLoginDTO();
				BeanUtils.copyProperties(activeLoginDTO, logins);
				activeLoginList.add(activeLoginDTO);
			}
			return activeLoginList;
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@Override
	public ArrayList<UserDto> updateMyProfile(UserDto userDto) throws Exception {
		try {
			String hql = "update com.medialounge.reevo.entity.UserEntity set firstName = '"
					+ userDto.getFirstName()
					+ "', lastName = '"
					+ userDto.getLastName()
					+ "', phone = '"
					+ userDto.getPhone()
					+ "', country = '"
					+ userDto.getCountry()
					+ "', zipcode = '"
					+ userDto.getZipcode()
					+ "', latitude = '"
					+ userDto.getLatitude()
					+ "', longitude = '"
					+ userDto.getLongitude()
					+ "', nickName = '"
					+ userDto.getNickName()
					+ "', role = '"
					+ userDto.getRole()
					+ "', genre = '"
					+ userDto.getGenre()
					+ "' where email= '"
					+ userDto.getEmail() + "'";
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			query.executeUpdate();

		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<InspireDTO> getUsersInspireList(int userId)
			throws Exception {
		ArrayList<InspireDTO> inspireList = new ArrayList<InspireDTO>();
		try {
			List<InspireEntity> users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.InspireEntity where fromUserEntity.userId ="
									+ userId).list();
			for (InspireEntity user : users) {
				InspireDTO inspireDTO = new InspireDTO();
				BeanUtils.copyProperties(inspireDTO, user);
				inspireList.add(inspireDTO);
			}
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return inspireList;
	}

	@Override
	public String saveInspiredUser(int userId, String inspireUser)
			throws Exception {
		try {
			UserEntity fromUsEntity = new UserEntity();
			fromUsEntity.setUserId(userId);

			UserEntity toUserEntity = new UserEntity();
			int toId = Integer.parseInt(inspireUser);
			toUserEntity.setUserId(toId);

			InspireEntity inspireEntity = new InspireEntity();
			inspireEntity.setFromUserEntity(fromUsEntity);
			inspireEntity.setToUserEntity(toUserEntity);

			sessionFactory.getCurrentSession().saveOrUpdate(inspireEntity);
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return "Success";
	}

	@Override
	public String updateUserBio(UserDto userDto) throws Exception {
		String msg = "";
		try {
			String hql = "update com.medialounge.reevo.entity.UserEntity set bio =:bio where userId= "
					+ userDto.getUserId();
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql).setParameter("bio",
					userDto.getBio());
			int i = query.executeUpdate();
			if (i > 0) {
				msg = "Success";
			}
		} catch (Exception e) {
			msg = "Error in Bio Update";
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@Override
	public void deleteAllRecordsFromInspire(int userId) throws Exception {
		try {
			String hql = "delete from com.medialounge.reevo.entity.InspireEntity where fromUserEntity.userId= "
					+ userId;
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			query.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@Override
	public ArrayList<MonitorDTO> getMonitorExistingUsers(int userId,
			int oldModuleId) {
		ArrayList<MonitorDTO> monitorList = null;
		MonitorDTO monitorDTO = null;

		try {
			@SuppressWarnings("unchecked")
			List list = sessionFactory
					.getCurrentSession()
					.createQuery(
							"from com.medialounge.reevo.entity.MonitorEntity as m where m.userEntity.userId = "
									+ userId
									+ " and m.moduleEntity.moduleId = "
									+ oldModuleId).list();
			monitorList = new ArrayList<MonitorDTO>();
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				MonitorEntity entity = (MonitorEntity) iterator.next();
				monitorDTO = new MonitorDTO();
				BeanUtils.copyProperties(monitorDTO, entity);
				monitorList.add(monitorDTO);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return monitorList;
	}

	@Override
	public String updateMonitorExisingUsers(MonitorDTO monitorDTO) {
		int updatedRow = 0;
		String msg = "";
		try {
			query = sessionFactory.getCurrentSession().createQuery(
					"update MonitorEntity as m set m.timeSpend = "
							+ monitorDTO.getTimeSpend()
							+ " where m.monitorId = "
							+ monitorDTO.getMonitorId());
			query.executeUpdate();
			if (updatedRow > 0)
				msg = "monitor updated successfully";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@Override
	public String monitorPerModule(MonitorDTO monitorDTO) {
		String msg = "";
		try {
			MonitorEntity monitorEntity = new MonitorEntity();

			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(monitorDTO.getUserEntity().getUserId());
			monitorEntity.setUserEntity(userEntity);

			ModuleEntity moduleEntity = new ModuleEntity();
			moduleEntity
					.setModuleId(monitorDTO.getModuleEntity().getModuleId());
			monitorEntity.setModuleEntity(moduleEntity);

			monitorEntity.setTimeSpend(monitorDTO.getTimeSpend());

			sessionFactory.getCurrentSession().saveOrUpdate(monitorEntity);
			msg = "Successfully Saved";
		} catch (Exception e) {
			msg = "Error";
			e.printStackTrace();
		}
		return msg;
	}

	@Override
	public ArrayList<MonitorDTO> getMonitorDetailsPerModule() throws Exception {
		// select module_id,count(user_id),(sum(time_spend)/count(user_id)) as
		// avgs from monitor_per_module group by module_id;
		try {
			hql = "select m.moduleEntity.moduleId, count(m.userEntity.userId),(sum(m.timeSpend)/count(m.userEntity.userId)) FROM MonitorEntity m GROUP BY m.moduleEntity.moduleId";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			List list = query.list();
			ArrayList<MonitorDTO> monitorDTOs = new ArrayList<MonitorDTO>();
			MonitorDTO monitorDTO = null;

			for (int i = 0; i < list.size(); i++) {
				Object[] result = (Object[]) query.list().get(i);
				int j = 0;
				monitorDTO = new MonitorDTO();
				int moduleId = (int) result[j];
				j++;
				long userCount = (long) result[j];
				j++;
				long avg = (long) result[j];

				monitorDTO = new MonitorDTO();
				monitorDTO.setModuleId(moduleId);
				monitorDTO.setUserCount(userCount);
				monitorDTO.setAverage(avg);
				monitorDTOs.add(monitorDTO);
			}
			return monitorDTOs;
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@Override
	public String updateMonitorWeeklyAvg(ArrayList<MonitorDTO> monitorDTOs)
			throws Exception {

		try {
			String msg = "";
			int updatedRow = 0;
			ArrayList<MonitorDTO> moDtos = monitorDTOs;
			for (MonitorDTO monitorDTO : moDtos) {
				hql = "from MonitorEntityWeek m where m.moduleEntity.moduleId = "
						+ monitorDTO.getModuleId();
				Query query = sessionFactory.getCurrentSession().createQuery(
						hql);
				List list = query.list();
				if (list.size() > 0) {
					query = sessionFactory.getCurrentSession().createQuery(
							"update MonitorEntityWeek as m set m.userCount = "
									+ monitorDTO.getUserCount()
									+ ", m.weeklyAvg = "
									+ monitorDTO.getAverage()
									+ " where m.moduleEntity.moduleId = "
									+ monitorDTO.getModuleId());
					query.executeUpdate();
					if (updatedRow > 0)
						msg = "monitor updated successfully";
				} else {
					MonitorEntityWeek weekEntity = new MonitorEntityWeek();
					weekEntity.setUserCount(monitorDTO.getUserCount());

					ModuleEntity moduleEntity = new ModuleEntity();
					moduleEntity.setModuleId(monitorDTO.getModuleId());
					weekEntity.setModuleEntity(moduleEntity);

					weekEntity.setWeeklyAvg(monitorDTO.getAverage());

					sessionFactory.getCurrentSession().saveOrUpdate(weekEntity);
					msg = "monitor saved successfully";
				}
			}
			return msg;
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<UserDto> getUserProfileInfoByAboutId(int aboutUserId) {
		ArrayList<UserDto> userInfoList = null;
		try {
			List<UserEntity> users = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity as u WHERE  u.userId ="
									+ aboutUserId).list();
			userInfoList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				userInfoList.add(userDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfoList;
	}

	@Override
	public ArrayList<UserDto> searchUserByEmailOrName(String searchUser)
			throws Exception {
		ArrayList<UserDto> searchUserList = null;
		String query = "";
		query = "FROM com.medialounge.reevo.entity.UserEntity as u where u.firstName like '%"
				+ searchUser
				+ "%' OR u.lastName like '%"
				+ searchUser
				+ "%' OR u.email like '%"
				+ searchUser
				+ "%' AND email !='"
				+ MediaLoungeConstant.ADMIN + " '";
		try {
			List<UserEntity> users = sessionFactory.getCurrentSession()
					.createQuery(query).list();
			searchUserList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				searchUserList.add(userDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Exception");
		}
		return searchUserList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map loadBumpDetails(String userId) {

		Map details = new HashMap();
		ArrayList<UserDto> bumpList = new ArrayList<UserDto>();
		ArrayList<BumpDTO> bumpListdetails = new ArrayList<BumpDTO>();
		try {
			List<UserEntity> userList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"From com.medialounge.reevo.entity.UserEntity where email !='"
									+ MediaLoungeConstant.ADMIN
									+ "' and userId != " + userId).list();
			for (UserEntity userEntity : userList) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, userEntity);
				bumpList.add(userDto);
			}
			details.put("UserList", userList);
			List<BumpEntity> bumpDetails = sessionFactory
					.getCurrentSession()
					.createQuery(
							"From com.medialounge.reevo.entity.BumpEntity where fromUser = "
									+ userId + " or toUser = " + userId).list();
			for (BumpEntity bumpEntity : bumpDetails) {
				BumpDTO bumpDTO = new BumpDTO();
				BeanUtils.copyProperties(bumpDTO, bumpEntity);
				bumpListdetails.add(bumpDTO);
			}
			details.put("BumpList", bumpDetails);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return details;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void addNewBumpDetails(String userId, ArrayList str) {

		ArrayList userInDb = new ArrayList();
		List<BumpEntity> bumpDetails = sessionFactory
				.getCurrentSession()
				.createQuery(
						"From com.medialounge.reevo.entity.BumpEntity where fromUser= "
								+ userId + "  or toUser = " + userId
								+ " order by toUser ASC").list();
		for (BumpEntity bumpEntity1 : bumpDetails) {
			if ((bumpEntity1.getToUser()).getUserId() != Integer
					.parseInt(userId)) {
				userInDb.add((bumpEntity1.getToUser()).getUserId());
			} else {
				userInDb.add((bumpEntity1.getFromUser()).getUserId());
			}
			for (int i = 0; i < str.size(); i++) {
				bumpEntity = new BumpEntity();
				UserEntity userEntity = new UserEntity();
				userEntity.setUserId(Integer.parseInt(userId));
				bumpEntity.setFromUser(userEntity);

				UserEntity userEntity1 = new UserEntity();
				userEntity1.setUserId(Integer.parseInt((String) str.get(i)));
				bumpEntity.setToUser(userEntity1);
				if (str.get(++i).equals("favourite")) {
					bumpEntity.setFavourite("Y");
				} else {
					bumpEntity.setFavourite("N");

					bumpEntity.setMutual("Y");

				}
				if (i != (str.size() - 1)) {
					if (str.get(++i).equals(str.get(i - 2))) {
						if (str.get(++i).equals("mutual")) {
							bumpEntity.setMutual("Y");
						} else {
							bumpEntity.setMutual("N");
						}
					} else {
						--i;
						if (str.get(i).equals("mutual")) {
							bumpEntity.setMutual("Y");
						} else {
							bumpEntity.setMutual("N");
						}

					}
				}
				if (((bumpEntity.getFromUser()).getUserId() == (bumpEntity1
						.getFromUser()).getUserId() && (bumpEntity.getToUser())
						.getUserId() == (bumpEntity1.getToUser()).getUserId())
						|| ((bumpEntity.getToUser()).getUserId() == (bumpEntity1
								.getFromUser()).getUserId() && (bumpEntity
								.getFromUser()).getUserId() == (bumpEntity1
								.getToUser()).getUserId())) {
					if (bumpEntity1.getFavourite().equalsIgnoreCase(
							bumpEntity.getFavourite())
							&& bumpEntity1.getMutual().equalsIgnoreCase(
									bumpEntity.getMutual())) {

					} else {
						String hql = "update com.medialounge.reevo.entity.BumpEntity set favourite = '"
								+ bumpEntity.getFavourite()
								+ "', mutual = '"
								+ bumpEntity.getMutual()
								+ "' where ( fromUser= '"
								+ (bumpEntity.getFromUser()).getUserId()
								+ "'and toUser='"
								+ (bumpEntity.getToUser()).getUserId() + "')";
						Session session = sessionFactory.getCurrentSession();
						Query query = session.createQuery(hql);
						int z = query.executeUpdate();
						if (z == 0) {
							String hql1 = "update com.medialounge.reevo.entity.BumpEntity set favourite = '"
									+ bumpEntity.getFavourite()
									+ "', mutual = '"
									+ bumpEntity.getMutual()
									+ "' where ( fromUser= '"
									+ (bumpEntity.getToUser()).getUserId()
									+ "'and toUser='"
									+ (bumpEntity.getFromUser()).getUserId()
									+ "')";
							Session session1 = sessionFactory
									.getCurrentSession();
							Query query1 = session1.createQuery(hql1);
							query1.executeUpdate();
						}
					}
					break;
				}
			}
		}
		for (int i = 0; i < str.size(); i++) {
			bumpEntity = new BumpEntity();
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(Integer.parseInt(userId));
			bumpEntity.setFromUser(userEntity);

			UserEntity userEntity1 = new UserEntity();
			userEntity1.setUserId(Integer.parseInt((String) str.get(i)));
			bumpEntity.setToUser(userEntity1);
			if (str.get(++i).equals("favourite")) {
				bumpEntity.setFavourite("Y");
			} else {
				bumpEntity.setFavourite("N");

				bumpEntity.setMutual("Y");

			}
			if (i != (str.size() - 1)) {
				if (str.get(++i).equals(str.get(i - 2))) {
					if (str.get(++i).equals("mutual")) {
						bumpEntity.setMutual("Y");
					} else {
						bumpEntity.setMutual("N");
					}
				} else {
					--i;
					if (str.get(i).equals("mutual")) {
						bumpEntity.setMutual("Y");
					} else {
						bumpEntity.setMutual("N");
					}

				}
			} else {
				if (bumpEntity.getFavourite() == null) {
					bumpEntity.setFavourite("N");
				}
				if (bumpEntity.getMutual() == null) {
					bumpEntity.setMutual("N");
				}
			}
			if (userInDb.contains((bumpEntity.getToUser()).getUserId())) {

			} else {
				if (bumpEntity.getFavourite().equalsIgnoreCase("Y")
						|| bumpEntity.getMutual().equalsIgnoreCase("Y")) {

					sessionFactory.getCurrentSession().saveOrUpdate(bumpEntity);
				}
			}
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BumpDTO> checkfav(String userId) {

		ArrayList<BumpDTO> favourite = new ArrayList<BumpDTO>();
		int id = Integer.parseInt(userId);
		List<BumpEntity> bumpDetails = sessionFactory
				.getCurrentSession()
				.createQuery(
						"From com.medialounge.reevo.entity.BumpEntity where (toUser= "
								+ id
								+ " and favourite= 'Y' and favStatus is null) order by bumpId DESC")
				.list();
		try {
			for (BumpEntity bumpEntity : bumpDetails) {
				BumpDTO bumpDTO = new BumpDTO();
				BeanUtils.copyProperties(bumpDTO, bumpEntity);
				favourite.add(bumpDTO);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		return favourite;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BumpDTO> checkmutual(String userId) {

		ArrayList<BumpDTO> mutual = new ArrayList<BumpDTO>();
		List<BumpEntity> bumpDetails = sessionFactory
				.getCurrentSession()
				.createQuery(
						"From com.medialounge.reevo.entity.BumpEntity where (toUser= "
								+ userId
								+ " and mutual= 'Y' and mutualStatus is null) order by bumpId DESC")
				.list();
		try {
			for (BumpEntity bumpEntity : bumpDetails) {
				BumpDTO bumpDTO = new BumpDTO();
				BeanUtils.copyProperties(bumpDTO, bumpEntity);
				mutual.add(bumpDTO);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		return mutual;
	}

	@Override
	public String actionFavourites(String bumpId, String status) {

		String favourite = "Y";
		if (status.equalsIgnoreCase("no")) {
			favourite = "N";
		}
		String hql = "update com.medialounge.reevo.entity.BumpEntity set favStatus = '"
				+ status
				+ "', favourite = '"
				+ favourite
				+ "' where bumpId= '"
				+ bumpId + "'";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		return "success";
	}

	@Override
	public String actionMutual(String bumpId, String status) {

		String mutual = "Y";
		if (status.equalsIgnoreCase("no")) {
			mutual = "N";
		}
		String hql = "update com.medialounge.reevo.entity.BumpEntity set mutualStatus = '"
				+ status
				+ "', mutual = '"
				+ mutual
				+ "'where bumpId= '"
				+ bumpId + "'";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		return "success";
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BumpDTO> checkmaybe(String userId) {

		ArrayList<BumpDTO> maybe = new ArrayList<BumpDTO>();
		List<BumpEntity> bumpDetails = sessionFactory
				.getCurrentSession()
				.createQuery(
						"From com.medialounge.reevo.entity.BumpEntity where (toUser= "
								+ userId
								+ " and (mutualStatus = 'maybe' or favStatus ='maybe')) order by bumpId DESC")
				.list();
		try {
			for (BumpEntity bumpEntity : bumpDetails) {
				BumpDTO bumpDTO = new BumpDTO();
				BeanUtils.copyProperties(bumpDTO, bumpEntity);
				maybe.add(bumpDTO);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		return maybe;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BumpDTO> getfav(String userId) {

		ArrayList<BumpDTO> favourite = new ArrayList<BumpDTO>();
		int id = Integer.parseInt(userId);
		List<BumpEntity> bumpDetails = sessionFactory
				.getCurrentSession()
				.createQuery(
						"From com.medialounge.reevo.entity.BumpEntity where (toUser= "
								+ id
								+ " or fromUser= "
								+ id
								+ ") and (favourite= 'Y' and favStatus = 'yes') order by bumpId DESC")
				.list();
		try {
			for (BumpEntity bumpEntity : bumpDetails) {
				BumpDTO bumpDTO = new BumpDTO();
				BeanUtils.copyProperties(bumpDTO, bumpEntity);
				favourite.add(bumpDTO);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		return favourite;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BumpDTO> getmutual(String userId) {

		ArrayList<BumpDTO> mutual = new ArrayList<BumpDTO>();
		List<BumpEntity> bumpDetails = sessionFactory
				.getCurrentSession()
				.createQuery(
						"From com.medialounge.reevo.entity.BumpEntity where (toUser= "
								+ userId
								+ " or fromUser= "
								+ userId
								+ ")  and mutual= 'Y' and mutualStatus = 'yes') order by bumpId DESC")
				.list();
		try {
			for (BumpEntity bumpEntity : bumpDetails) {
				BumpDTO bumpDTO = new BumpDTO();
				BeanUtils.copyProperties(bumpDTO, bumpEntity);
				mutual.add(bumpDTO);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		return mutual;
	}

	// //code for new bump
	@Override
	public Map loadfriendListForFav(String userId) throws Exception {
		Map details = new HashMap();
		try {

			ArrayList<UserDto> bumpList = new ArrayList<UserDto>();
			ArrayList<BumpFavDTO> bumpFavList = new ArrayList<BumpFavDTO>();

			String sql = "(select u.user_id ,u.telephone,u.first_name,u.last_name,u.email,u.password,gender,u.dj,u.vs,u.journalist,u.anchor,u.photo_path,u.location,u.role,u.genre,u.bio,u.latitude,u.longitude,u.zipcode,u.nickname,u.profile_photo,u.age,u.birthday,u.status_message,u.unreadMessageCount From user as u where u.user_id NOT IN (select b.from_User FROM bump_favourite as b where (b.from_User = "
					+ userId
					+ " || b.to_User ="
					+ userId
					+ ") and b.favourite != 'N')  and u.user_id NOT IN (SELECT b.to_User FROM bump_favourite as b where (b.from_User = "
					+ userId
					+ " || b.to_User = "
					+ userId
					+ ") and b.favourite != 'N') and u.email !='"
					+ MediaLoungeConstant.ADMIN
					+ "'  and u.user_id != "
					+ userId + ")";
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
			query.addEntity(UserEntity.class);
			List<UserEntity> userList = query.list();
			for (UserEntity userEntity : userList) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, userEntity);
				bumpList.add(userDto);
			}
			details.put("UserList", userList);
			List<BumpFavEntity> favList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"From com.medialounge.reevo.entity.BumpFavEntity where fromUser = "
									+ userId + " OR toUser = " + userId).list();
			for (BumpFavEntity bumpFavEntity : favList) {
				BumpFavDTO bumpFavDTO = new BumpFavDTO();
				BeanUtils.copyProperties(bumpFavDTO, bumpFavEntity);
				bumpFavList.add(bumpFavDTO);
			}
			details.put("BumpFavList", bumpFavList);

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("EXCEPTION");
		}

		return details;
	}

	@Override
	public void addToFavourites(String from, String to, String type)
			throws Exception {
		try {
			bumpFavEntity = new BumpFavEntity();
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(Integer.parseInt(from));
			bumpFavEntity.setFromUser(userEntity);

			UserEntity userEntity1 = new UserEntity();
			userEntity1.setUserId(Integer.parseInt(to));
			bumpFavEntity.setToUser(userEntity1);
			if (type.equalsIgnoreCase("yes")) {
				bumpFavEntity.setFavourite("Y");
			}
			if (type.equalsIgnoreCase("maybe")) {
				bumpFavEntity.setFavourite("MB");
			}
			sessionFactory.getCurrentSession().saveOrUpdate(bumpFavEntity);

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map loadfriendListForMutual(String userId) {

		Map details = new HashMap();
		ArrayList<UserDto> bumpList = new ArrayList<UserDto>();
		ArrayList<BumpMutualDTO> bumpMutualList = new ArrayList<BumpMutualDTO>();
		try {
			List<UserEntity> userList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"From com.medialounge.reevo.entity.UserEntity where email !='"
									+ MediaLoungeConstant.ADMIN
									+ "' and userId != " + userId).list();
			for (UserEntity userEntity : userList) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, userEntity);
				bumpList.add(userDto);
			}
			details.put("UserList", userList);
			List<BumpMutualEntity> mutualList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"From com.medialounge.reevo.entity.BumpMutualEntity where fromUser = "
									+ userId + " OR toUser = " + userId).list();
			for (BumpMutualEntity bumpMutualEntity : mutualList) {
				BumpMutualDTO bumpMutualDTO = new BumpMutualDTO();
				BeanUtils.copyProperties(bumpMutualDTO, bumpMutualEntity);
				bumpMutualList.add(bumpMutualDTO);
			}
			details.put("BumpMutualList", bumpMutualList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return details;
	}

	@Override
	public void addMutual(String from, String to) {

		bumpMutualEntity = new BumpMutualEntity();
		UserEntity userEntity = new UserEntity();
		userEntity.setUserId(Integer.parseInt(from));
		bumpMutualEntity.setFromUser(userEntity);

		UserEntity userEntity1 = new UserEntity();
		userEntity1.setUserId(Integer.parseInt(to));
		bumpMutualEntity.setToUser(userEntity1);

		bumpMutualEntity.setMutual("Y");

		sessionFactory.getCurrentSession().saveOrUpdate(bumpMutualEntity);
	}

	@Override
	public String actionFavouriteBump(String bumpId, String status)
			throws Exception {

		try {
			String favourite = "Y";
			if (status.equalsIgnoreCase("no")) {
				favourite = "N";
			}
			String hql = "update com.medialounge.reevo.entity.BumpFavEntity set favStatus = '"
					+ status
					+ "', favourite = '"
					+ favourite
					+ "' where bumpId= '" + bumpId + "'";
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			query.executeUpdate();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@Override
	public String actionMutualBump(String bumpId, String status) {

		String mutual = "Y";
		if (status.equalsIgnoreCase("no")) {
			mutual = "N";
		}
		String hql = "update com.medialounge.reevo.entity.BumpMutualEntity set mutualStatus = '"
				+ status
				+ "', mutual = '"
				+ mutual
				+ "' where bumpId= '"
				+ bumpId + "'";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		return "success";
	}

	@Override
	public String changeMAYBE(String bumpId, String status) throws Exception {

		try {
			String action = "";
			if (status.equalsIgnoreCase("yes")) {
				action = "Y";
			}
			if (status.equalsIgnoreCase("no")) {
				action = "N";
			}
			String hql = "update com.medialounge.reevo.entity.BumpFavEntity set favourite = '"
					+ action + "' where bumpId= '" + bumpId + "'";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.executeUpdate();
			return "success";
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	@Override
	public String saveEditedOverViewData(int quickOverViewId,
			String overViewName, String desc, String functionWork,
			String whyToUse) throws Exception {
		String statusMsg = "";
		try {
			int noofRowsUpdated = 0;
			String hqlQuery = "update OverviewEntity OE set OE.description=:desc, OE.functionWork =:functionWork, OE.whyToUse =:whyToUse  where OE.overViewModulesEntity.quickOverViewModuleId= "
					+ quickOverViewId;

			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hqlQuery)
					.setParameter("desc", desc)
					.setParameter("functionWork", functionWork)
					.setParameter("whyToUse", whyToUse);

			noofRowsUpdated = query.executeUpdate();

			if (noofRowsUpdated > 0) {
				statusMsg = "Data is Modified Successfully";
			} else {
				statusMsg = "Data is Not Modified ";
			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return statusMsg;
	}

	@Override
	public ArrayList<OverviewDTO> getAllOverViewModulesById(int overViewId)
			throws Exception {
		ArrayList<OverviewDTO> overViewModulesArrList = new ArrayList<OverviewDTO>();
		try {

			String hqlQuery = "FROM OverViewModulesEntity  where quickOverViewModuleId="
					+ overViewId;
			List overViewModulesList = sessionFactory.getCurrentSession()
					.createQuery(hqlQuery).list();

			OverviewDTO overviewDTO = null;
			for (Iterator iterator = overViewModulesList.iterator(); iterator
					.hasNext();) {

				OverViewModulesEntity overViewModulesEntity = (OverViewModulesEntity) iterator
						.next();
				overviewDTO = new OverviewDTO();
				BeanUtils.copyProperties(overviewDTO, overViewModulesEntity);
				overViewModulesArrList.add(overviewDTO);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return overViewModulesArrList;
	}

	@Override
	public List<UserDto> listOfFavorites(int userId) throws Exception {
		ArrayList<UserDto> userFavoriteArrraylist = null;
		try {
			entity = new UserEntity(); // SELECT * FROM media WHERE user_id=1
										// ORDER BY created DESC LIMIT 5;
			hql = "from UserEntity";
			Query q = sessionFactory.getCurrentSession().createQuery(hql)
					.setFirstResult(0).setMaxResults(5);
			List userList = q.list();
			userFavoriteArrraylist = new ArrayList<UserDto>();
			for (Iterator iterator = userList.iterator(); iterator.hasNext();) {
				UserEntity userEntity = (UserEntity) iterator.next();
				userDto = new UserDto();
				BeanUtils.copyProperties(userDto, userEntity);
				userFavoriteArrraylist.add(userDto);
			}
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return userFavoriteArrraylist;
	}

	@Override
	public String saveStatus(String userId, String status) throws Exception {

		try {
			int noofRowsUpdated = 0;
			String hqlQuery = "update UserEntity u set  u.statusMessage=:status where u.userId= "
					+ userId;
			Query query = sessionFactory.getCurrentSession()
					.createQuery(hqlQuery).setParameter("status", status);
			noofRowsUpdated = query.executeUpdate();

			if (noofRowsUpdated > 0) {
				return "Success";
			} else {
				return "Failure";
			}
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public UserDto loginUserDetails(String userId) throws Exception {
		UserDto localUserDto = new UserDto();
		try {
			List<UserEntity> userList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity where userId ="
									+ userId).list();
			if (userList.size() > 0) {
				UserEntity userEntity = (UserEntity) userList.get(0);
				BeanUtils.copyProperties(localUserDto, userEntity);
			}
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
		return localUserDto;
	}
}
