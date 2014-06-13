package com.medialounge.reevo.serviceImpl;

import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.UserDao;
import com.medialounge.reevo.dto.ActiveLoginDTO;
import com.medialounge.reevo.dto.BumpDTO;
import com.medialounge.reevo.dto.InspireDTO;
import com.medialounge.reevo.dto.MonitorDTO;
import com.medialounge.reevo.dto.OverviewDTO;
import com.medialounge.reevo.dto.SkillDTO;
import com.medialounge.reevo.dto.StatusDTO;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.entity.ModuleEntity;
import com.medialounge.reevo.entity.UserEntity;
import com.medialounge.reevo.service.UserService;

@Service("userService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addUser(UserDto userDto) throws Exception {
		userDao.addUser(userDto);

	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public ArrayList<UserDto> listUsers(UserDto userDto) throws Exception {
		return userDao.listUsers(userDto);

	}

	public void helloUser() {
		//System.out.println("hello user");
	}

	public UserDto loginUser(UserDto userDto) throws Exception {
		return userDao.loginUser(userDto);
	}

	public ArrayList<UserDto> getPendingContacts(int userId) throws Exception {
		return userDao.getPendingContacts(userId);
	}

	public String addContacts(String userId, String[] contactArr) throws Exception {
		return userDao.addContacts(userId, contactArr);
	}

	@Override
	public ArrayList<UserDto> getContacts(int userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.getContacts(userId);
	}

	public ArrayList<UserDto> getNewContactsList(int userId) throws Exception {
		return userDao.getNewContactsList(userId);
	}

	public int setPendingContactsToContacts(String[] contactArr) {
		return userDao.setPendingContactsToContacts(contactArr);
	}

	public String setPendingContactsToContacts(int userId, int contactId,
			String status) throws Exception {
		return userDao.setPendingContactsToContacts(userId, contactId, status);
	}

	@Override
	public ArrayList<UserDto> viewMyInfo(String userName) throws Exception{
		return userDao.viewMyInfo(userName);
	}

	@Override
	public String addSkill(int id, int jobTypeId, String skill) throws Exception {
		return userDao.addSkill(id, jobTypeId, skill);
	}

	@Override
	public String saveUserPhoto(UserDto userDto) throws Exception {
		return userDao.saveUserPhoto(userDto);
	}

	@Override
	public ArrayList<SkillDTO> getMySkills(int userId) throws Exception {
		return userDao.getMySkills(userId);
	}

	@Override
	public String setUserCategories(int userId, String dj, String vs,
			String journalist, String anchor) throws Exception {
		return userDao.setUserCategories(userId, dj, vs, journalist, anchor);
	}

	@Override
	public ArrayList<UserDto> getUsersByType(String userType) throws Exception {
		return userDao.getUsersByType(userType);
	}

	@Override
	public ArrayList<UserDto> fetchSearchUser(String searchUser) throws Exception {
		return userDao.fetchSearchUser(searchUser);
	}

	@Override
	public ArrayList<UserDto> getUserDetailsById(int userId) {
		return userDao.getUserDetailsById(userId);
	}

	@Override
	public ArrayList<StatusDTO> getStatusById(int userId) {

		return userDao.getStatusById(userId);
	}

	
	

	/*@Override
	public String startMonitor(int userId, int moduleId, Date date) {
		return userDao.startMonitor(userId, moduleId, date);
	}

	@Override
	public ArrayList<MonitorDTO> getMonitorId(int userId, int moduleId) {
		return userDao.getMonitorId(userId, moduleId);
	}

	@Override
	public String stopMonitor(MonitorDTO monitorDTO) {
		return userDao.stopMonitor(monitorDTO);
	}*/

	@Override
	public ArrayList<MonitorDTO> getCountForEachModule() throws Exception {
		return userDao.getCountForEachModule();
	}

	@Override
	public String checkEmail(String email) throws Exception{

		return userDao.checkEmail(email);
	}

	@Override
	public void saveActiveLogins(ActiveLoginDTO activeLoginDTO) throws Exception{

		userDao.saveActiveLogins(activeLoginDTO);
	}

	@Override
	public ArrayList<ActiveLoginDTO> getActiveLogins() throws Exception{

		return userDao.getActiveLogins();
	}

	@Override
	public ArrayList<UserDto> updateMyProfile(UserDto userDto) throws Exception{

		return userDao.updateMyProfile(userDto);
	}

	@Override
	public ArrayList<InspireDTO> getUsersInspireList(int userId) throws Exception{
		return userDao.getUsersInspireList(userId);
	}

	@Override
	public String saveInspiredUser(int userId, String inspireUser) throws Exception{
		return userDao.saveInspiredUser(userId, inspireUser);
	}

	@Override
	public String updateUserBio(UserDto userDto) throws Exception {
		return userDao.updateUserBio(userDto);
	}

	@Override
	public void deleteAllRecordsFromInspire(int userId) throws Exception{
		userDao.deleteAllRecordsFromInspire(userId);
	}

	@Override
	public String getMonitorExistingUsers(int userId,
			int oldModuleId, Date startDate, Date newDate) {
		
		String msg = "";
		long timeSpd = 0;
		long endTime = 0;
		long timeSpend = 0;
		int monitorId = 0;
		ArrayList<MonitorDTO> monitorList = new ArrayList<MonitorDTO>();
		monitorList = userDao.getMonitorExistingUsers(userId, oldModuleId);
		
		if (monitorList.size() > 0) {
			for (MonitorDTO dto : monitorList) {
				monitorId = dto.getMonitorId();
				timeSpd = dto.getTimeSpend();
				
				endTime = newDate.getTime() - startDate.getTime();
				timeSpend = endTime / 1000;
				timeSpend = timeSpd + timeSpend;
				
				MonitorDTO monitorDTO = new MonitorDTO();
				monitorDTO.setMonitorId(monitorId);
				monitorDTO.setTimeSpend(timeSpend);
				msg = userDao.updateMonitorExisingUsers(monitorDTO);
			}
		} else {
		 
			endTime = newDate.getTime() - startDate.getTime();
			timeSpend = endTime / 1000;
		
			MonitorDTO monitorDTO = new MonitorDTO();
			monitorDTO.setModuleId(oldModuleId);
			monitorDTO.setTimeSpend(timeSpend);

			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(userId);
			monitorDTO.setUserEntity(userEntity);

			ModuleEntity moduleEntity = new ModuleEntity();
			moduleEntity.setModuleId(oldModuleId);
			monitorDTO.setModuleEntity(moduleEntity);

			msg = userDao.monitorPerModule(monitorDTO);
		}
		return msg;

	}

	@Override
	public String updateMonitorWeeklyAvg() throws Exception{
		// start from monday in week util
		/*Calendar cal = null;
		Calendar currentDate = null;
		currentDate = Calendar.getInstance();
		ArrayList<String> dateStringArr = new ArrayList<String>();
		int monthCount = 0, monthCountLimit = 2;
		String monthCountString = "1";

		try {
			if (monthCountString != null) {
				if (!monthCountString.trim().equals("")) {
					try {
						monthCountLimit = Integer.parseInt(monthCountString);
					} catch (NumberFormatException n) {
						monthCountLimit = 2;
					}
				}
			}
		} catch (Exception e) {
			monthCountLimit = 2;
		}
		while (monthCount < monthCountLimit) {
			cal = Calendar.getInstance();
			cal.set(Calendar.DATE, 1);
			if (monthCount > 0) {
				cal.add(Calendar.MONTH, monthCount);
			}
			int weekday = cal.get(Calendar.DAY_OF_WEEK);
			int i = 2;
			while (weekday != 2) {
				cal.set(Calendar.DATE, i);
				i++;
				weekday = cal.get(Calendar.DAY_OF_WEEK);
			}
			int currentMonth = cal.get(Calendar.MONTH);
			String currentMonthString = "";
			switch (currentMonth) {
			case 0:
				currentMonthString = "01";
				break;
			case 1:
				currentMonthString = "02";
				break;
			case 2:
				currentMonthString = "03";
				break;
			case 3:
				currentMonthString = "04";
				break;
			case 4:
				currentMonthString = "05";
				break;
			case 5:
				currentMonthString = "06";
				break;
			case 6:
				currentMonthString = "07";
				break;
			case 7:
				currentMonthString = "08";
				break;
			case 8:
				currentMonthString = "09";
				break;
			case 9:
				currentMonthString = "10";
				break;
			case 10:
				currentMonthString = "11";
				break;
			case 11:
				currentMonthString = "12";
				break;
			}
			while (currentMonth == cal.get(Calendar.MONTH)) {
				dateStringArr
						.add(cal.get(Calendar.YEAR) + "-" +currentMonthString + "-" + cal.get(Calendar.DATE));
				cal.add(Calendar.DATE, 7);
			}
			monthCount++;
		}

		Date date = new Date();
		String systemCurrentDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
		for (String weeklyDate : dateStringArr) {
			if(weeklyDate.equals(systemCurrentDate)) {
				if(dateFormat.format(call.getTime()).equals("08:00:00 AM")) {
					
				}
			} 
		}*/
		// end util
		ArrayList<MonitorDTO> monitorDTOs = new ArrayList<MonitorDTO>();
		String msg = "";
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss a"); // "HH:mm:ss"
		Calendar call = Calendar.getInstance();
		
		Calendar cals = Calendar.getInstance();
		String dayName = new DateFormatSymbols().getWeekdays()[cals.get(Calendar.DAY_OF_WEEK)];
		
		if(dayName.equalsIgnoreCase("Monday")) {
			if(dateFormat.format(call.getTime()).equals("08:00:00 AM")) {
				
			}
		}
		monitorDTOs = userDao.getMonitorDetailsPerModule(); // inside if condition
		
		if(monitorDTOs.size() > 0) {
			msg =  userDao.updateMonitorWeeklyAvg(monitorDTOs);
		}
		return msg;
	}

	@Override
	public ArrayList<UserDto> getUserProfileInfoByAboutId(int aboutUserId) {
		return userDao.getUserProfileInfoByAboutId(aboutUserId);
	}

	@Override
	public ArrayList<UserDto> searchUserByEmailOrName(String searchUser) throws Exception {
		return userDao.searchUserByEmailOrName(searchUser);
	}
	
	@Override
	public Map loadBumpDetails(String userId) {

		return userDao.loadBumpDetails(userId);
	}
	
	@Override
	public void addNewBumpDetails(String attribute, ArrayList str) {

		userDao.addNewBumpDetails(attribute,str);
	}
	
	@Override
	public ArrayList<BumpDTO> checkfav(String userId) {

		return userDao.checkfav(userId);
	}

	@Override
	public ArrayList<BumpDTO> checkmutual(String userId) {

		return userDao.checkmutual(userId);
	}

	@Override
	public String actionFavourites(String bumpId, String status) {

		return userDao.actionFavourites(bumpId,status);
	}

	@Override
	public String actionMutual(String bumpId, String status) {

		return userDao.actionMutual(bumpId,status);
	}

	@Override
	public ArrayList<BumpDTO> checkmaybe(String userId) {

		return userDao.checkmaybe(userId);
	}

	@Override
	public ArrayList<BumpDTO> getfav(String userId) {

		return userDao.getfav(userId);
	}

	@Override
	public ArrayList<BumpDTO> getmutual(String userId) {

		return userDao.getmutual(userId);
	}
	
////code for new Vishal Bump
	@Override
	public Map loadfriendListForFav(String userId) throws Exception {

		return userDao.loadfriendListForFav(userId);
	}

	@Override
	public void addToFavourites(String from, String to, String type) throws Exception{
			
		userDao.addToFavourites(from,to, type);
	}

	@Override
	public Map loadfriendListForMutual(String userId) {
		
		return userDao.loadfriendListForMutual(userId);
	}

	@Override
	public void addMutual(String from, String to) {
		
		userDao.addMutual(from,to);
	}

	@Override
	public String actionFavouriteBump(String bumpId, String status) throws Exception{
		
		return userDao.actionFavouriteBump(bumpId,status);
	}

	@Override
	public String actionMutualBump(String bumpId, String status) {

		return userDao.actionMutualBump(bumpId,status);
	}
	
	@Override
	public String changeMAYBE(String bumpId, String status) throws Exception{

		return userDao.changeMAYBE(bumpId,status);
	}

	@Override
	public ArrayList<OverviewDTO> getOverviewList(String loginUser,	int overViewId) {
		return userDao.getOverviewList(loginUser,overViewId);

	}

	@Override
	public ArrayList<OverviewDTO> getAllOverViewModules() throws Exception {
		
		return userDao.getAllOverViewModules();
	}
	
	@Override
	public String addOverViewData(int overViewModuleId, String description,
			String functionWork, String whyToUse, String status) throws Exception {
		return userDao.addOverViewData(overViewModuleId, description, functionWork, whyToUse, status);
		
	}

	@Override
	public String checkOverViewModuleExisting(int overViewModuleId) throws Exception{
		
		return userDao.checkOverViewModuleExisting(overViewModuleId);
	}
	
	@Override
	public void deleteOverViewData(int quickOverViewId, String loginUser) throws Exception {

		userDao.deleteOverViewData(quickOverViewId, loginUser);
	}

	/*@Override
	public String saveEditedOverViewData(int overViewModuleId, String description, String functionWork, String whyToUse, String status) {

		return userDao.saveEditedOverViewData(overViewModuleId, description, functionWork, whyToUse, status);
	}*/

	@Override
	public void setActiveOrDeactive(int quickOverViewId, String status) throws Exception{
		userDao.setActiveOrDeactive(quickOverViewId, status);
	}
	
	@Override
	public String saveEditedOverViewData(int quickOverViewId,
			String overViewName, String desc, String functionWork,
			String whyToUse) throws Exception{
		return userDao.saveEditedOverViewData(quickOverViewId, overViewName, desc, functionWork, whyToUse);
	}

	@Override
	public ArrayList<OverviewDTO> getAllOverViewModulesById(int overViewId) throws Exception {
		return userDao.getAllOverViewModulesById(overViewId);
	}

	@Override
	public List<UserDto> listOfFavorites(int userId) throws Exception{
		return userDao.listOfFavorites(userId);
	}

	@Override
	public String saveStatus(String userId, String status) throws Exception{
		return userDao.saveStatus(userId,status);
		
	}

	@Override
	public UserDto loginUserDetails(String userId) throws Exception{
		
		return userDao.loginUserDetails( userId);
	}

}
