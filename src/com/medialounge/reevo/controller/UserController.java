
package com.medialounge.reevo.controller;

import java.net.InetAddress;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.medialounge.reevo.dto.ActiveLoginDTO;
import com.medialounge.reevo.dto.BumpDTO;
import com.medialounge.reevo.dto.BumpFavDTO;
import com.medialounge.reevo.dto.InspireDTO;
import com.medialounge.reevo.dto.JobDTO;
import com.medialounge.reevo.dto.MediaDto;
import com.medialounge.reevo.dto.MediaReviewDTO;
import com.medialounge.reevo.dto.MonitorDTO;
import com.medialounge.reevo.dto.OverviewDTO;
import com.medialounge.reevo.dto.SkillDTO;
import com.medialounge.reevo.dto.StatusDTO;
import com.medialounge.reevo.dto.UploadDto;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.entity.UserEntity;
import com.medialounge.reevo.form.SkillForm;
import com.medialounge.reevo.form.StatusForm;
import com.medialounge.reevo.form.UserForm;
import com.medialounge.reevo.service.JobService;
import com.medialounge.reevo.service.MediaService;
import com.medialounge.reevo.service.UserService;
import com.medialounge.reevo.serviceImpl.MediaHelpler;
import com.medialounge.reevo.util.MediaLoungeConstant;
import com.medialounge.reevo.util.MonitorUtil;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

@Controller
//@SessionAttributes("userSession")
public class UserController {

	private static Logger logger = Logger.getLogger(UserController.class);
	static Log log = LogFactory.getLog(UserController.class.getName());

	List<UserDto> userArrayList;
	@Autowired
	UserService userService;
	
	@Autowired
	JobService jobService;
	@Autowired
	MediaService mediaService;
	@Autowired
	MediaDto mediaDto;
	@Autowired
	UserDto userDto;
	@Autowired
	JobDTO jobDTO;
	@Autowired
	ActiveLoginDTO activeLoginDTO;
	@Autowired
	MediaHelpler mediaHelpler;
	@Autowired
	MonitorUtil monitorUtil;
	

	List<MediaDto> mediaDtos;	
	List<UserDto> userDtos;
	
	UploadDto uploadDto;

	OverviewDTO overviewDTO;

	/**
	 * [Sentence summarizing the method's purpose and functionality.] [Other
	 * comments describing preconditions, postconditions, algorithm notes, usage
	 * instructions, reminders, etc.]
	 * 
	 * @return [Description of return value]
	 * @exception [Name of exception class and description of the scenario]
	 * @see [String]
	 * @see [URL]
	 * @see [class name#method name]
	 **/
	@RequestMapping(value = "/homePage", method = RequestMethod.GET)
	public String forwardHomePage(ModelMap model) {
		// logger.info("Hello, World!");
		// logger.debug("asdf");
		return "forward:/loginUserHome";
	}

