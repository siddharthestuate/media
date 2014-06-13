package com.medialounge.reevo.service;

import java.util.List;
import java.util.Map;

import com.medialounge.reevo.dto.SuggestionDTO;
import com.medialounge.reevo.dto.UserDto;

public interface SuggestionService {

	void addSuggestion(SuggestionDTO suggestionDTO) throws Exception;

	List getAdminSuggestion(String loginUser) throws Exception;
	
	List<SuggestionDTO> viewSuggestionDescription(String adminSuggestionId) throws Exception;

	void deleteAdminSuggestion(String adminSuggestionId) throws Exception;
	
	List<UserDto> getLoginUserDetails(String userId) throws Exception;


}
