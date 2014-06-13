package com.medialounge.reevo.daoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.CarrierDAO;
import com.medialounge.reevo.dto.CarrierDTO;
import com.medialounge.reevo.entity.CarrierEntity;

@Repository("CarrierDAO")
public class CarrierDAOImpl implements CarrierDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public ArrayList<CarrierDTO> getCarrierList() {
		ArrayList<CarrierDTO> list = new ArrayList<CarrierDTO>();
		try {
			CarrierDTO carrierDTO = null;
			List jobList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.CarrierEntity order by carrierId desc")
					.list();
			for (Iterator iterator = jobList.iterator(); iterator.hasNext();) {
				carrierDTO = new CarrierDTO();
				CarrierEntity carrierEntity = (CarrierEntity) iterator.next();
				carrierDTO.setIndustry(carrierEntity.getIndustry());
				carrierDTO.setExpertise(carrierEntity.getExpertise());
				carrierDTO.setExperience(carrierEntity.getExperience());
				carrierDTO.setContact(carrierEntity.getContact());

				list.add(carrierDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String addCarrier(CarrierDTO carrierDTO) {
		String msg = null;
		try {
			CarrierEntity carrierEntity = new CarrierEntity();
			BeanUtils.copyProperties(carrierEntity, carrierDTO);
			sessionFactory.getCurrentSession().save(carrierEntity);
			msg = "Carrier Added successfully...";
		} catch (Exception e) {
			msg = "Error in Carrier Add...";
			e.printStackTrace();
		}
		return msg;
	}

}
