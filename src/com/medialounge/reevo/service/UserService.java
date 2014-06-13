package com.medialounge.reevo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.medialounge.reevo.dto.ActiveLoginDTO;
import com.medialounge.reevo.dto.BumpDTO;
import com.medialounge.reevo.dto.InspireDTO;
import com.medialounge.reevo.dto.MonitorDTO;
import com.medialounge.reevo.dto.OverviewDTO;
import com.medialounge.reevo.dto.SkillDTO;
import com.medialounge.reevo.dto.StatusDTO;
import com.medialounge.reevo.dto.UserDto;

public interface UserService {
	public void addUser(UserDto userDto) throws Exception;

	public ArrayList<UserDto> listUsers(UserDto userDto) throws Exception;

	public ArrayList<UserDto> getPendingContacts(int userId) throws Exception;

	public void helloUser();

	public UserDto loginUser(UserDto userDto) throws Exception;

	public String addContacts(String userId, String[] contactArr) throws Exception;

	public ArrayList<UserDto> getContacts(int userId) throws Exception;

	public ArrayList<UserDto> getNewContactsList(int userId) throws Exception;

	public int setPendingContactsToContacts(String[] contactArr);

	public String setPendingContactsToContacts(int userId, int contactId,
			String status) throws Exception;

	public ArrayList<UserDto> viewMyInfo(String userName) throws Exception;

	public String addSkill(int id, int jobTypeId, String skill) throws Exception;

	public String saveUserPhoto(UserDto userDto) throws Exception;

	public ArrayList<SkillDTO> getMySkills(int userId) throws Exception;

	public String setUserCategories(int parseInt, String dj, String vs,
			String journalist, String anchor) throws Exception;

	public ArrayList<UserDto> getUsersByType(String userType) throws Exception;

	public ArrayList<UserDto> fetchSearchUser(String searchUser) throws Exception;

	public ArrayList<UserDto> getUserDetailsById(int userId);

	public ArrayList<StatusDTO> getStatusById(int userId);
	
	

	//public String startMonitor(int userId, int moduleId, Date date);

	//public ArrayList<MonitorDTO> getMonitorId(int userId, int moduleId);

	//public String stopMonitor(MonitorDTO monitorDTO);

	public ArrayList<MonitorDTO> getCountForEachModule() throws Exception; 
	
	public String checkEmail(String email) throws Exception;
	
	public void saveActiveLogins(ActiveLoginDTO activeLoginDTO) throws Exception;

	public ArrayList<ActiveLoginDTO> getActiveLogins() throws Exception;
	
	public ArrayList<UserDto> updateMyProfile(UserDto userDto) throws Exception;

	public ArrayList<InspireDTO> getUsersInspireList(int userId) throws Exception;

	public String saveInspiredUser(int userId, String string) throws Exception;

	public void deleteAllRecordsFromInspire(int userId) throws Exception;

	public String updateUserBio(UserDto userDto) throws Exception;

	public String getMonitorExistingUsers(int userId, int oldModuleId,
			Date startDate, Date newDate);

	public String updateMonitorWeeklyAvg() throws Exception;

	public ArrayList<UserDto> getUserProfileInfoByAboutId(int aboutUserId);

	public ArrayList<UserDto> searchUserByEmailOrName(String searchUser) throws Exception;
	
	public Map loadBumpDetails(String userId);
	
	public void addNewBumpDetails(String attribute, ArrayList str);
	
	public ArrayList<BumpDTO> checkfav(String userId);

	public ArrayList<BumpDTO> checkmutual(String userId);

	public String actionFavourites(String bumpId, String status);

	public String actionMutual(String bumpId, String status);

	public ArrayList<BumpDTO> checkmaybe(String userId);

	public ArrayList<BumpDTO> getfav(String userId);

	public ArrayList<BumpDTO> getmutual(String userId);
	
////code new bump
	public Map loadfriendListForFav(String userId) throws Exception;

	public void addToFavourites(String from, String to, String type) throws Exception;

	public Map loadfriendListForMutual(String userId);

	public void addMutual(String from, String to);

	public String actionFavouriteBump(String bumpId, String status) throws Exception;

	public String actionMutualBump(String bumpId, String status);
	
	public String changeMAYBE(String bumpId, String status) throws Exception;
	
	// Code For Quick OverView 
	
	public ArrayList<OverviewDTO> getOverviewList(String loginUser,	int overViewId);

	public ArrayList<OverviewDTO> getAllOverViewModules() throws Exception;

	public String addOverViewData(int overViewModuleId, String description, String functionWork, String whyToUse, String status) throws Exception;

	public String checkOverViewModuleExisting(int overViewModuleId) throws Exception;   
	
	public void  deleteOverViewData(int quickOverViewId, String loginUser) throws Exception;

	public void setActiveOrDeactive(int quickOverViewId,String status) throws Exception;

	public String saveEditedOverViewData(int quickOverViewId,
			String overViewName, String desc, String functionWork,
			String whyToUse) throws Exception;

	public ArrayList<OverviewDTO> getAllOverViewModulesById(int overViewId) throws Exception;

	public List<UserDto> listOfFavorites(int userId) throws Exception;

	public String saveStatus(String userId, String status) throws Exception;

	public UserDto loginUserDetails(String userId) throws Exception; 

	//public String saveEditedOverViewData(int overViewModuleId, String description, String functionWork, String whyToUse, String status);
	
	
}
