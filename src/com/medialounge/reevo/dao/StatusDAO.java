package com.medialounge.reevo.dao;

import java.util.List;

import com.medialounge.reevo.dto.StatusDTO;

public interface StatusDAO {

	void saveStatus(StatusDTO statusDTO);

	List<StatusDTO> getStatus(String userId);

}
