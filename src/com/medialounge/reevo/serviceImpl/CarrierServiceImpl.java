package com.medialounge.reevo.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.medialounge.reevo.dao.CarrierDAO;
import com.medialounge.reevo.dto.CarrierDTO;
import com.medialounge.reevo.service.CarrierService;

@Service("CarrierService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CarrierServiceImpl implements CarrierService {

	@Autowired
	CarrierDAO carrierDAO;
	
	@Override
	public ArrayList<CarrierDTO> getCarrierList() {
		return carrierDAO.getCarrierList();
	}

	@Override
	public String addCarrier(CarrierDTO carrierDTO) {
		return carrierDAO.addCarrier(carrierDTO);
	}

}
