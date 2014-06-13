package com.medialounge.reevo.service;

import java.util.ArrayList;

import com.medialounge.reevo.dto.CarrierDTO;

public interface CarrierService {

	ArrayList<CarrierDTO> getCarrierList();

	String addCarrier(CarrierDTO carrierDTO);

}
