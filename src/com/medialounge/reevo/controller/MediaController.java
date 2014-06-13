package com.medialounge.reevo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.medialounge.reevo.dto.MediaDto;
import com.medialounge.reevo.dto.MediaReviewDTO;
import com.medialounge.reevo.dto.UploadDto;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.dto.UserFeedbackDTO;
import com.medialounge.reevo.entity.MediaEntity;
import com.medialounge.reevo.entity.UserEntity;
import com.medialounge.reevo.form.MediaForm;
import com.medialounge.reevo.form.UserForm;
import com.medialounge.reevo.service.MediaService;
import com.medialounge.reevo.service.UserService;
import com.medialounge.reevo.serviceImpl.MediaHelpler;
import com.medialounge.reevo.util.GenericException;
import com.medialounge.reevo.util.MediaLoungeConstant;
import com.medialounge.reevo.util.MonitorUtil;

/**
 * The <code>MediaController</code> class is a part of application programming
 * holds process of entire media access
 * 
 * @author Ramachandran R
 * @Date: Dec 04 2013 10:20 AM
 * @version Revision: $1.1$. {@code} This code is copyright (c) 2013 Estuate
 *          Software Pvt. Ltd.
 **/
@Controller
@SessionAttributes("userName")
public class MediaController {

	private static final Logger logger = Logger.getLogger(MediaController.class);
	static Log log = LogFactory.getLog(MediaController.class.getName());

	@Autowired
	MediaService mediaService;

	@Autowired
	MediaHelpler mediaHelpler;

	@Autowired
	MediaDto mediaDto;

	@Autowired
	UserService userService;

	List<MediaDto> mediaDtos, commentsList;

	@Autowired
	UserDto userDto;

	@Autowired
	MediaReviewDTO mediaReviewDTO;

	@Autowired
	MonitorUtil monitorUtil;

	List<UserDto> userDtos;

	UploadDto uploadDto;

