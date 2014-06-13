package com.medialounge.reevo.service;

import java.util.List;

import com.medialounge.reevo.dto.StatusDTO;

public interface StatusService {

	void saveStatus(StatusDTO statusDTO);

	List<StatusDTO> getStatus(String userId);

}
