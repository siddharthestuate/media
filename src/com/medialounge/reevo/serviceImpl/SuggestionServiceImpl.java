package com.medialounge.reevo.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.SuggestionDAO;
import com.medialounge.reevo.dto.SuggestionDTO;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.service.SuggestionService;

@Service("suggestionService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SuggestionServiceImpl implements SuggestionService {

	@Autowired
	SuggestionDAO suggestionDao;
	
	@Override
	public void addSuggestion(SuggestionDTO suggestionDTO) throws Exception{
		
		suggestionDao.addSuggestion(suggestionDTO);
	}

	@Override
	public List getAdminSuggestion(String loginUser) throws Exception{

		return suggestionDao.getAdminSuggestion(loginUser);
	}
	
	@Override
	public List<SuggestionDTO> viewSuggestionDescription (
			String adminSuggestionId) throws Exception{
		
		return suggestionDao.viewSuggestionDescription(adminSuggestionId);
	}

	@Override
	public void deleteAdminSuggestion(String adminSuggestionId) throws Exception{

		suggestionDao.deleteAdminSuggestion(adminSuggestionId);
	}

	@Override
	public List<UserDto> getLoginUserDetails(String userId) throws Exception{

		return suggestionDao.getLoginUserDetails(userId);
	}

}