	@RequestMapping(value = "/loginUserHome", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String loginUserHome(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request, HttpSession session) {
		return "loginUser";

	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/loginUserFinish", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody
	String loginUser(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request, HttpSession session) throws Exception {
		try {
			
			String userName = request.getParameter("email");
			String userPassword = request.getParameter("password");
			session.removeAttribute("userSession");
			session.removeAttribute("userSessionId");
			session.removeAttribute("userDto");
				if ((userName != null)
					&& (userPassword != null)) {
				
				//BeanUtils.copyProperties(userDto, userForm);
				userDto.setEmail(userName);
				userDto.setPassword(userPassword);
				UserDto dto = new UserDto();
				
				dto = userService.loginUser(userDto);
				if ((dto != null)) {
					
					try{
						if(dto.getUserId() > -1){
							session.setAttribute("userSession", dto.getEmail());
							session.setAttribute("userSessionId",
									Integer.toString(dto.getUserId()));
							session.setAttribute("userDto", dto);
						}else{
							return "Failure";
						}
					}catch(Exception e){
						return "Failure";
					}
					
					/******************new Code ***********************************/
					/*XmlReader reader = null;
				    try {
					    	if(((ArrayList<HashMap>)request.getSession().getAttribute("rssFeedItemArr") != null) ){
						     	model.addAttribute("rssFeedItemArr", ((ArrayList<HashMap>)request.getSession().getAttribute("rssFeedItemArr")));
						     	return "rss";
					    	}
					    	URL url  = new URL("http://rapfix.mtv.com/feed");
					    	reader = new XmlReader(url);
					    	SyndFeed feed = new SyndFeedInput().build(reader);
					    	ArrayList<HashMap> rssFeedItemArr  = new ArrayList<HashMap>();
					     	for (Iterator i = feed.getEntries().iterator(); i.hasNext();) {
						        SyndEntry entry = (SyndEntry) i.next();
						        HashMap<String,String> item = new HashMap<String,String>();
						        item.put("title", entry.getTitle());
						        item.put("description", entry.getDescription().getValue()+"");
						        item.put("link	", entry.getTitle());
						        rssFeedItemArr.add(item);
				            }
					     	model.addAttribute("rssFeedItemArr", rssFeedItemArr);
					     	request.getSession().setAttribute("rssFeedItemArr",rssFeedItemArr);
			        }catch(Exception e){
			        	e.printStackTrace();
			        	
			        }
				    finally {
				    	try{
				            if (reader != null)
				                reader.close();
				        }catch(Exception e){
				        	
				        }
				    }*/
					/*********************new code *************************************/
					//session.setAttribute("userSession", dto.getEmail());
					return "Success";
				}else{
					return "Failure";
				}
			}

		} catch (Exception e) {
			//return "Failure1";
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "Failure2";

	}

	@RequestMapping(value = "/newHomePage", method = RequestMethod.GET)
	public String userDashboard(@ModelAttribute("user") UserForm userForm,
			ModelMap model,HttpServletRequest request,HttpSession session) throws Exception {

		try {
			mediaDto.setUserId((String) request.getSession().getAttribute(
							"userSessionId"));
			/*Fetch My Feed Details*/
			mediaDto.setType("myFeed");
			mediaDtos = mediaService.listOfMedias(mediaDto);
			model.addAttribute("type", "myFeed");
			model.addAttribute("mediaDtoList", mediaDtos);
			model.addAttribute("ADMIN", MediaLoungeConstant.ADMIN);
			
			/*Fetch FMF Details*/
			mediaDtos = mediaService.listOfMediasFMF(mediaDto);
			model.addAttribute("mediaDtoFMFList", mediaDtos);
			
	
			/*Status of logged in user*/
			//int userId = Integer.parseInt((String) request.getSession().getAttribute("userSessionId"));
			
			String uId = (String) request.getSession().getAttribute("userSessionId");
			if(uId == null) {
				System.out.println("USER ID IS NULL...");
				return "forward:/logoutUser";
			}
			int userId = Integer.parseInt(uId);
			
			//ArrayList<StatusDTO> statusList = userService.getStatusById(userId);
			/*if(statusList.size() == 0){
				ArrayList<UserDto> userList = userService.getUserDetailsById(userId);
				model.addAttribute("USER_LIST", userList);
			}*/
			//model.addAttribute("STATUS_LIST", statusList);
			
			/* code for spotLight */
			Map details = new HashMap();
			/*String userId = (String) request.getSession().getAttribute(
					"userSessionId");*/
			details = mediaService.getSpotLightDetails( (String) request.getSession().getAttribute(
					"userSessionId"));
	
			ArrayList<MediaReviewDTO> mediaReview = null;
			ArrayList<UserDto> userList = null;
			ArrayList<MediaDto> mediasp = null;
	
			mediaReview = (ArrayList<MediaReviewDTO>) details
					.get("mediaReview");
			userList = (ArrayList<UserDto>) details.get("loginUser");
			mediasp = (ArrayList<MediaDto>) details.get("media");
	
			model.addAttribute("mediaReview", mediaReview);
			model.addAttribute("userList", userList);
			model.addAttribute("media", mediasp);
	
			/* code for chartsMML */
			Map m = new HashMap();
			m = mediaService.getCharts();
			List<MediaDto> media = (List<MediaDto>) m.get("media");
			List<UserDto> user = (List<UserDto>) m.get("user");
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			model.addAttribute("TODAY", formatter.format(date));
			for (MediaDto mediaDto : media) {
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
			}
			model.addAttribute("MEDIAS", media);
			model.addAttribute("USERS", user);
			
			/******************new Code ***********************************/
			XmlReader reader = null;
		    try {
			    	if(((ArrayList<HashMap>)request.getSession().getAttribute("rssFeedItemArr") != null) ){
				     	model.addAttribute("rssFeedItemArr", ((ArrayList<HashMap>)request.getSession().getAttribute("rssFeedItemArr")));
			    	}
			    	URL url  = new URL("http://rapfix.mtv.com/feed");
			    	reader = new XmlReader(url);
			    	SyndFeed feed = new SyndFeedInput().build(reader);
			    	ArrayList<HashMap> rssFeedItemArr  = new ArrayList<HashMap>();
			     	for (Iterator i = feed.getEntries().iterator(); i.hasNext();) {
				        SyndEntry entry = (SyndEntry) i.next();
				        HashMap<String,String> item = new HashMap<String,String>();
				        item.put("title", entry.getTitle());
				        item.put("description", entry.getDescription().getValue()+"");
				        item.put("link	", entry.getTitle());
				        rssFeedItemArr.add(item);
		            }
			     	model.addAttribute("rssFeedItemArr", rssFeedItemArr);
			     	request.getSession().setAttribute("rssFeedItemArr",rssFeedItemArr);
	        }catch(Exception e){
	        	e.printStackTrace();
	        	
	        }
		    finally {
		    	try{
		            if (reader != null)
		                reader.close();
		        }catch(Exception e){
		        	
		        }
		    }
			/*********************new code *************************************/
		} catch (ParseException e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
		}
		
		return "newHomePage";
	}

	@RequestMapping(value = "/userRegister", method = RequestMethod.GET)
	public String userRegister(@ModelAttribute("user") UserForm userForm,
			ModelMap model) {
		return "userRegister";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/userRegisterFinish", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String userRegisterFinish(@ModelAttribute("user") UserForm userForm,
			ModelMap model, HttpServletRequest request) throws Exception {
		try {
			userDto.setFirstName(request.getParameter("fName")); 
			userDto.setLastName(request.getParameter("lName"));
			userDto.setEmail(request.getParameter("email")); 
			userDto.setPassword(request.getParameter("pass")); 
			userDto.setGender(request.getParameter("gender")); 
			userDto.setCountry(request.getParameter("country")); 
			userDto.setZipcode(request.getParameter("zipcode")); 
			userDto.setLatitude(Double.parseDouble(request.getParameter("latitude"))); 
			userDto.setLongitude(Double.parseDouble(request.getParameter("longitude")));
			 
			String dobMonth=request.getParameter("dobMonth");
			String dobDate=request.getParameter("dobDate");
			String dobYear=request.getParameter("dobYear");
			
			String birthday = dobYear+"-"+dobMonth+"-"+dobDate;
			userDto.setContentPath(null);
			userDto.setBirthday(birthday);
			userService.addUser(userDto);
			/*String birthday = userForm.getDobYear()+"-"+userForm.getDobMonth()+"-"+userForm.getDobDate();
			BeanUtils.copyProperties(userDto, userForm);
			userDto.setContentPath(null);
			userDto.setBirthday(birthday);
			userService.addUser(userDto);*/
		} catch (Exception e) {
			return "forward:/genericException"; // doubt need to check later
		}
		return "forward:/loginUserHome";
	}

	@RequestMapping(value = "/listUsers", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String listUsers(@ModelAttribute("user") UserForm userForm,
			ModelMap model) {
		// return "newHomePage";
		return "forward:/logoutUser";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getNewContactsList", method = {
			RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getNewContactsList(
			@ModelAttribute("users") UserForm userForm, ModelMap model,
			HttpServletRequest request) throws Exception {
		try {
			userArrayList = userService.getNewContactsList(Integer
					.parseInt((String) request.getSession().getAttribute(
							"userSessionId")));
			model.addObject("title", "Users");
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return new ModelAndView("addContactsInner", "userArrayList",
				userArrayList);
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/addContactsFinish", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addContactsFinish(@ModelAttribute("users") UserForm userForm,
			ModelMap model, HttpServletRequest request) throws Exception {
		
		try {
			userService.addContacts(
					(String) request.getSession().getAttribute("userSessionId"),
					request.getParameter("contactId").split(","));			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "forward:/getNewContactsList";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/pendingContactlist", method = RequestMethod.GET)
	public ModelAndView getPendingContacts(
			@ModelAttribute("users") UserForm userForm, ModelMap model,
			HttpServletRequest request) throws Exception {
		
		try {
			userArrayList = userService.getPendingContacts(Integer
					.parseInt((String) request.getSession().getAttribute(
							"userSessionId")));
			model.addObject("title", "Pending Contacts");
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return new ModelAndView("pendingContactsInner", "userArrayList",
				userArrayList);
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/setPendingContactsToContacts", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String setPendingContactsToContacts(
			@ModelAttribute("users") UserForm userForm, ModelMap model,
			HttpServletRequest request) throws Exception {
		try {
			
			userService.setPendingContactsToContacts(
					Integer.parseInt((String) request.getSession().getAttribute(
							"userSessionId")),
					Integer.parseInt(request.getParameter("id")),
					request.getParameter("status"));
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "forward:/pendingContactlist";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getContactList", method = RequestMethod.GET)
	public ModelAndView getContactList(
			@ModelAttribute("users") UserForm userForm, ModelMap model,
			HttpServletRequest request, HttpSession session) throws Exception {
		
		try {
			
			userArrayList = userService.getContacts(Integer
					.parseInt( request.getParameter("userId")));
			model.addObject("title", "Contacts");
			// monitor start
			int userId = Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString());
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if (newModuleId != null) {
				monitorUtil.monitorPerModule(userId, newModuleId, request, session);
			}
			// moitor end
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");			
		}
		return new ModelAndView("listUsersInner", "userArrayList",
				userArrayList);
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getMyProfilePage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView getMyProfilePage(
			@ModelAttribute("users") UserForm userForm, ModelMap model,
			HttpServletRequest request, HttpSession session) throws Exception {
		
		ArrayList<UserDto> myInfoList = new ArrayList<UserDto>();
		try {
			
			String userName = (String) request.getSession().getAttribute(
					"userSession");
			myInfoList = userService.viewMyInfo(userName);

			int userId = Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString());
			ArrayList<SkillDTO> skillList = userService.getMySkills(userId);
			request.setAttribute("MYSKILL_LIST", skillList);
			ArrayList<InspireDTO> inspireList = userService
					.getUsersInspireList(userId);
			// model.addAttribute("INSPIRE_LIST", inspireList);
			request.getSession().setAttribute("INSPIRE_LIST", inspireList);

			
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(userId);
			
			mediaDto.setUserEntity(userEntity);
			mediaDto.setType("chart");
			mediaDtos = mediaService.listOfMedias(mediaDto);
			model.addAttribute("mediaDtoList", mediaDtos);
			
			
			List<UserDto> userFavoriteList = new ArrayList<UserDto>();
			userFavoriteList = userService.listOfFavorites(userId);
			model.addAttribute("USERLIST", userFavoriteList);
			
			// monitor start
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if (newModuleId != null) {
				monitorUtil.monitorPerModule(userId, newModuleId, request, session);
			}
			// moitor end
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return new ModelAndView("getMyProfilePage", "myInfoList", myInfoList);
	}


	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/forwardToAddSkill", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView forwardToAddSkill(
			@ModelAttribute("addingSkill") SkillForm skillForm, ModelMap model,
			HttpServletRequest request) throws Exception{
		try {
			ArrayList<JobDTO> list = jobService.getAllJobType();
			model.addAttribute("JOBTYPE_LIST", list);
			return new ModelAndView("forwardToAddSkill");
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/addSkill", method = RequestMethod.POST)
	public @ResponseBody
	String addSkill(@ModelAttribute("addingSkill") SkillForm skillForm,
			ModelMap model, HttpServletRequest request) throws Exception {
		String msg = "";
		try {
			String expertList = request.getParameter("expertArray");
			String skillList = request.getParameter("skillArray");

			ArrayList<String> jobTypeIdList = new ArrayList<String>();
			ArrayList<String> skillsList = new ArrayList<String>();

			for (String str : expertList.split(",")) {
				jobTypeIdList.add(str);
			}

			for (String str : skillList.split(",")) {
				skillsList.add(str);
			}
			int id = Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString());

			for (int i = 0; i < jobTypeIdList.size(); i++) {
				for (int j = 0; j < skillsList.size(); j++) {
					msg = userService.addSkill(id,
							Integer.parseInt(jobTypeIdList.get(i)),
							skillsList.get(j));
					i++;
				}
			}
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return msg;
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/photoUpload", method = RequestMethod.POST)
	public @ResponseBody
	String photoUpload(@ModelAttribute("uploadPhoto") UserForm userForm,
			ModelMap model, MultipartHttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String msg = "";
		try {
			String userName = (String) request.getSession().getAttribute(
					"userSession");
			int userId = Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString());
			List<MultipartFile> files = new ArrayList<MultipartFile>();
			Iterator<String> itr = request.getFileNames();
			MultipartFile mpf = request.getFile(itr.next());
			files.add(mpf);

			uploadDto = mediaHelpler.uploadFiles(userId, files);

			userForm.setMediaPath(uploadDto.getContentPath());
			userForm.setContentType(uploadDto.getContentType());
			userDto.setContentPath(userForm.getMediaPath());
			userDto.setEmail(userName);
			
			msg = userService.saveUserPhoto(userDto);
			if(msg.equalsIgnoreCase("success")){
				UserDto sessionuserDto = (UserDto)request.getSession().getAttribute("userDto");
				sessionuserDto.setContentPath(userDto.getContentPath());
				request.getSession().setAttribute("userDto", sessionuserDto);
				msg = userForm.getMediaPath();
			}
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/userType", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody
	String userType(@ModelAttribute("user") UserForm userForm, ModelMap model,
			HttpServletRequest request) throws Exception {
		String dj = request.getParameter("dj");
		String anchor = request.getParameter("anchor");
		String vs = request.getParameter("vs");
		String journalist = request.getParameter("journalist");
		int userId = Integer.parseInt(request.getSession()
				.getAttribute("userSessionId").toString());
		try {
			String statusMessage = userService.setUserCategories(userId, dj,
					vs, journalist, anchor);
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "Updated Successfully";
	}


	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getMainContainer", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getMainContainer(@ModelAttribute("user") UserForm userForm,
			ModelMap model, HttpServletRequest request) throws Exception{
		try {
			String type = request.getParameter("type");
			if (type.equalsIgnoreCase("hub")) {
				return "theHub";
			}
			if (type.equalsIgnoreCase("resources")) {
				return "resources";
			}
			if (type.equalsIgnoreCase("myOffice")) {
				return "myOffice";
			}
			if (type.equalsIgnoreCase("inMix")) {
				return "inMix";
			}
			if (type.equalsIgnoreCase("bussiness")) {
				return "bussiness";
			}
			if (type.equalsIgnoreCase("mall")) {
				return "mall";
			}
			if (type.equalsIgnoreCase("jobExchange")) {
				return "jobExchange";
			}
			if (type.equalsIgnoreCase("jobsPage")) {
				return "forward:/getJobList";
			} else {
				/* code for spotLight */
				Map details = new HashMap();
				String userId = (String) request.getSession().getAttribute(
						"userSessionId");
				details = mediaService.getSpotLightDetails(userId);
	
				ArrayList<MediaReviewDTO> mediaReview = null;
				ArrayList<UserDto> userList = null;
				ArrayList<MediaDto> mediasp = null;
	
				mediaReview = (ArrayList<MediaReviewDTO>) details
						.get("mediaReview");
				userList = (ArrayList<UserDto>) details.get("loginUser");
				mediasp = (ArrayList<MediaDto>) details.get("media");
	
				model.addAttribute("mediaReview", mediaReview);
				model.addAttribute("userList", userList);
				model.addAttribute("media", mediasp);
	
				/* code for chartsMML */
				Map m = new HashMap();
				m = mediaService.getCharts();
				List<MediaDto> media = (List<MediaDto>) m.get("media");
				List<UserDto> user = (List<UserDto>) m.get("user");
				SimpleDateFormat formatter = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				Date date = new Date();
				model.addAttribute("TODAY", formatter.format(date));
				for (MediaDto mediaDto : media) {
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
				}
				model.addAttribute("MEDIAS", media);
				model.addAttribute("USERS", user);
				return "rss";
			}
		} catch (ParseException e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/showUsersMiniProfile", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String showUsersMiniProfile(ModelMap model,
			HttpServletRequest request, HttpSession session) throws Exception {
		ArrayList<UserDto> searchedUser = null;
		try {
			String emailFname = request.getParameter("emailFname");
			String searchUser = request.getParameter("user");
			if (emailFname == null) {
				searchedUser = userService.fetchSearchUser(searchUser);
			} else if (emailFname.equals("1")) {
				searchedUser = userService.searchUserByEmailOrName(searchUser);
			}
			model.addAttribute("SEARCH_USERLIST", searchedUser);
			
			// monitor start
			int userId = Integer.parseInt((String) request.getSession()
					.getAttribute("userSessionId"));
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if (newModuleId != null) {
				monitorUtil.monitorPerModule(userId, newModuleId, request, session);
			}
			// moitor end
			
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		
		return "showUsersMiniProfile";
	}

	@RequestMapping(value = "/loadUserDetailsByUserId", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String loadUserDetailsByUserId(ModelMap model,
			HttpServletRequest request, HttpSession session) {
		try {
			int userId = Integer.parseInt(request.getParameter("userId"));
			ArrayList<StatusDTO> statusList = userService.getStatusById(userId);
			if(statusList.size() == 0){
				ArrayList<UserDto> userList = userService.getUserDetailsById(userId);
				model.addAttribute("USER_LIST", userList);
			}
			model.addAttribute("STATUS_LIST", statusList);
			model.addAttribute("USERID",userId);
			model.addAttribute("SIZE",statusList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		// monitor start
		int userId = Integer.parseInt((String) request.getSession()
				.getAttribute("userSessionId"));
		String newModuleId = request.getParameter("moduleId");
		// checking condition because first time no need to start time
		if (newModuleId != null) {
			monitorUtil.monitorPerModule(userId, newModuleId, request, session);
		}
		// moitor end
		return "statusListPage";
	}


	@RequestMapping(value = "/logoutUser", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String logoutUser(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		if ((String) session.getAttribute("userSession") != null) {
			// last module user accessed for monitor start
			try {
				int userId = Integer.parseInt(request.getSession()
						.getAttribute("userSessionId").toString());
				String msg = "";
				
				SimpleDateFormat formatter = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				String date = formatter.format(new Date());
				Date newDate = formatter.parse(date);

				Date startDate = (Date) request.getSession().getAttribute(
						"PREVIOUS_START_DATE");
				if (startDate != null) {
					int oldModuleId = Integer.parseInt((String) request
							.getSession().getAttribute("PREVIOUS_MODULE_ID"));
					msg = userService.getMonitorExistingUsers(userId,
							oldModuleId, startDate, newDate);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		session.removeAttribute("PREVIOUS_MODULE_ID");
		session.removeAttribute("PREVIOUS_START_DATE");
		// monitor end

		session.removeAttribute("MEDIA_ALL_LIST");
		session.removeAttribute("userSession");
		session.removeAttribute("userSessionId");
		session.invalidate();

		Cookie cookie = new Cookie("reevoUserEmail", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);

		//return "forward:/loginUserHome";
		return "loginUser";
	}


	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getOverviewPage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getOverviewPage(ModelMap model, HttpServletRequest request) throws Exception {
		ArrayList<OverviewDTO> overviewList = new ArrayList<OverviewDTO>();
		String loginUser = "";
		int overViewId = -1;

		try {

			loginUser = (String) request.getSession().getAttribute(
					"userSession");
			overViewId = Integer.parseInt(request.getParameter("overViewId"));

			ArrayList<OverviewDTO> overViewModuleslist = userService.getAllOverViewModulesById(overViewId);
			model.addAttribute("OverViewModulesList", overViewModuleslist);

			overviewList = userService.getOverviewList(loginUser, overViewId);
			request.setAttribute("OVERVIEW_LIST", overviewList);
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		if (loginUser.equalsIgnoreCase(MediaLoungeConstant.ADMIN) && overViewId == 0)
			return "showOverviewPage";
		else
			return "ShowOverViewPageUSer";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getaddNewModulePage", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String getaddNewModulePage(ModelMap model) throws Exception {
		
		try {
			ArrayList<OverviewDTO> overViewModuleslist = userService
					.getAllOverViewModules();
			model.addAttribute("OverViewModulesList", overViewModuleslist);
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}

		return "addNewModulePage";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/addOverView", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody
	String addOverView(HttpServletRequest request) throws Exception {
		String msg = "";
		try {
			int overViewModuleId = Integer.parseInt(request
					.getParameter("moduleName"));
			String description = request.getParameter("description");
			String functionWork = request.getParameter("functionWork");
			String whyToUse = request.getParameter("whyToUse");
			String status = "Y";

			userService.addOverViewData(overViewModuleId, description,
					functionWork, whyToUse, status);
			msg = "Successfully Added";
		} catch (Exception e) {
			msg = "Not Added";
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/deleteQuickOverViewData", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String deleteQuickOverViewData(HttpServletRequest request) throws Exception {
		try {

			String loginUser = (String) request.getSession().getAttribute(
					"userSession");
			int QuickOverViewId = Integer.parseInt(request
					.getParameter("QuickOverViewId"));

			userService.deleteOverViewData(QuickOverViewId, loginUser);

		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "forward:/getOverviewPage?overViewId=0";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/editOverViewData", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView editQuickOverViewData(ModelMap model,
			HttpServletRequest request) throws Exception {
		
		try {
			
			int QuickOverViewId = Integer.parseInt(request
					.getParameter("QuickOverViewId"));
			String overViewName = request.getParameter("overViewName");
			String desc = request.getParameter("desc");
			String functionWork = request.getParameter("functionWork");
			String whyToUse = request.getParameter("whytoUse");

			model.addAttribute("QuickOverViewId", QuickOverViewId);
			model.addAttribute("overViewName", overViewName);
			model.addAttribute("desc", desc);
			model.addAttribute("functionWork", functionWork);
			model.addAttribute("whyToUse", whyToUse);
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return new ModelAndView("editOverViewPage", "model", model);
	}


	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/activeOrDeactiveOverView", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	void getActiveOrDeactiveOverView(HttpServletRequest request) throws Exception{
		String statusType = "";
		try {

			int QuickOverViewId = Integer.parseInt(request
					.getParameter("QuickOverViewId"));
			statusType = request.getParameter("type");
			userService.setActiveOrDeactive(QuickOverViewId, statusType);

		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/saveEditedOverView", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	String saveEditedQuickOverViewData(ModelMap model,
			HttpServletRequest request) throws Exception{

		try {
			int QuickOverViewId = Integer.parseInt(request
					.getParameter("QuickOverViewId"));
			String overViewName = request.getParameter("overViewName");
			String desc = request.getParameter("desc");
			String functionWork = request.getParameter("function_work");
			String whyToUse = request.getParameter("why_to_use");

			String statusMsg = userService.saveEditedOverViewData(QuickOverViewId,
					overViewName, desc, functionWork, whyToUse);
			return statusMsg;
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/checkOverViewModule", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	String checkOverViewModuleExisting(ModelMap model,
			HttpServletRequest request) throws Exception{

		try {
			String overViewModuleStatus = "";
			int overViewModuleId = Integer.parseInt(request
					.getParameter("overViewModuleId"));
			overViewModuleStatus = userService
					.checkOverViewModuleExisting(overViewModuleId);
			return overViewModuleStatus;

		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/weeklyMonitorRecord", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	String weeklyMonitorRecord(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		String msg = "";
		try {
			msg = userService.updateMonitorWeeklyAvg();
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getMonitorPage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView getMonitorPage(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		try {
			ArrayList<MonitorDTO> monitorList = userService
					.getCountForEachModule();
			request.setAttribute("MONITOR_LIST", monitorList);
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return new ModelAndView("getMonitorPage");
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getMonitor4Page", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView getMonitor4Page(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		try {
			ArrayList<MonitorDTO> monitorList = userService
					.getCountForEachModule();
			request.setAttribute("MONITOR_LIST", monitorList);

			long BASE_RATE = 1;
			long CHECK_POINT = 0;
			float CHECK_POINT_VALUE = (float) 0.002;

			long NO_OF_USERS = 0;
			float ACTUAL_RATE = 0;

			for (MonitorDTO dto : monitorList) {
				CHECK_POINT = (int) dto.getUserCount();
				NO_OF_USERS = (int) dto.getUserCount();
				if (NO_OF_USERS == CHECK_POINT) {
					ACTUAL_RATE = (float) (BASE_RATE + CHECK_POINT_VALUE);
				} else if (NO_OF_USERS > CHECK_POINT) {
					ACTUAL_RATE = (float) (BASE_RATE + CHECK_POINT_VALUE);
				}
				dto.setBaseRate4a(BASE_RATE);
				dto.setActualRate4a(ACTUAL_RATE);
			}
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return new ModelAndView("getMonitor4APage");
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/checkEmail", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String checkEmail(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		try {
			String email = request.getParameter("email");
			String result = userService.checkEmail(email);
			return result;
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/saveActiveLogins", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String saveActiveLogins(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		try {
			String browser = request.getParameter("browser");
			String version = request.getParameter("version");
			String userId = (String) request.getSession().getAttribute("userSessionId");
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(Integer.parseInt(userId));
			activeLoginDTO.setBrowser(browser + " " + version);
			activeLoginDTO.setUserId(userEntity);

			InetAddress IP = InetAddress.getLocalHost();
			activeLoginDTO.setIP(IP.getHostAddress());
			userService.saveActiveLogins(activeLoginDTO);
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return null;
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getActiveLogins", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getActiveLogins(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception{

		try {
			ArrayList<ActiveLoginDTO> activeLogin = userService.getActiveLogins();
			model.addAttribute("ACTIVELOGIN", activeLogin);
			return "activeLoginPage";
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/editMyProfile", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String editMyProfile(@ModelAttribute("user") UserForm userForm,
			ModelMap model, HttpServletRequest request) throws Exception{

		try {
			ArrayList<UserDto> myInfoList = new ArrayList<UserDto>();
			String userName = (String) request.getSession().getAttribute(
					"userSession");
			int userId = Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString());
			myInfoList = userService.viewMyInfo(userName);
			model.addAttribute("USERINFO", myInfoList);
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "editMyProfilePage";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/updateMyProfile", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String updateMyProfile(@ModelAttribute("user") UserForm userForm,
			ModelMap model, HttpServletRequest request,HttpSession session) throws Exception{

		try {
			String email = request.getParameter("email");
			String fName = request.getParameter("firstName");
			String lName = request.getParameter("lastName");
			String country = request.getParameter("country");
			String zipcode = request.getParameter("zipcode");
			String lat = request.getParameter("latitude");
			String lon = request.getParameter("longitude");
			DecimalFormat df = new DecimalFormat("#0.######");
			String latitude = df.format(Double.parseDouble(lat));
			String longitude = df.format(Double.parseDouble(lon));
			long phone = Long.parseLong(request.getParameter("phone"));
			String nickName = request.getParameter("nickName");
			String role = request.getParameter("role");
			String genre = request.getParameter("genre");
			
			/*String status = request.getParameter("status");
			String photo = request.getParameter("photo");*/
		    String status = request.getParameter("status");
				if(status.equals("null")){
					status = null;
				}
			String photo = request.getParameter("photo");
				if(photo.equals("null")){
					photo = null;
				}

			userDto.setUserId(Integer.parseInt(request.getSession().getAttribute("userSessionId").toString()));
			userDto.setEmail(email);
			userDto.setFirstName(fName);
			userDto.setLastName(lName);
			userDto.setPhone(phone);
			userDto.setCountry(country);
			userDto.setZipcode(zipcode);
			userDto.setLatitude(Double.parseDouble(latitude));
			userDto.setLongitude(Double.parseDouble(longitude));
			userDto.setRole(role);
			userDto.setGenre(genre);
			userDto.setNickName(nickName);
			
			userDto.setStatusMessage(status);
			userDto.setContentPath(photo);
			
			ArrayList<UserDto> list = userService.updateMyProfile(userDto);
			session.setAttribute("userDto", userDto);
			return "forward:/getMyProfilePage";
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/loadInspriedUsers", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String loadInspriedUsers(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		
		try {
			String email = (String) request.getSession()
					.getAttribute("userSession");
			userDto.setEmail(email);
			ArrayList<UserDto> userList = userService.listUsers(userDto);
			model.addAttribute("USER_LIST", userList);
			ArrayList<InspireDTO> inspireList = (ArrayList<InspireDTO>) request
					.getSession().getAttribute("INSPIRE_LIST");
			model.addAttribute("INSPIRE_LIST2", inspireList);
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "loadAllUsersList";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/saveInspriedUsers", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody
	String saveInspriedUsers(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception{
		String msg = "";
		try {
			int userId = Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString());
			String userIdList = request.getParameter("userArray");
			if (userIdList.length() == 0) {
				userService.deleteAllRecordsFromInspire(userId);
				msg = "Success";
			} else {
				userService.deleteAllRecordsFromInspire(userId);
				ArrayList<String> list = new ArrayList<String>();
				for (String str : userIdList.split(",")) {
					list.add(str);
				}
				for (int i = 0; i < list.size(); i++) {
					msg = userService.saveInspiredUser(userId, list.get(i));
				}
			}
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/updateBioForUser", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody
	String updateBioForUser(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		String msg = "";
		try {
			int userId = Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString());
			String bioValue = request.getParameter("bioValue");
			userDto.setUserId(userId);
			userDto.setBio(bioValue);
			msg = userService.updateUserBio(userDto);
		} catch (Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return msg;
	}

	@RequestMapping(value = "/getUserProfileInfo", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String getUserProfileInfo(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			int aboutUserId = Integer.parseInt(request
					.getParameter("aboutUserId"));
			int moduleId = Integer.parseInt(request.getParameter("moduleId"));
			ArrayList<UserDto> abtUsrList = userService
					.getUserProfileInfoByAboutId(aboutUserId);
			ArrayList<InspireDTO> inspireList = userService
					.getUsersInspireList(aboutUserId);
			request.getSession().setAttribute("INSPIRE_LIST", inspireList);
			model.addAttribute("ABT_USER_LIST", abtUsrList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "aboutOtherUser";
	}

	@RequestMapping(value = "/loadBumpDetails", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String loadBumpDetails(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {

		String userId = (String) request.getSession().getAttribute(
				"userSessionId");
		Map details = new HashMap();
		details = userService.loadBumpDetails(userId);
		model.addAttribute("USERLIST", details.get("UserList"));
		model.addAttribute("BUMPDETAILSLIST", details.get("BumpList"));
		model.addAttribute("loginUser", userId);
		return "bumpListPage";
	}

	@RequestMapping(value = "/addBumpDetails", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addBumpDetails(ModelMap model, HttpServletRequest request) {
		String details = request.getParameter("bumpDetails");
		StringTokenizer st = new StringTokenizer(details, ",");
		ArrayList checkedDetails = new ArrayList();
		while (st.hasMoreElements()) {

			checkedDetails.add(st.nextElement());
		}
		userService.addNewBumpDetails((String) request.getSession()
				.getAttribute("userSessionId"), checkedDetails);
		return "forward:/loadBumpDetails";
	}

	@RequestMapping(value = "/checkfav", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String checkfav(ModelMap model, HttpServletRequest request) {

		String userId = (String) request.getSession().getAttribute(
				"userSessionId");
		ArrayList<BumpDTO> favList = userService.checkfav(userId);
		model.addAttribute("FAVLIST", favList);
		return "getFavouritesDetails";
	}

	@RequestMapping(value = "/getfav", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getfav(ModelMap model, HttpServletRequest request) {

		String userId = (String) request.getSession().getAttribute(
				"userSessionId");
		ArrayList<BumpDTO> getfavList = userService.getfav(userId);
		model.addAttribute("FAVLIST", getfavList);
		return "getFavourites";
	}

	@RequestMapping(value = "/checkmutual", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String checkmutual(ModelMap model, HttpServletRequest request) {

		String userId = (String) request.getSession().getAttribute(
				"userSessionId");
		ArrayList<BumpDTO> mutualList = userService.checkmutual(userId);
		model.addAttribute("MUTUALLIST", mutualList);
		return "getMutualsDetails";
	}

	@RequestMapping(value = "/getmutual", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getmutual(ModelMap model, HttpServletRequest request) {

		String userId = (String) request.getSession().getAttribute(
				"userSessionId");
		ArrayList<BumpDTO> mutualList = userService.getmutual(userId);
		model.addAttribute("MUTUALLIST", mutualList);
		return "getMutuals";
	}

	@RequestMapping(value = "/actionFavourites", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String actionFavourites(ModelMap model, HttpServletRequest request) {

		String bumpId = request.getParameter("bumpId");
		String status = request.getParameter("status");
		String result = userService.actionFavourites(bumpId, status);
		return "forward:/checkfav";
	}

	@RequestMapping(value = "/actionMutual", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String actionMutual(ModelMap model, HttpServletRequest request) {

		String bumpId = request.getParameter("bumpId");
		String status = request.getParameter("status");
		String result = userService.actionMutual(bumpId, status);
		return "forward:/checkmutual";
	}

	@RequestMapping(value = "/checkmaybe", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String checkmaybe(ModelMap model, HttpServletRequest request) {

		String userId = (String) request.getSession().getAttribute(
				"userSessionId");
		ArrayList<BumpDTO> maybeList = userService.checkmaybe(userId);
		model.addAttribute("MAYBELIST", maybeList);
		return "getMayBeDetails";
	}

	// new bump
	@RequestMapping(value = "/loadBump", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String loadBump(ModelMap model, HttpServletRequest request) {

		String userId = (String) request.getSession().getAttribute(
				"userSessionId");

		return "loadBump";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/friendListFav", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String friendListFav(ModelMap model, HttpServletRequest request) throws Exception {
		
		try {
			String userId = (String) request.getSession().getAttribute(
					"userSessionId");
			Map details = new HashMap();
			details = userService.loadfriendListForFav(userId);
			ArrayList<BumpFavDTO> bumpFavList = (ArrayList<BumpFavDTO>) details.get("BumpFavList");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			for (BumpFavDTO bumpFavDTO : bumpFavList) {
				
				Date dobFromUser = formatter.parse((bumpFavDTO.getFromUser()).getBirthday());
				long diffTime = date.getTime() - dobFromUser.getTime();
				long divide = (1000*60);
				divide = divide*60;
				divide = divide*24;
				divide = divide*31;
				divide = divide*12;
				int age = (int) (diffTime/divide);
				(bumpFavDTO.getFromUser()).setAge(age+"");
				Date dobToUser = formatter.parse((bumpFavDTO.getToUser()).getBirthday());
				diffTime = date.getTime() - dobToUser.getTime();
				age = (int) (diffTime/divide);
				(bumpFavDTO.getToUser()).setAge(age+"");
				
			}
			model.addAttribute("BUMPFAVLIST", bumpFavList);
			model.addAttribute("USERLIST", details.get("UserList"));
			model.addAttribute("loginUser", userId);
				
			
		} catch(Exception e) {
			e.printStackTrace();
			logger.error("  EXCEPTION "+e);
			throw new Exception("EXCEPTION");
		}
		return "newFrndListFav";
		
	}
	

	@RequestMapping(value = "/friendListMutual", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String friendListMutual(ModelMap model, HttpServletRequest request) {

		String userId = (String) request.getSession().getAttribute(
				"userSessionId");
		Map details = new HashMap();
		details = userService.loadfriendListForMutual(userId);
		model.addAttribute("USERLIST", details.get("UserList"));
		model.addAttribute("BUMPMUTUALLIST", details.get("BumpMutualList"));
		model.addAttribute("loginUser", userId);
		return "friendListMutual";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/addFavourite", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addFavourite(ModelMap model, HttpServletRequest request) throws Exception{
		try {
			String from = request.getParameter("from");
			String to = request.getParameter("to");
			String type = request.getParameter("type");
			userService.addToFavourites(from, to, type);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "forward:/friendListFav";
	}

	@RequestMapping(value = "/addMutual", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addMutual(ModelMap model, HttpServletRequest request) {

		String from = request.getParameter("from");
		String to = request.getParameter("to");
		userService.addMutual(from, to);

		return "forward:/friendListMutual";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/actionFavouriteBump", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String actionFavouriteBump(ModelMap model, HttpServletRequest request) throws Exception{

		try {
			String bumpId = request.getParameter("bumpId");
			String status = request.getParameter("action");
			String result = userService.actionFavouriteBump(bumpId, status);
			return "forward:/friendListFav";
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}

	@RequestMapping(value = "/actionMutualBump", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String actionMutualBump(ModelMap model, HttpServletRequest request) {

		String bumpId = request.getParameter("bumpId");
		String status = request.getParameter("action");
		String result = userService.actionMutualBump(bumpId, status);
		return "forward:/friendListMutual";
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/changeMAYBE", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String changeMAYBE(ModelMap model, HttpServletRequest request) throws Exception{

		try {
			String bumpId = request.getParameter("bumpId");
			String status = request.getParameter("action");
			String result = userService.changeMAYBE(bumpId, status);
			return "forward:/friendListFav";
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}
	
	/*@RequestMapping(value = "/saveStatus", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String saveStatus(@ModelAttribute("statusForm") StatusForm statusForm,
			ModelMap model, HttpServletRequest request, HttpSession session) {
		String updateStatus="Failure";
		try {
			String userId = (String)request.getParameter("loginUser");
			String status = (String)request.getParameter("status");
			
			updateStatus = userService.saveStatus(userId, status);
			
			UserEntity entity = new UserEntity();
			entity.setUserId(Integer.parseInt(userId));
			statusForm.setUserId(entity);
			statusForm.setStatus(status);
			BeanUtils.copyProperties(statusDTO, statusForm);
			statusService.saveStatus(statusDTO);
			
			// monitor start
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if(newModuleId!=null) {
				monitorUtil.monitorPerModule(Integer.parseInt(userId), newModuleId, request, session);
			}
			// moitor end
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}*/
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/saveStatus", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody String saveStatus(@ModelAttribute("statusForm") StatusForm statusForm,
			ModelMap model, HttpServletRequest request, HttpSession session) throws Exception{
		String updateStatus="Failure";
		try {
			
			String userId = (String)request.getParameter("loginUser");
			String status = (String)request.getParameter("status");
			
			updateStatus = userService.saveStatus(userId, status);
			
			/*session.removeAttribute("userSession");
			session.removeAttribute("userSessionId");*/
			session.removeAttribute("userDto");
			
			UserDto dto1 = new UserDto();
			dto1 = userService.loginUserDetails(userId) ;
			if ((dto1 != null)) {
				if(dto1.getUserId() > -1){
					/*session.setAttribute("userSession", dto1.getEmail());
					session.setAttribute("userSessionId",Integer.toString(dto1.getUserId()));*/
					session.setAttribute("userDto", dto1);
				}else{
					return "Failure";
				}
			}
			// monitor start
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if(newModuleId!=null) {
				monitorUtil.monitorPerModule(Integer.parseInt(userId), newModuleId, request, session);
			}
			// moitor end
			
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "success";
	}
	
	@RequestMapping(value = "/genericException", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String genericException(ModelMap model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		session.removeAttribute("PREVIOUS_MODULE_ID");
		session.removeAttribute("PREVIOUS_START_DATE");

		session.removeAttribute("MEDIA_ALL_LIST");
		session.removeAttribute("userSession");
		session.removeAttribute("userSessionId");
		session.invalidate();

		Cookie cookie = new Cookie("reevoUserEmail", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		
		model.addAttribute("message", "Error Occured, Please Contact Administrator");
		return "loginUser";
	}
}