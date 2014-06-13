package com.medialounge.reevo.daoImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.MediaDao;
import com.medialounge.reevo.dto.MediaDto;
import com.medialounge.reevo.dto.MediaReviewDTO;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.dto.UserFeedbackDTO;
import com.medialounge.reevo.entity.MediaCommentsEntity;
import com.medialounge.reevo.entity.MediaEntity;
import com.medialounge.reevo.entity.MediaReviewEntity;
import com.medialounge.reevo.entity.UserEntity;
import com.medialounge.reevo.entity.UserFeedbackEntity;
import com.medialounge.reevo.util.MediaLoungeConstant;

/**
 * @author Ramachandran R
 * 
 */
@Repository("mediaDao")
public class MediaDaoImpl implements MediaDao {

	private static final Logger logger = Logger.getLogger(MediaDaoImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	MediaDto mediaDto;
	MediaEntity mediaEntity;
	MediaCommentsEntity mediaCommentsEntity;
	private ArrayList<MediaDto> mediaDtos;

	UserDto userDto;
	private ArrayList<UserDto> userDtos;
	String hql = "";
	Criteria crit = null;

	public ArrayList<MediaDto> listOfMedias(MediaDto mediaDto) throws Exception {
		try {
			mediaEntity = new MediaEntity();
			if (mediaDto.getType().equals(MediaLoungeConstant.MY_FEED)
					|| mediaDto.getType().equals(MediaLoungeConstant.ARCHIVE)) {
				hql = "from MediaEntity mediaEntity where mediaEntity.userEntity.userId ='"
						+ mediaDto.getUserId()
						+ "' order by mediaEntity.created desc";
			} else {
				hql = "from MediaEntity mediaEntity order by mediaEntity.created desc";
			}
			Query q = sessionFactory.getCurrentSession().createQuery(hql);
			List mediaList = q.list();
			mediaDtos = new ArrayList<MediaDto>();
			for (Iterator iterator = mediaList.iterator(); iterator.hasNext();) {
				MediaEntity mediaEntity = (MediaEntity) iterator.next();
				mediaDto = new MediaDto();
				BeanUtils.copyProperties(mediaDto, mediaEntity);
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date = new Date();
				Date d = formatter.parse(mediaDto.getCreated());
				
				long diffTime = date.getTime() - d.getTime();
				long sec = diffTime / 1000;
				if (sec > 60) {
					long min = sec / 60;
					if (min > 60) {
						long hr = min / 60;
						if (hr > 24) {
							long day = hr / 24;
							if (day > 30) {
								long month = day / 30;
								if (month > 12) {
									int yr = (int) (month / 12);
									String years = yr + " years ago";
									mediaDto.setCreated(years);
								} else {
									String months = month + " months ago";
									mediaDto.setCreated(months);
								}
							} else {
								String days = day + " days ago";
								mediaDto.setCreated(days);
							}
						} else {
							String hour = hr + " hour ago";
							mediaDto.setCreated(hour);
						}
					} else {
						String minute = min + " mins ago";
						mediaDto.setCreated(minute);
					}
				} else {
					String seconds = sec + " secs ago";
					mediaDto.setCreated(seconds);
				}
				
				mediaDtos.add(mediaDto);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return mediaDtos;
	}

	public String saveMedia(MediaDto mediaDto, int userId) throws Exception {
		String msg = "";
		try {
			if (mediaDto.getMediaFmf().equalsIgnoreCase("true")) {
				mediaDto.setMediaFmf("Y");
			} else {
				mediaDto.setMediaFmf("N");
			}
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(userId);
			mediaDto.setUserEntity(userEntity);

			MediaEntity entity = new MediaEntity();
			BeanUtils.copyProperties(entity, mediaDto);
			sessionFactory.getCurrentSession().saveOrUpdate(entity);
			msg = "Successfully Updated.";
		} catch (Exception e) {
			msg = "Error in Updated.";
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return msg;
	}

	public ArrayList<MediaDto> searchBasedOnMediaType(String mediaSearchKey,
			String type, int userId) throws Exception {
		try {
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(userId);
			MediaEntity mEntity = new MediaEntity();
			mediaEntity.setUserEntity(userEntity);
			mediaDtos = new ArrayList<MediaDto>();
			String key = "'%" + mediaSearchKey + "%'";
			if (!mediaSearchKey.equals("")) {
				crit = sessionFactory.getCurrentSession().createCriteria(
						MediaEntity.class);
				Criterion rest1 = Restrictions.like("mediaSearchKey", "%"
						+ mediaSearchKey + "%");
				Criterion rest2 = Restrictions.like("mediaName", "%"
						+ mediaSearchKey + "%");
				crit.add(Restrictions.or(rest1, rest2));
				if (type.equals(MediaLoungeConstant.MY_FEED)) {
					mediaDtos = new ArrayList<MediaDto>();
					crit.add(Restrictions.eq("userEntity.userId", userId)); // mEntity.getUserEntity().getUserId()
					List list = (ArrayList<MediaDto>) crit.list();
					for (Iterator iterator = list.iterator(); iterator
							.hasNext();) {
						MediaEntity mediaEntity = (MediaEntity) iterator.next();
						mediaDto = new MediaDto();
						BeanUtils.copyProperties(mediaDto, mediaEntity);
						mediaDtos.add(mediaDto);
					}
				} else if (type.equals(MediaLoungeConstant.MEGA_FEED)) {
					mediaDtos = new ArrayList<MediaDto>();
					List list = (ArrayList<MediaDto>) crit.list();
					for (Iterator iterator = list.iterator(); iterator
							.hasNext();) {
						MediaEntity mediaEntity = (MediaEntity) iterator.next();
						mediaDto = new MediaDto();
						BeanUtils.copyProperties(mediaDto, mediaEntity);
						mediaDtos.add(mediaDto);
					}
				} else if (type.equals(MediaLoungeConstant.SOCIAL_FEED)) {
					String sql = "from UserEntity as u where u.userId in (select c.fromUserId  from ContactEntity as c where c.toUserId = '"
							+ userId
							+ "' and c.status = 'active') or u.userId in (select c.toUserId  from ContactEntity as c where c.fromUserId = '"
							+ userId
							+ "' and c.status = 'active') or ( u.userId = '"
							+ userId + "'))";
					Query qq = sessionFactory.getCurrentSession().createQuery(
							sql);
					List userEntityArr = qq.list();
					if (userEntityArr.size() > 0) {
						for (Iterator userEntityIttr = userEntityArr.iterator(); userEntityIttr
								.hasNext();) {
							int uId = ((UserEntity) userEntityIttr.next())
									.getUserId();
							hql = "from MediaEntity mediaEntity where mediaEntity.userEntity.userId = "
									+ uId
									+ " and ( mediaEntity.mediaSearchKey like "
									+ key
									+ " or mediaEntity.mediaName like "
									+ key + " )";
							Query q = sessionFactory.getCurrentSession()
									.createQuery(hql);
							List mediaList = q.list();
							for (Iterator iterator = mediaList.iterator(); iterator
									.hasNext();) {
								MediaEntity mediaEntity = (MediaEntity) iterator
										.next();
								mediaDto = new MediaDto();
								BeanUtils.copyProperties(mediaDto, mediaEntity);
								mediaDtos.add(mediaDto);
							}
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return mediaDtos;
	}

	/*public List<MediaDto> listOfComments(List<MediaDto> mediaDtoParam) {
		mediaDtos = new ArrayList<MediaDto>();
		
		 * try { for (MediaDto media : mediaDtoParam) { hql =
		 * "from MediaCommentsEntity as comments  where comments.mediaId = " +
		 * media.getMediaId(); Query q =
		 * sessionFactory.getCurrentSession().createQuery(hql); List commets =
		 * q.list();
		 * 
		 * for (Iterator iterator = commets.iterator(); iterator.hasNext();) {
		 * MediaCommentsEntity commentsEntity = (MediaCommentsEntity) iterator
		 * .next(); mediaDto = new MediaDto();
		 * BeanUtils.copyProperties(mediaDto, commentsEntity); List userNameList
		 * = sessionFactory .getCurrentSession() .createQuery(
		 * "from UserEntity as u where u.userId = " + mediaDto.getFromUserId() +
		 * "") .list(); if ((userNameList.iterator()).hasNext()) {
		 * mediaDto.setUsername(((UserEntity) (userNameList
		 * .iterator()).next()).getEmail()); } mediaDtos.add(mediaDto); } }
		 * 
		 * } catch (Exception e) { e.printStackTrace(); }
		 
		return mediaDtos;
	}
*/
	/*public ArrayList<MediaDto> addMediaComment(MediaDto mediaDto) {
		String sql = "";
		try {
			MediaCommentsEntity mediaCommentsEntity = new MediaCommentsEntity();
			BeanUtils.copyProperties(mediaCommentsEntity, mediaDto);
			sessionFactory.getCurrentSession()
					.saveOrUpdate(mediaCommentsEntity);

			hql = "from MediaCommentsEntity  as m where m.mediaId = '"
					+ mediaDto.getMediaId() + "'";
			Query q = sessionFactory.getCurrentSession().createQuery(hql);
			mediaDtos = new ArrayList<MediaDto>();
			List userComments = q.list();
			for (Iterator iterator = userComments.iterator(); iterator
					.hasNext();) {
				MediaCommentsEntity commEntity = (MediaCommentsEntity) iterator
						.next();
				mediaDto = new MediaDto();
				BeanUtils.copyProperties(mediaDto, commEntity);

				List userList = sessionFactory
						.getCurrentSession()
						.createQuery(
								"from UserEntity as user where user.userId = "
										+ mediaDto.getFromUserId()).list();
				for (Iterator ittr = userList.iterator(); ittr.hasNext();) {
					mediaDto.setUsername(((UserEntity) ittr.next()).getEmail());
				}

				mediaDtos.add(mediaDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mediaDtos;
	}*/

	/*public void addMediaAccessUser(MediaDto mediaDto) {
		try {
			MediaAccessUserEntity entity = new MediaAccessUserEntity();
			BeanUtils.copyProperties(entity, mediaDto);
			sessionFactory.getCurrentSession().saveOrUpdate(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/

	/*public ArrayList<MediaDto> listOfAccessUser(MediaDto mediaDto) {
		String sql = "from MediaEntity me where me.userId ='"
				+ mediaDto.getUserId() + "'";
		String hql = "";
		mediaDtos = new ArrayList<MediaDto>();
		try {
			Query qq = sessionFactory.getCurrentSession().createQuery(sql);
			List idList = qq.list();
			for (Iterator it = idList.iterator(); it.hasNext();) {
				hql = "from MediaAccessUserEntity m where m.mediaId ="
						+ ((MediaEntity) it.next()).getMediaId() + "";
				Query q = sessionFactory.getCurrentSession().createQuery(hql);
				List list = q.list();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					MediaAccessUserEntity mac = (MediaAccessUserEntity) iterator
							.next();
					mediaDto = new MediaDto();
					BeanUtils.copyProperties(mediaDto, mac);
					mediaDtos.add(mediaDto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mediaDtos;
	}*/

	/*public String checkNumber(String name) {
		int record = 0;
		String status = "";
		try {
			String hql = "from NumberEntity numberEntity where numberEntity.userNumber ='"
					+ name + "'";
			record = sessionFactory.getCurrentSession().createQuery(hql).list()
					.size();
			if (record <= 0) {
				status = "Not User Number";
			} else {
				status = "Already Used Number";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}*/

	/*public void savePaidContent(MediaDto mediaDto) {
		try {
			PaidContentEntity entity = new PaidContentEntity();
			BeanUtils.copyProperties(entity, mediaDto);
			sessionFactory.getCurrentSession().saveOrUpdate(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/

	public ArrayList<MediaDto> listOfSocialMedias(MediaDto mediaDto) throws Exception {
		
		String sql = "from UserEntity as u where u.userId in (select c.fromUserId  from ContactEntity as c where c.toUserId = '"
				+ mediaDto.getUserId()
				+ "' and c.status = 'active') or u.userId in (select c.toUserId  from ContactEntity as c where c.fromUserId = '"
				+ mediaDto.getUserId() + "' and c.status = 'active')";
		String hql = "";
		mediaDtos = new ArrayList<MediaDto>();
		try {
			Query qq = sessionFactory.getCurrentSession().createQuery(sql);
			List userEntityArr = qq.list();
			if (userEntityArr.size() > 0) {
				for (Iterator userEntityIttr = userEntityArr.iterator(); userEntityIttr
						.hasNext();) {
					hql = "from MediaEntity mediaEntity where mediaEntity.userEntity.userId = "
							+ ((UserEntity) userEntityIttr.next()).getUserId()
							+ " or mediaEntity.userEntity.userId = "
							+ mediaDto.getUserId()
							+ " order by mediaEntity.created desc";
					Query q = sessionFactory.getCurrentSession().createQuery(
							hql);
					List mediaList = q.list();
					for (Iterator iterator = mediaList.iterator(); iterator
							.hasNext();) {
						MediaEntity mediaEntity = (MediaEntity) iterator.next();
						mediaDto = new MediaDto();
						BeanUtils.copyProperties(mediaDto, mediaEntity);
						
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Date date = new Date();
						Date d = formatter.parse(mediaDto.getCreated());
						
						long diffTime = date.getTime() - d.getTime();
						long sec = diffTime / 1000;
						if (sec > 60) {
							long min = sec / 60;
							if (min > 60) {
								long hr = min / 60;
								if (hr > 24) {
									long day = hr / 24;
									if (day > 30) {
										long month = day / 30;
										if (month > 12) {
											int yr = (int) (month / 12);
											String years = yr + " years ago";
											mediaDto.setCreated(years);
										} else {
											String months = month + " months ago";
											mediaDto.setCreated(months);
										}
									} else {
										String days = day + " days ago";
										mediaDto.setCreated(days);
									}
								} else {
									String hour = hr + " hour ago";
									mediaDto.setCreated(hour);
								}
							} else {
								String minute = min + " mins ago";
								mediaDto.setCreated(minute);
							}
						} else {
							String seconds = sec + " secs ago";
							mediaDto.setCreated(seconds);
						}
						
						
						mediaDtos.add(mediaDto);
					}
				}
			} else {
				hql = "from MediaEntity mediaEntity where mediaEntity.userEntity.userId = "
						+ mediaDto.getUserId()
						+ " order by mediaEntity.created desc";
				Query q = sessionFactory.getCurrentSession().createQuery(hql);
				List mediaList = q.list();
				for (Iterator iterator = mediaList.iterator(); iterator
						.hasNext();) {
					MediaEntity mediaEntity = (MediaEntity) iterator.next();
					mediaDto = new MediaDto();
					BeanUtils.copyProperties(mediaDto, mediaEntity);
					
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date date = new Date();
					Date d = formatter.parse(mediaDto.getCreated());
					
					long diffTime = date.getTime() - d.getTime();
					long sec = diffTime / 1000;
					if (sec > 60) {
						long min = sec / 60;
						if (min > 60) {
							long hr = min / 60;
							if (hr > 24) {
								long day = hr / 24;
								if (day > 30) {
									long month = day / 30;
									if (month > 12) {
										int yr = (int) (month / 12);
										String years = yr + " years ago";
										mediaDto.setCreated(years);
									} else {
										String months = month + " months ago";
										mediaDto.setCreated(months);
									}
								} else {
									String days = day + " days ago";
									mediaDto.setCreated(days);
								}
							} else {
								String hour = hr + " hour ago";
								mediaDto.setCreated(hour);
							}
						} else {
							String minute = min + " mins ago";
							mediaDto.setCreated(minute);
						}
					} else {
						String seconds = sec + " secs ago";
						mediaDto.setCreated(seconds);
					}
					
					mediaDtos.add(mediaDto);
				}
			}
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return mediaDtos;
	}

	public ArrayList<UserDto> getExpert(String userId) {
		// hql =
		// "from UserEntity u where u.dj = 'Y' or u.vs = 'Y' or u.journalist = 'Y' or u.anchor= 'Y' ";
		hql = "from UserEntity u where u.userId !="
				+ userId
				+ " and ( u.dj = 'Y' or u.vs = 'Y' or u.journalist = 'Y' or u.anchor= 'Y' )";
		try {
			Query q = sessionFactory.getCurrentSession().createQuery(hql);
			List expertList = q.list();
			userDtos = new ArrayList<UserDto>();
			for (Iterator iterator = expertList.iterator(); iterator.hasNext();) {
				UserEntity userEntity = (UserEntity) iterator.next();
				userDto = new UserDto();
				BeanUtils.copyProperties(userDto, userEntity);
				userDtos.add(userDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userDtos;
	}

	public boolean saveCommentsToExpert(UserDto userDto) {
		boolean check = false;
		try {
			for (int i = 0; i < userDto.getDjvalues().length; i++) {
				String[] dj = userDto.getDjvalues()[i].split(",");
				userDto.setUserId(Integer.parseInt(dj[0]));
				userDto.setType("DJ");
				userDto.setReviewStatus("Viewed");
				MediaReviewEntity entity = new MediaReviewEntity();
				BeanUtils.copyProperties(entity, userDto);
				sessionFactory.getCurrentSession().saveOrUpdate(entity);
				check = true;
			}
			for (int i = 0; i < userDto.getVsValues().length; i++) {
				String[] vs = userDto.getVsValues()[i].split(",");
				userDto.setUserId(Integer.parseInt(vs[0]));
				userDto.setType("VS");
				// userDto.setComments("test");
				userDto.setReviewStatus("Viewed");
				MediaReviewEntity entity = new MediaReviewEntity();
				BeanUtils.copyProperties(entity, userDto);
				sessionFactory.getCurrentSession().saveOrUpdate(entity);
				check = true;
			}
			for (int i = 0; i < userDto.getJournalistValues().length; i++) {
				String[] journalist = userDto.getJournalistValues()[i]
						.split(",");
				userDto.setUserId(Integer.parseInt(journalist[0]));
				userDto.setType("Journalist");
				userDto.setReviewStatus("Viewed");
				MediaReviewEntity entity = new MediaReviewEntity();
				BeanUtils.copyProperties(entity, userDto);
				sessionFactory.getCurrentSession().saveOrUpdate(entity);
				check = true;
			}
			for (int i = 0; i < userDto.getAnchorValues().length; i++) {
				String[] anchor = userDto.getAnchorValues()[i].split(",");
				userDto.setUserId(Integer.parseInt(anchor[0]));
				userDto.setType("Anchor");
				// userDto.setComments("success");
				userDto.setReviewStatus("Viewed");
				MediaReviewEntity entity = new MediaReviewEntity();
				BeanUtils.copyProperties(entity, userDto);
				sessionFactory.getCurrentSession().saveOrUpdate(entity);
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public ArrayList<UserDto> viewCommantsList(String mediaId) { // is not null
		hql = "from MediaReviewEntity m where m.mediaId = " + mediaId; // + " and m.comments != null";
		try {
			Query qry = sessionFactory.getCurrentSession().createQuery(hql);
			List list = qry.list();
			userDtos = new ArrayList<UserDto>();
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				MediaReviewEntity entity = (MediaReviewEntity) iterator.next();
				userDto = new UserDto();
				BeanUtils.copyProperties(userDto, entity);
				List userNameList = sessionFactory
						.getCurrentSession()
						.createQuery(
								"from UserEntity as u where u.userId = "
										+ userDto.getReviewerUserId() + "")
						.list();
				if ((userNameList.iterator()).hasNext()) {
					userDto.setEmail(((UserEntity) (userNameList.iterator())
							.next()).getEmail());
				}
				userDtos.add(userDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return userDtos;
	}

	@Override
	public String saveUserComment(MediaReviewDTO mediaReviewDTO) throws Exception{
		String msg = "Fail";
		try {
			mediaReviewDTO.setReviewStatus("Viewed");
			MediaReviewEntity mediaReviewEntity = new MediaReviewEntity();
			BeanUtils.copyProperties(mediaReviewEntity, mediaReviewDTO);
			sessionFactory.getCurrentSession().saveOrUpdate(mediaReviewEntity);
			msg = "Success";
		} catch (Exception e) {
			msg = "fail";
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@Override
	public List<MediaDto> getListOfKeys(int userId) throws Exception {
		try {
			mediaDtos = new ArrayList<MediaDto>();

			// for checking fmf already available or not in the user
			String fmfCheck = "";
			String fmf = "from MediaEntity as mediaEntity where mediaEntity.userEntity.userId="
					+ userId + "and mediaEntity.mediaFmf='Y'";
			List qry = sessionFactory.getCurrentSession().createQuery(fmf)
					.list();
			if (qry.size() > 0) {
				fmfCheck = "Y";
			} else {
				fmfCheck = "N";
			}
			// getting all key
			hql = "from MediaEntity as mediaEntity";
			List keys = sessionFactory.getCurrentSession().createQuery(hql)
					.list();
			for (Iterator iterator = keys.iterator(); iterator.hasNext();) {
				MediaEntity entity = (MediaEntity) iterator.next();
				mediaDto = new MediaDto();
				mediaDto.setFmfCheck(fmfCheck);
				BeanUtils.copyProperties(mediaDto, entity);
				mediaDtos.add(mediaDto);
			}
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return mediaDtos;
	}

	
	@Override
	public Map getSpotLightDetails(String userId) throws Exception{
		Map mediaSpotLight = new HashMap();
		ArrayList<MediaReviewDTO> reviewList = new ArrayList<MediaReviewDTO>();
		ArrayList<UserDto> userList = new ArrayList<UserDto>();
		ArrayList<MediaDto> mediaList = new ArrayList<MediaDto>();
		try {
			List<MediaReviewEntity> spotLight = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.MediaReviewEntity where type='journalist' and publish = 'YY' and (reviewerUserId ="
									+ userId + "or userId=" + userId + ")").list();
			for (MediaReviewEntity mediaR : spotLight) {
				MediaReviewDTO mediaReviewDTO = new MediaReviewDTO();
				BeanUtils.copyProperties(mediaReviewDTO, mediaR);
				reviewList.add(mediaReviewDTO);
			}
			mediaSpotLight.put("mediaReview", reviewList);
			mediaSpotLight.put("loginUser", userList);
			mediaSpotLight.put("media", mediaList);
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return mediaSpotLight;
	}

	@Override
	public List<UserDto> getExpertCommentsList(String mediaId, String expertType) {
		hql = "from MediaReviewEntity m where m.mediaId = " + mediaId
				+ " and m.type ='" + expertType + "'";
		try {
			Query qry = sessionFactory.getCurrentSession().createQuery(hql);
			List list = qry.list();
			userDtos = new ArrayList<UserDto>();
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				MediaReviewEntity entity = (MediaReviewEntity) iterator.next();
				userDto = new UserDto();
				BeanUtils.copyProperties(userDto, entity);
				List userNameList = sessionFactory
						.getCurrentSession()
						.createQuery(
								"from UserEntity as u where u.userId = "
										+ userDto.getReviewerUserId() + "")
						.list();
				if ((userNameList.iterator()).hasNext()) {
					userDto.setEmail(((UserEntity) (userNameList.iterator())
							.next()).getEmail());
				}
				userDtos.add(userDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userDtos;
	}

	/*
	 * @Override public ArrayList<UserFeedbackDTO> getFeedbackByMediaId(int
	 * mediaId) { ArrayList<UserFeedbackDTO> list = new
	 * ArrayList<UserFeedbackDTO>(); UserFeedbackDTO userFeedbackDTO = null; try
	 * { List jobList = sessionFactory .getCurrentSession() .createQuery(
	 * "FROM com.medialounge.reevo.entity.UserFeedbackEntity where mediaId=" +
	 * mediaId).list();
	 * 
	 * for (Iterator jobEntityIttr = jobList.iterator();
	 * jobEntityIttr.hasNext();) { userFeedbackDTO = new UserFeedbackDTO();
	 * BeanUtils.copyProperties(userFeedbackDTO, (UserFeedbackEntity)
	 * jobEntityIttr.next()); list.add(userFeedbackDTO); } } catch (Exception e)
	 * { e.printStackTrace(); } return list; }
	 */

	@Override
	public ArrayList<UserFeedbackDTO> getFeedbackByMediaId(int mediaId) {
		ArrayList<UserFeedbackDTO> lists = null;
		UserFeedbackDTO userFeedbackDTO = null;
		Session session;
		try {

			session = sessionFactory.getCurrentSession();
			/*
			 * Query query = session.createQuery(
			 * "select count(distinct userId) FROM com.medialounge.reevo.entity.UserFeedbackEntity where mediaId=90"
			 * );
			 */

			String usersCountHql = "select count(userId) FROM com.medialounge.reevo.entity.UserFeedbackEntity where mediaId="
					+ mediaId;
			String redColorHql = "select count(colour) FROM com.medialounge.reevo.entity.UserFeedbackEntity where colour='red' and mediaId="
					+ mediaId;
			String greenColorHql = "select count(colour) FROM com.medialounge.reevo.entity.UserFeedbackEntity where colour='green' and mediaId="
					+ mediaId;
			String amberColorHql = "select count(colour) FROM com.medialounge.reevo.entity.UserFeedbackEntity where colour='amber' and mediaId="
					+ mediaId;

			Query usersCountquery = session.createQuery(usersCountHql);
			Long usersCount = (Long) usersCountquery.uniqueResult();

			Query redColorquery = session.createQuery(redColorHql);
			long redColorCount = (long) redColorquery.uniqueResult();

			Query greenColorquery = session.createQuery(greenColorHql);
			long greenColorCount = (long) greenColorquery.uniqueResult();

			Query amberColorquery = session.createQuery(amberColorHql);
			long amberColorCount = (long) amberColorquery.uniqueResult();

			// *****
			String bgColour = "";

			if (redColorCount > greenColorCount
					&& redColorCount > amberColorCount) {
				bgColour = "red";

			} else if (greenColorCount > amberColorCount) {
				bgColour = "green";
			} else {
				bgColour = "#FFC200";
			}

			List jobList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserFeedbackEntity where mediaId="
									+ mediaId).list();
			lists = new ArrayList<UserFeedbackDTO>();
			for (Iterator jobEntityIttr = jobList.iterator(); jobEntityIttr
					.hasNext();) {
				userFeedbackDTO = new UserFeedbackDTO();
				userFeedbackDTO.setUsersCount(usersCount);
				// **
				userFeedbackDTO.setBgColor(bgColour);
				BeanUtils.copyProperties(userFeedbackDTO,
						(UserFeedbackEntity) jobEntityIttr.next());
				/* userFeedbackDTO.setColour(colour); */
				lists.add(userFeedbackDTO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists;
	}

	@Override
	public String saveFeedback(UserFeedbackDTO feedbackDTO) {
		String msg = "Fail";
		try {
			UserFeedbackEntity entity = new UserFeedbackEntity();
			BeanUtils.copyProperties(entity, feedbackDTO);
			sessionFactory.getCurrentSession().saveOrUpdate(entity);
			msg = "feedback saved";
		} catch (Exception e) {
			msg = "Fail";
			e.printStackTrace();
		}
		return msg;
	}

	@Override
	public List<MediaDto> listOfMediasFMF(MediaDto mediaDto) throws Exception {
		try {
			mediaEntity = new MediaEntity();
			hql = "from MediaEntity mediaEntity where mediaEntity.mediaFmf='Y'";
			List fmfList = sessionFactory.getCurrentSession().createQuery(hql)
					.list();
			mediaDtos = new ArrayList<MediaDto>();
			for (Iterator iterator = fmfList.iterator(); iterator.hasNext();) {
				MediaEntity entity = (MediaEntity) iterator.next();
				mediaDto = new MediaDto();
				BeanUtils.copyProperties(mediaDto, entity);
				mediaDtos.add(mediaDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mediaDtos;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map getCharts() throws Exception{

		List<MediaDto> medias = new ArrayList<MediaDto>();
		//List<UserDto> users = new ArrayList<UserDto>();
		Map chart = new HashMap();
		try {
			List<MediaEntity> mediaList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.MediaEntity where contentType = 'video/mp4' OR contentType = 'video/mpeg' OR contentType = 'video/ogg' OR contentType = 'video/quicktime' OR contentType = 'video/webm' OR contentType = 'video/x-matroska' OR contentType = 'video/x-flv' OR contentType = 'video/xflv' OR contentType = 'audio/mpeg' OR contentType = 'audio/mp3' OR contentType = 'audio/basic' OR contentType = 'audio/L24' OR contentType = 'audio/ogg' OR contentType = 'audio/vorbis' OR contentType = 'audio/vnd.rn-realaudio' OR contentType = 'audio/vnd.wave' OR contentType = 'audio/webm'  OR contentType = 'video/x-ms-wmv' OR contentType ='image/jpeg' OR contentType ='image/pjpeg' OR contentType ='image/gif' OR contentType ='image/png' OR contentType ='image/jpg' OR contentType ='image/tiff' OR contentType ='image/svg+xml' order by created DESC")
					.list();
			for (MediaEntity mediaEntity : mediaList) {
				MediaDto mediaDto = new MediaDto();
				BeanUtils.copyProperties(mediaDto, mediaEntity);
				medias.add(mediaDto);
				/*
				 * String userId = mediaDto.getUserId() +""; List<UserEntity>
				 * userList = sessionFactory .getCurrentSession() .createQuery(
				 * "FROM com.medialounge.reevo.entity.UserEntity where userId =' "
				 * +userId +"'").list(); for (UserEntity userEntity : userList)
				 * { UserDto userDto = new UserDto();
				 * BeanUtils.copyProperties(userDto, userEntity);
				 * users.add(userDto); }
				 */
				if (medias.size() == 10) {
					break;
				}
			}
			chart.put("media", medias);
		//	chart.put("user", users);
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}

		return chart;

	}

	@SuppressWarnings("unchecked")
	@Override
	public Map loadPopularVideos() throws Exception{

		List<MediaDto> medias = new ArrayList<MediaDto>();
		//List<UserDto> users = new ArrayList<UserDto>();
		Map chart = new HashMap();
		try {
			List<MediaEntity> mediaList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.MediaEntity where (contentType = 'video/mp4' OR contentType = 'video/mpeg' OR contentType = 'video/ogg' OR contentType = 'video/quicktime' OR contentType = 'video/webm' OR contentType = 'video/x-matroska' OR contentType = 'video/x-flv' OR contentType = 'video/xflv' OR contentType = 'audio/mpeg' OR contentType = 'audio/mp3' OR contentType = 'audio/basic' OR contentType = 'audio/L24' OR contentType = 'audio/ogg' OR contentType = 'audio/vorbis' OR contentType = 'audio/vnd.rn-realaudio' OR contentType = 'audio/vnd.wave' OR contentType = 'audio/webm'  OR contentType = 'video/x-ms-wmv' OR contentType ='image/jpeg' OR contentType ='image/pjpeg' OR contentType ='image/gif' OR contentType ='image/png' OR contentType ='image/jpg' OR contentType ='image/tiff' OR contentType ='image/svg+xml') and (ratingAverage > 0) order by ratingAverage DESC")
					.list();
			if (mediaList.size() > 0) {
				for (MediaEntity mediaEntity : mediaList) {
					MediaDto mediaDto = new MediaDto();
					BeanUtils.copyProperties(mediaDto, mediaEntity);
					medias.add(mediaDto);
					/*String userId = mediaDto.getUserId() + "";
					List<UserEntity> userList = sessionFactory
							.getCurrentSession()
							.createQuery(
									"FROM com.medialounge.reevo.entity.UserEntity where userId =' "
											+ userId + "'").list();
					for (UserEntity userEntity : userList) {
						UserDto userDto = new UserDto();
						BeanUtils.copyProperties(userDto, userEntity);
						users.add(userDto);
					}*/
					if (medias.size() == 10) {
						break;
					}
				}
				chart.put("media", medias);
			//	chart.put("user", users);
			} else {
				List<MediaEntity> mediaList1 = sessionFactory
						.getCurrentSession()
						.createQuery(
								"FROM com.medialounge.reevo.entity.MediaEntity where (contentType = 'video/mp4' OR contentType = 'video/mpeg' OR contentType = 'video/ogg' OR contentType = 'video/quicktime' OR contentType = 'video/webm' OR contentType = 'video/x-matroska' OR contentType = 'video/x-flv' OR contentType = 'video/xflv' OR contentType = 'audio/mpeg' OR contentType = 'audio/mp3' OR contentType = 'audio/basic' OR contentType = 'audio/L24' OR contentType = 'audio/ogg' OR contentType = 'audio/vorbis' OR contentType = 'audio/vnd.rn-realaudio' OR contentType = 'audio/vnd.wave' OR contentType = 'audio/webm'  OR contentType = 'video/x-ms-wmv' OR contentType ='image/jpeg' OR contentType ='image/pjpeg' OR contentType ='image/gif' OR contentType ='image/png' OR contentType ='image/jpg' OR contentType ='image/tiff' OR contentType ='image/svg+xml') order by created DESC")
						.list();
				for (MediaEntity mediaEntity : mediaList1) {
					MediaDto mediaDto = new MediaDto();
					BeanUtils.copyProperties(mediaDto, mediaEntity);
					medias.add(mediaDto);
					/*String userId = mediaDto.getUserId() + "";
					List<UserEntity> userList = sessionFactory
							.getCurrentSession()
							.createQuery(
									"FROM com.medialounge.reevo.entity.UserEntity where userId =' "
											+ userId + "'").list();
					for (UserEntity userEntity : userList) {
						UserDto userDto = new UserDto();
						BeanUtils.copyProperties(userDto, userEntity);
						users.add(userDto);
					}*/
					if (medias.size() == 10) {
						break;
					}
				}
				chart.put("media", medias);
			//	chart.put("user", users);
			}
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}

		return chart;
	}

	@Override
	public String mediasUpdateRating(int mediaId, int ratingCurrentValue,
			int countOfUsersRated, double ratingAverage) throws Exception {
		
		try {
			Query query = sessionFactory.getCurrentSession().createQuery(
					"update MediaEntity as m set m.ratingCurrentValue = "
							+ ratingCurrentValue + ",  m.countOfUsersRated = "
							+ countOfUsersRated + ", m.ratingAverage = "
							+ ratingAverage + " where m.mediaId = " + mediaId);
			int indRowUpdate = query.executeUpdate();
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "success";
	}

	@Override
	public MediaDto mediasGetRating(String mediaId) throws Exception {
		MediaDto mDto = new MediaDto();
		try {
			MediaDto dtto = new MediaDto();

			hql = "from MediaEntity mediaEntity where mediaEntity.mediaId = "
					+ mediaId;
			List list = sessionFactory.getCurrentSession().createQuery(hql)
					.list();
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				MediaEntity mediaEntity = (MediaEntity) iterator.next();
				mDto.setRatingCurrentValue(mediaEntity.getRatingCurrentValue());
				mDto.setCountOfUsersRated(mediaEntity.getCountOfUsersRated());
				mDto.setRatingAverage(mediaEntity.getRatingAverage());
			}

		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return mDto;
	}

	@Override
	public List<MediaDto> feedBackKeys(int mediaId) {
		try {
			mediaDtos = new ArrayList<MediaDto>();

			// getting all keys of particular Feed
			hql = "from MediaEntity as mediaEntity where mediaEntity.mediaId="
					+ mediaId;

			List keys = sessionFactory.getCurrentSession().createQuery(hql)
					.list();
			for (Iterator iterator = keys.iterator(); iterator.hasNext();) {
				MediaEntity entity = (MediaEntity) iterator.next();
				mediaDto = new MediaDto();
				BeanUtils.copyProperties(mediaDto, entity);
				mediaDtos.add(mediaDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mediaDtos;
	}

	@Override
	public int fmfActivation(int userId, int mediaId) throws Exception {
		int numberOfRowUpdate = 0;
		try {
			Query qry = sessionFactory
					.getCurrentSession()
					.createQuery(
							"update MediaEntity as mediaEntity set mediaEntity.mediaFmf = 'N' where mediaEntity.userEntity.userId = "
									+ userId);
			qry.executeUpdate();

			Query query = sessionFactory
					.getCurrentSession()
					.createQuery(
							"update MediaEntity as mediaEntity set mediaEntity.mediaFmf = 'Y' where mediaEntity.mediaId = "
									+ mediaId);
			numberOfRowUpdate = query.executeUpdate();
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return numberOfRowUpdate;
	}

	public List<MediaDto> getMediaDetails(int mediaId) throws Exception {
		try {
			mediaDtos = new ArrayList<MediaDto>();
			hql = "from MediaEntity as mediaEntity where mediaEntity.mediaId="
					+ mediaId;
			List<MediaEntity> medias = sessionFactory.getCurrentSession()
					.createQuery(hql).list();
			for (MediaEntity mediaEntity : medias) {
				MediaDto mediaDto = new MediaDto();
				BeanUtils.copyProperties(mediaDto, mediaEntity);
				mediaDtos.add(mediaDto);
			}
			
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return mediaDtos;
	}

	@Override
	public ArrayList<MediaDto> listOfChart(MediaDto mediaDto) throws Exception {
		try {
			mediaEntity = new MediaEntity(); 
			hql = "from MediaEntity mediaEntity where mediaEntity.userEntity.userId ="
					+ mediaDto.getUserEntity().getUserId()
					+ " order by mediaEntity.created";
			// List mediaList =
			// sessionFactory.getCurrentSession().createQuery(hql).list();

			Query q = sessionFactory.getCurrentSession().createQuery(hql)
					.setFirstResult(0).setMaxResults(5);
			List mediaList = q.list();

			mediaDtos = new ArrayList<MediaDto>();
			for (Iterator iterator = mediaList.iterator(); iterator.hasNext();) {
				MediaEntity mediaEntity = (MediaEntity) iterator.next();
				mediaDto = new MediaDto();
				BeanUtils.copyProperties(mediaDto, mediaEntity);
				mediaDtos.add(mediaDto);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return mediaDtos;
	}
}
