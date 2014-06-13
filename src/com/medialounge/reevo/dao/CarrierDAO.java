package com.medialounge.reevo.dao;

import java.util.ArrayList;

import com.medialounge.reevo.dto.CarrierDTO;

public interface CarrierDAO {

	ArrayList<CarrierDTO> getCarrierList();

	String addCarrier(CarrierDTO carrierDTO);

}
