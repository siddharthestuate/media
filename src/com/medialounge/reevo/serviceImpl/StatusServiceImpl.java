package com.medialounge.reevo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.StatusDAO;
import com.medialounge.reevo.dto.StatusDTO;
import com.medialounge.reevo.service.StatusService;

@Service("statusService")  
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true) 
public class StatusServiceImpl implements StatusService {

	@Autowired
	StatusDAO statusDAO;

	@Override
	public void saveStatus(StatusDTO statusDTO) {
		
		statusDAO.saveStatus(statusDTO);
		
	}

	@Override
	public List<StatusDTO> getStatus(String userId) {
		
		return statusDAO.getStatus(userId);
	}
}
