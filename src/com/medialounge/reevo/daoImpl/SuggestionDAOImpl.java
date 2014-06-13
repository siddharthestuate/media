package com.medialounge.reevo.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.SuggestionDAO;
import com.medialounge.reevo.dto.SuggestionDTO;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.entity.SuggestionEntity;
import com.medialounge.reevo.entity.UserEntity;

@Repository("suggestionDAO")
public class SuggestionDAOImpl implements SuggestionDAO {

	private static Logger logger = Logger.getLogger(SuggestionDAOImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addSuggestion(SuggestionDTO suggestionDTO) throws Exception{
		
		try{
			SuggestionEntity entity = new SuggestionEntity();
			BeanUtils.copyProperties(entity, suggestionDTO);
			sessionFactory.getCurrentSession().saveOrUpdate(entity);
		}catch(Exception e){
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		
	}

	@Override
	public List getAdminSuggestion(String loginUser) throws Exception{
		
		List<SuggestionDTO> suggestionList = new ArrayList<SuggestionDTO>();
		try {
			List<SuggestionEntity> suggestion = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.SuggestionEntity where suggestionTo ="+ loginUser+" and deleted is null").list();
			for (SuggestionEntity suggEntity : suggestion) {
				SuggestionDTO suggestionDTO  = new SuggestionDTO();
				BeanUtils.copyProperties(suggestionDTO, suggEntity);
				suggestionList.add(suggestionDTO);
			}
			
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return suggestionList;
	}

	@Override
	public List<SuggestionDTO> viewSuggestionDescription(
			String adminSuggestionId) throws Exception{

		List<SuggestionDTO> viewSuggestionList = new ArrayList<SuggestionDTO>();
		try {
			List<SuggestionEntity> viewSuggestion = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.SuggestionEntity where suggestionId ="+ adminSuggestionId).list();
			for (SuggestionEntity suggEntity : viewSuggestion) {
				SuggestionDTO suggestionDTO  = new SuggestionDTO();
				BeanUtils.copyProperties(suggestionDTO, suggEntity);
				viewSuggestionList.add(suggestionDTO);
			}
			
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return viewSuggestionList;
	}

	@Override
	public void deleteAdminSuggestion(String adminSuggestionId) throws Exception{

		try {
			String hql = "update com.medialounge.reevo.entity.SuggestionEntity set deleted ='deleted' where suggestionId= "+adminSuggestionId;
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			query.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}
	
	@Override
	public List<UserDto> getLoginUserDetails(String userId) throws Exception{
		
		List<UserDto> viewUser = new ArrayList<UserDto>();
		try {
			List<UserEntity> userDetails = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.UserEntity where userId ="+ userId).list();
			for (UserEntity userEntity : userDetails) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, userEntity);
				viewUser.add(userDto);
			}
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return viewUser;
	}
}