	/**
	 * @return [mediaList]
	 * @exception [exception class and description of the scenario]
	 * @see [URL listOfMedias]
	 * @see [class MediaController#method listOfMedias]
	 */

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/listOfMedias", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String listOfMedias(@ModelAttribute("media") MediaForm mediaForm,
			BindingResult result, HttpServletRequest request, ModelMap model,
			HttpSession session) throws Exception {
		String redirect = "";
		try {
			logger.info("listOfMedias Start");
			int userId = Integer.parseInt((String) request.getSession()
					.getAttribute("userSessionId"));
			String userName = (String) request.getSession().getAttribute(
					"userSession");
			model.addObject("userName", userName);
			String type = request.getParameter("type");

			mediaForm.setUserId(userId);
			mediaForm.setType(type);

			BeanUtils.copyProperties(mediaDto, mediaForm);

			mediaDtos = new ArrayList<MediaDto>();
			
			mediaDtos = mediaService.listOfMedias(mediaDto);
			
			if (type.equalsIgnoreCase(MediaLoungeConstant.MY_FEED)) {
				type = "My Feed";
			} else if (type.equalsIgnoreCase(MediaLoungeConstant.MEGA_FEED)) {
				type = "Mega Feed";
			} else if (type.equalsIgnoreCase(MediaLoungeConstant.SOCIAL_FEED)) {
				type = "Socail Feed";
			}
			
			model.addAttribute("type", type);
			model.addAttribute("mediaDtoList", mediaDtos);
			// request.setAttribute("MEDIA_ALL_LIST", mediaDtos);
			//request.getSession().setAttribute("MEDIA_ALL_LIST", mediaDtos);

			// monitor start
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if (newModuleId != null) {
				monitorUtil.monitorPerModule(userId, newModuleId, request, session);
			}
			// moitor end

			redirect = "mediasList";
			logger.info("listOfMedias End");
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "mediasList";

	}

	@RequestMapping(value = "/listOfMediasFMF", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String listOfMediasFMF(@ModelAttribute("media") MediaForm mediaForm,
			BindingResult result, HttpServletRequest request, ModelMap model,
			HttpSession session) throws Exception {
		String redirect = "";
		try {
			logger.info("listOfMediasFMF Start");
			ArrayList<MediaDto> mediaDtoList = new ArrayList<MediaDto>();
			mediaDtos = mediaService.listOfMediasFMF(mediaDto);
			model.addAttribute("mediaDtoFMFList", mediaDtos);
			redirect = "mediasFMF";
			logger.info("listOfMediasFMF End");
		} catch(Exception e) {
			e.printStackTrace();
			logger.error(" listOfMediasFMF EXCEPTION "+e);
		}
		return redirect;
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/fmfActivation", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String fmfActivation(@ModelAttribute("media") MediaForm mediaForm,
			BindingResult result, HttpServletRequest request, ModelMap model,
			HttpSession session) throws Exception {
		
		try {
			logger.info("fmfActivation Start");
			int userId = Integer.parseInt((String) request.getSession()
					.getAttribute("userSessionId"));
			int mediaId = Integer.parseInt(request.getParameter("media_id"));
			int updated = 0;
			updated = mediaService.fmfActivation(userId, mediaId);
			
			mediaDtos = mediaService.listOfMediasFMF(mediaDto);
			model.addAttribute("mediaDtoFMFList", mediaDtos);
			logger.info("fmfActivation End");
		} catch(Exception e) {
			logger.error("fmfActivation EXCEPTION "+e);
			throw new Exception("Exception");
		}		
		return "mediasFMF";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/listOfArchiveMedia", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String listOfArchiveMedia(
			@ModelAttribute("media") MediaForm mediaForm, BindingResult result,
			HttpServletRequest request, ModelMap model) throws Exception {
		String redirect = "";
		try {
			logger.info("listOfArchiveMedia Start");
			String userId = (String) request.getSession().getAttribute(
					"userSessionId");
			String userName = (String) request.getSession().getAttribute(
					"userSession");
			String type = request.getParameter("type");

			mediaForm.setUserId(Integer.parseInt(userId));
			mediaForm.setType(type);

			BeanUtils.copyProperties(mediaDto, mediaForm);

			mediaDtos = mediaService.listOfMedias(mediaDto);

			if (type.equalsIgnoreCase(MediaLoungeConstant.ARCHIVE)) {
				type = "Archive";
			}
			model.addAttribute("type", type);
			model.addAttribute("mediaDtoList", mediaDtos);
			model.addAttribute("userId", userId);
			
			 redirect = "mediasArchiveInner";		
			 logger.info("listOfArchiveMedia End");
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return redirect;
	}

	/**
	 * @return [mediaRegister]
	 * @exception [exception class and description of the scenario]
	 * @see [URL addMedia]
	 * @see [class MediaController#method addMedia]
	 */
	@RequestMapping(value = "/addMedia", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addMedia(@ModelAttribute("media") MediaForm mediaForm,
			ModelMap model, HttpServletRequest request) {
		logger.info("addMedia Start");
		String username = (String) request.getSession().getAttribute(
				"userSession");
		model.addAttribute("uName", username);
		logger.info("addMedia End");
		return null;
	}

	/**
	 * @return [mediaList]
	 * @exception [exception class and description of the scenario]
	 * @see [URL saveMedia]
	 * @see [class MediaController#method saveMedia]
	 */
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/saveMedia", method = RequestMethod.POST)
	public String saveMedia(@ModelAttribute("media") MediaForm mediaForm,
			ModelMap model, MultipartHttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		String redirect = "";
		try {
			logger.info("saveMedia Start");
			
			String userName = (String) request.getSession().getAttribute(
					"userSession");
			int userId = Integer.parseInt((String) request.getSession()
					.getAttribute("userSessionId"));
			String type = request.getParameter("type");

			String mediaName = request.getParameter("media_name");
			String mediaSearchKey = request.getParameter("media_search_key");
			String mediaComments = request.getParameter("media_comments");
			String mediaFmf = request.getParameter("media_fmf");
			
			mediaForm.setUserId(userId);
			mediaForm.setMediaName(mediaName);
			mediaForm.setMediaSearchKey(mediaSearchKey);
			mediaForm.setMediaComments(mediaComments);
			mediaForm.setMediaFmf(mediaFmf);
			mediaForm.setType(type);
			
			List<MultipartFile> files = new ArrayList<MultipartFile>();
			Iterator<String> itr = request.getFileNames();
			MultipartFile mpf = request.getFile(itr.next());
			files.add(mpf);
			
			// List<MultipartFile> files = mediaForm.getMediaFile();
			uploadDto = mediaHelpler.uploadFiles(userId, files);
			mediaForm.setMediaPath(uploadDto.getContentPath());
			mediaForm.setContentType(uploadDto.getContentType());
			BeanUtils.copyProperties(mediaDto, mediaForm);
			
			redirect = mediaService.saveMedia(mediaDto, userId);
			
			//BeanUtils.copyProperties(mediaDto, mediaForm);
			
			mediaDto.setType("myFeed");		
			mediaDto.setUserId((String)request.getSession()
					.getAttribute("userSessionId"));
			mediaDtos = mediaService.listOfMedias(mediaDto);
 
			model.addAttribute("uName", userName);
			model.addAttribute("type", type);
			model.addAttribute("mediaDtoList", mediaDtos);

			// monitor start
			String newModuleId = request.getParameter("moduleId");
			// checking condition because first time no need to start time
			if (newModuleId != null) {
				monitorUtil.monitorPerModule(userId, newModuleId, request, session);
			}
			// moitor end

			logger.info("saveMedia End");
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "mediasList";
	}

	/**
	 * @return [mediaList]
	 * @exception [exception class and description of the scenario]
	 * @see [URL searchMedia]
	 * @see [class MediaController#method searchMedia]
	 */
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/searchBasedOnMediaType", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String searchBasedOnMediaType(
			@ModelAttribute("media") MediaForm mediaForm, BindingResult result,
			HttpServletRequest request, ModelMap model) throws Exception {
		String redirect = "";
		try {
			logger.info("searchBasedOnMediaType Start");
			String userId = (String) request.getSession().getAttribute(
					"userSessionId");
			String mediaSearchKey = request.getParameter("media_key");
			String type = request.getParameter("type");

			mediaDtos = mediaService.searchBasedOnMediaType(mediaSearchKey, type,
					Integer.parseInt(userId));

			model.addAttribute("mediaDtoList", mediaDtos);
			redirect = "mediasList";
			logger.info("searchBasedOnMediaType End");	
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}		
		return redirect;
	}

	/**
	 * @return [mediaCommentView]
	 * @exception [exception class and description of the scenario]
	 * @see [URL addMediaComment]
	 * @see [class MediaController#method addMediaComment]
	 */
	/* Before Guru HTML
	@RequestMapping(value = "/addMediaComment", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView addMediaComment(HttpServletRequest request,
			MediaForm mediaForm, ModelMap model) {

		String username = (String) request.getSession()
				.getAttribute("userName");
		String uId = (String) request.getSession()
				.getAttribute("userSessionId");

		String mediaId = request.getParameter("media_Id");
		String userId = request.getParameter("user_id");
		String mediaComment = request.getParameter("media_comment");

		mediaForm.setFromUserId(uId);
		mediaForm.setMediaId(Integer.parseInt(mediaId));
		mediaForm.setMediaComments(mediaComment);

		try {
			BeanUtils.copyProperties(mediaDto, mediaForm);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mediaDtos = mediaService.addMediaComment(mediaDto);

		model.addAttribute("index", request.getParameter("index"));
		model.addAttribute("mediaId", mediaId);
		model.addAttribute("userId", userId);
		model.addAttribute("name", mediaComment);
		model.addAttribute("username", username);
		return new ModelAndView("mediaListComments", "commentsList", mediaDtos);
	}*/

	/**
	 * @return [null]
	 * @exception [exception class and description of the scenario]
	 * @see [URL downloadMedia]
	 * @see [class MediaController#method downloadFiles]
	 */

	/*@RequestMapping(value = "/downloadMedia", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String downloadFiles(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			logger.info("downloadFiles Start");
			String username = (String) request.getSession()
					.getAttribute("userName");

			String mediaId = request.getParameter("media_id");
			String userId = request.getParameter("user_id");
			String mediaPath = request.getParameter("mediaPath");
			
			mediaHelpler.downloadFiles(request, response, mediaPath);
			
			// If different user tracking, same user no tracking
			// if(!username.equals(userId)) {
			mediaDto.setMediaId(Integer.parseInt(mediaId));
			mediaDto.setAccessUserId(username);
			mediaService.addMediaAccessUser(mediaDto);
			// }
			logger.info("downloadFiles End");
		} catch(Exception e) {
			e.printStackTrace();
			logger.error(" downloadFiles EXCEPTION "+e);
		}
		return null;
	}*/

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/mediasViewInPopup", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String mediasViewInPopup(
			@ModelAttribute("media") MediaForm mediaForm, BindingResult result,
			HttpServletRequest request, ModelMap model) throws Exception {
		
		String redirect = "";
		try {
			
			String contentType = request.getParameter("content_type");
			String contentPath = request.getParameter("content_path");
			String mediaId = request.getParameter("mediaId");

			model.addAttribute("contentType", contentType);
			model.addAttribute("contentPath", contentPath);
			model.addAttribute("mediaId", mediaId);

			MediaDto mediaDto = new MediaDto();
			mediaDto = mediaService.mediasGetRating(mediaId);
			model.addAttribute("mediaDto", mediaDto);
			redirect = "mediasViewPopupInner";
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}

		return redirect;
	}

	@RequestMapping(value = "/mediasFMFPopUp", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String mediasFMFPopUp(@ModelAttribute("media") MediaForm mediaForm,
			BindingResult result, HttpServletRequest request, ModelMap model) {

		String contentType = request.getParameter("content_type");
		String contentPath = request.getParameter("content_path");
		String mediaId = request.getParameter("mediaId");

		model.addAttribute("contentType", contentType);
		model.addAttribute("contentPath", contentPath);
		model.addAttribute("mediaId", mediaId);

		String redirect = "mediasFMFPopupInner";
		return redirect;
	}

	/**
	 * @return [mediaAccessList]
	 * @exception [exception class and description of the scenario]
	 * @see [URL listOfAccessUser]
	 * @see [class MediaController#method listOfAccessUser]
	 */

	/* Before Guru HTML
	@RequestMapping(value = "/listOfAccessUser", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView listOfAccessUser(
			@ModelAttribute("media") MediaForm mediaForm,
			HttpServletRequest request, ModelMap model) {

		String username = (String) request.getSession()
				.getAttribute("userName");
		mediaDto.setUserId(username);
		mediaDtos = mediaService.listOfAccessUser(mediaDto);

		return new ModelAndView("mediaAccessList", "mediaDtoList", mediaDtos);
	}*/

	/**
	 * @return [paidUserRegister]
	 * @exception [exception class and description of the scenario]
	 * @see [URL paidUser]
	 * @see [class MediaController#method paidUser]
	 */

	/* Before Guru HTML
	@RequestMapping(value = "/paidUser", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String paidUser(@ModelAttribute("media") MediaForm mediaForm) {
		return "paidUserRegister";
	}
	*/

	/**
	 * @return [status]
	 * @exception [exception class and description of the scenario]
	 * @see [URL checkNumber]
	 * @see [class MediaController#method checkNumber]
	 */

	/* Before Guru HTML
	@RequestMapping(value = "/checkNumber", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody
	String checkNumber(HttpServletRequest request, MediaForm mediaForm,
			BindingResult result) {
		String status = "";
		String checkNumber = request.getParameter("checkNumber");
		status = mediaService.checkNumber(checkNumber);
		return status;
	}*/

	/**
	 * @return [paidUserRegisterSuccess]
	 * @exception [exception class and description of the scenario]
	 * @see [URL savePaidContentRegister]
	 * @see [class MediaController#method savePaidContentRegister]
	 */

	/* Before Guru HTML
	@RequestMapping(value = "/savePaidContentRegister", method = {
			RequestMethod.GET, RequestMethod.POST })
	public ModelAndView savePaidContentRegister(
			@ModelAttribute("myFeedRegister") MediaForm mediaForm,
			ModelMap model, HttpServletRequest request) {

		int userId = Integer.parseInt((String) request.getSession()
				.getAttribute("userSessionId"));
		mediaForm.setUserId(userId);

		try {
			List<MultipartFile> files = mediaForm.getMediaFile();
			uploadDto = mediaHelpler.uploadFiles(userId, files);
			mediaForm.setMediaPath(uploadDto.getContentPath());
			mediaForm.setContentType(uploadDto.getContentType());
			// mediaForm = mediaHelpler.mediaUploadFiles(userId, mediaForm);
			BeanUtils.copyProperties(mediaDto, mediaForm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mediaService.savePaidContent(mediaDto);

		return new ModelAndView("paidUserRegisterSuccess", model);
	}
	*/

	@RequestMapping(value = "/userCategory", method = { RequestMethod.POST })
	public String userCategory(HttpServletRequest request, ModelMap model,
			HttpSession session) {
		// monitor start
		int userId = Integer.parseInt((String) request.getSession()
				.getAttribute("userSessionId"));
		String newModuleId = request.getParameter("moduleId");
		// checking condition because first time no need to start time
		if (newModuleId != null) {
			monitorUtil.monitorPerModule(userId, newModuleId, request, session);
		}
		// moitor end
		return "mediasUserCategory";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getUserCategoryByType", method = { RequestMethod.POST })
	public String getUserCategoryByType(HttpServletRequest request,
			ModelMap model) throws Exception {
		try {
			String userType = request.getParameter("userType");
			ArrayList<UserDto> userTypeList = userService.getUsersByType(userType);
			request.setAttribute("USER_TYPE_LIST", userTypeList);
			request.setAttribute("USER", userType);
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "mediasUserCategoryByType";
	}

	@RequestMapping(value = "/sendCommandToExpert", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String sendCommandToExpert(HttpServletRequest request,
			MediaForm mediaForm, ModelMap model) {
		String userId = request.getParameter("user_id");
		String mediaId = request.getParameter("media_id");
		userDtos = mediaService.getExpert(userId);
		ArrayList<UserDto> listOfDjs, listOfVs, listOfJournalist, listOfAnchor;
		listOfDjs = new ArrayList<UserDto>();
		listOfVs = new ArrayList<UserDto>();
		listOfJournalist = new ArrayList<UserDto>();
		listOfAnchor = new ArrayList<UserDto>();
		UserDto userDto = null;
		try {
			for (UserDto ud : userDtos) {
				if (ud.getDj().equals("Y")) {
					userDto = new UserDto();
					BeanUtils.copyProperties(userDto, ud);
					listOfDjs.add(userDto);
				} else if (ud.getAnchor().equals("Y")) {
					userDto = new UserDto();
					BeanUtils.copyProperties(userDto, ud);
					listOfAnchor.add(userDto);
				}
				if (ud.getVs().equals("Y")) {
					userDto = new UserDto();
					BeanUtils.copyProperties(userDto, ud);
					listOfVs.add(userDto);
				} else if (ud.getJournalist().equals("Y")) {
					userDto = new UserDto();
					BeanUtils.copyProperties(userDto, ud);
					listOfJournalist.add(userDto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("djList", listOfDjs);
		model.addAttribute("vsList", listOfVs);
		model.addAttribute("journaList", listOfJournalist);
		model.addAttribute("anchorList", listOfAnchor);
		model.addAttribute("mediaId", mediaId);
		return "mediaSendToExpert";
	}

	@RequestMapping(value = "/saveCommentsToExpert", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	String saveCommentsToExpert(HttpServletRequest request, UserForm userForm,
			ModelMap model) {
		boolean check = false;
		String str = "";
		String[] djvalues = request.getParameterValues("djValues");
		String[] vsValues = request.getParameterValues("vsValues");
		String[] journalistValues = request
				.getParameterValues("journalistValues");
		String[] anchorValues = request.getParameterValues("anchorValues");
		String mediaId = request.getParameter("media_Id");

		userForm.setDjvalues(djvalues);
		userForm.setVsValues(vsValues);
		userForm.setJournalistValues(journalistValues);
		userForm.setAnchorValues(anchorValues);
		userForm.setMediaId(mediaId);

		try {
			BeanUtils.copyProperties(userDto, userForm);
		} catch (Exception e) {
			e.printStackTrace();
		}

		check = mediaService.saveCommentsToExpert(userDto);
		if (check) {
			str = "Successfully inserted";
		} else {
			str = "there is no data insert";
		}
		return str;
	}

	@RequestMapping(value = "/viewCommants", method = { RequestMethod.POST })
	public String viewCommants(HttpServletRequest request, UserForm userForm,
			ModelMap model) {

		String mediaId = request.getParameter("media_id");
		userDtos = mediaService.viewCommantsList(mediaId);
		model.addAttribute("userDtosList", userDtos);
		return "mediaComments";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/saveUserComments", method = { RequestMethod.POST })
	public @ResponseBody String saveUserComments(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			String userType = request.getParameter("userType");
			int listUser = Integer.parseInt(request.getParameter("listUser"));
			String comments = request.getParameter("comments");
			String mediaId = request.getParameter("mediaId");
			String userId = (String) request.getSession().getAttribute(
					"userSessionId");
			String title = request.getParameter("title");

			MediaEntity mediaEntity = new MediaEntity();
			mediaEntity.setMediaId(Integer.parseInt(mediaId));
			mediaReviewDTO.setMediaId(mediaEntity);

			mediaReviewDTO.setType(userType);

			UserEntity entity = new UserEntity();
			entity.setUserId(listUser);
			mediaReviewDTO.setReviewerUserId(entity);

			mediaReviewDTO.setUserComment(comments);

			UserEntity entity2 = new UserEntity();
			entity2.setUserId(Integer.parseInt(userId));
			mediaReviewDTO.setUserId(entity2);

			mediaReviewDTO.setTitle(title);

			String msg = mediaService.saveUserComment(mediaReviewDTO);
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		
	}

	@RequestMapping(value = "/fetchMediaComments", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String fetchMediaComments(HttpServletRequest request,
			ModelMap model, HttpSession session) {
		String mediaId = request.getParameter("media_id");
		model.addAttribute("mediaId", mediaId);
		// userDtos = mediaService.viewCommantsList(mediaId);
		// model.addAttribute("userDtosList", userDtos);

		// monitor start
		int userId = Integer.parseInt((String) request.getSession()
				.getAttribute("userSessionId"));
		String newModuleId = request.getParameter("moduleId");
		// checking condition because first time no need to start time
		if (newModuleId != null) {
			monitorUtil.monitorPerModule(userId, newModuleId, request, session);
		}
		// moitor end
		return "mediasUserComments";
	}

	@RequestMapping(value = "/getExpertCommentByExpertType", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String getExpertCommentByExpertType(HttpServletRequest request,
			ModelMap model) {
		String expertType = request.getParameter("expertType");
		String mediaId = request.getParameter("mediaId");
		userDtos = mediaService.getExpertCommentsList(mediaId, expertType);
		model.addAttribute("userDtosList", userDtos);
		return "mediasExpertComments";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/getListOfKeys", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getListOfKeys(HttpServletRequest request, ModelMap model,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		try {
			
			int userId = Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString());
			String fmfCheck = "";
			List<MediaDto> duplicateList = new ArrayList<MediaDto>();

			mediaDtos = mediaService.getListOfKeys(userId);

			for (MediaDto dto : mediaDtos) {
				String[] splitted = dto.getMediaSearchKey().split(",");
				for (String s : splitted) {
					mediaDto = new MediaDto();
					mediaDto.setMediaSearchKey(s);
					fmfCheck = dto.getFmfCheck();
					duplicateList.add(mediaDto);
				}
			}

			List<String> s = new ArrayList<String>();
			List<MediaDto> mediaDtoList = new ArrayList<MediaDto>();
			for (int i = 0; i < duplicateList.size(); i++) {
				String item = duplicateList.get(i).getMediaSearchKey().trim();
				if (!s.contains(item)) {
					s.add(item);
					mediaDto = new MediaDto();
					mediaDto.setMediaSearchKey(item);
					mediaDtoList.add(mediaDto);
				}
			}
			model.addAttribute("mediaDtosList", mediaDtoList);
			if (mediaDtos.size() == 0) {
				fmfCheck = "N";
			}
			model.addAttribute("fmfCheck", fmfCheck);
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

		return "mediasUploadFilesInner";
	}

	@RequestMapping(value = "/spotLight", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String spotLight(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			String userId = request.getParameter("loginUser");
			Map details = new HashMap();
			details = mediaService.getSpotLightDetails(userId);
			ArrayList<MediaReviewDTO> mediaReview = null;
			mediaReview = (ArrayList<MediaReviewDTO>) details.get("mediaReview");
			model.addAttribute("mediaReview", mediaReview);
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "spotLightPage";
	}

	@RequestMapping(value = "/forwardToFeedbackPage", method = { RequestMethod.POST })
	public String forwardToFeedbackPage(HttpServletRequest request,
			ModelMap model, HttpSession session) {

		int mediaId = Integer.parseInt(request.getParameter("meidaId"));
		int userId = Integer.parseInt((String) request.getSession()
				.getAttribute("userSessionId"));

		request.setAttribute("MEDIA_ID", mediaId);
		ArrayList<UserFeedbackDTO> feedbackList = mediaService
				.getFeedbackByMediaId(mediaId);
		model.addAttribute("FEEDBACK_LIST", feedbackList);

		List<MediaDto> duplicateList = new ArrayList<MediaDto>();
		/* mediaDtos = mediaService.listOfSearchKeys(userId); */

		mediaDtos = mediaService.feedBackKeys(mediaId);

		for (MediaDto dto : mediaDtos) {
			String[] splitted = dto.getMediaSearchKey().split(",");
			for (String s : splitted) {
				mediaDto = new MediaDto();
				mediaDto.setMediaSearchKey(s);
				duplicateList.add(mediaDto);
			}
		}

		List<String> s = new ArrayList<String>();
		List<MediaDto> mediaDtoList = new ArrayList<MediaDto>();
		for (int i = 0; i < duplicateList.size(); i++) {
			String item = duplicateList.get(i).getMediaSearchKey();
			if (!s.contains(item)) {
				s.add(item);
				mediaDto = new MediaDto();
				mediaDto.setMediaSearchKey(item);
				mediaDtoList.add(mediaDto);
			}
		}
		model.addAttribute("mediaDtoList", mediaDtoList);

		// monitor start
		String newModuleId = request.getParameter("moduleId");
		// checking condition because first time no need to start time
		if (newModuleId != null) {
			monitorUtil.monitorPerModule(userId, newModuleId, request, session);
		}
		// moitor end
		return "forwardToFeedbackPage";
	}

	@RequestMapping(value = "/saveUserFeedback", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody
	String saveUserFeedback(HttpServletRequest request, ModelMap model) {

		String msg = "";
		try {
			int mediaId = Integer.parseInt(request.getParameter("mediaId"));

			String type = request.getParameter("searchKey");
			String description = request.getParameter("desc");

			String colour = request.getParameter("colour");

			UserFeedbackDTO feedbackDTO = new UserFeedbackDTO();
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(Integer.parseInt(request.getSession()
					.getAttribute("userSessionId").toString()));

			feedbackDTO.setMediaId(mediaId);
			feedbackDTO.setUserId(userEntity);
			feedbackDTO.setMediaSearchKey(type);
			feedbackDTO.setDescription(description);
			feedbackDTO.setColour(colour);

			msg = mediaService.saveFeedback(feedbackDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/mediasUpdateRating", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	String mediasUpdateRating1(HttpServletRequest request, ModelMap model) throws Exception {
		
		try {
			int mediaId = Integer.parseInt(request.getParameter("mediaId"));
			int ratingCurrentValue = Integer.parseInt(request
					.getParameter("ratingCurrentValue"));
			int countOfUsersRated = Integer.parseInt(request
					.getParameter("countOfUsersRated"));
			double ratingAverage = Double.parseDouble(request
					.getParameter("ratingAverage"));

			String msg = mediaService.mediasUpdateRating(mediaId,
					ratingCurrentValue, countOfUsersRated, ratingAverage);
			
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "success";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/loadCharts", method = { RequestMethod.POST })
	public String loadCharts(HttpServletRequest request, ModelMap model) throws Exception{

		try {
			Map m = new HashMap();
			m = mediaService.getCharts();
			List<MediaDto> media = (List<MediaDto>) m.get("media");
	
			List<UserDto> user = (List<UserDto>) m.get("user");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
		} catch (ParseException e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "chartsMML";

	}

	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/loadPopularVideos", method = { RequestMethod.POST })
	public String loadPopularVideos(HttpServletRequest request, ModelMap model) throws Exception{

		try {
			Map m = new HashMap();
			m = mediaService.loadPopularVideos();
			List<MediaDto> media = (List<MediaDto>) m.get("media");
	
			List<UserDto> user = (List<UserDto>) m.get("user");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
		} catch (ParseException e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return "chartsMML";
	}
	
	/*@ExceptionHandler(GenericException.class)
	@ResponseStatus(value=HttpStatus.BAD_REQUEST) 
    @ResponseBody
    public String handleAllException(GenericException ex) {
        return ex.getErrCode();
    }*/
}