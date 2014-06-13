package com.medialounge.reevo.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.FeedbackSuggestionDAO;
import com.medialounge.reevo.dto.MediaDto;
import com.medialounge.reevo.dto.MediaReviewDTO;
import com.medialounge.reevo.entity.MediaEntity;
import com.medialounge.reevo.entity.MediaReviewEntity;

@Repository("feedbackSuggestionDao")
public class FeedbackSuggestionDAOImpl implements FeedbackSuggestionDAO {

	private static final Logger logger = Logger.getLogger(FeedbackSuggestionDAOImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List getFdbSuggList(String loginUser) throws Exception {

		List<MediaReviewEntity> suggestion = sessionFactory.getCurrentSession().createQuery("FROM com.medialounge.reevo.entity.MediaReviewEntity where reviewerUserId  ="+ loginUser +" AND reviewStatus = 'Viewed' AND comments is null order by created DESC").list();
		List<MediaReviewDTO> media = new ArrayList<MediaReviewDTO>();
		try {
			
			for (MediaReviewEntity reviewEntity : suggestion) {
				MediaReviewDTO reviewDTO = new MediaReviewDTO();
				BeanUtils.copyProperties(reviewDTO, reviewEntity);
				media.add(reviewDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("exception");
		}
		return media;
	}

	@Override
	public void saveSuggestion(String suggestionId, String feedback,String publish,String keyword) throws Exception{
		try {
			String hql = "update com.medialounge.reevo.entity.MediaReviewEntity set comments =:comments , publish = '"+ publish +"', keyword = '"+ keyword +"' where mediaReviewId= "
					+ suggestionId ;
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql).setParameter("comments", feedback);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}
	@Override
	public void ignoreSuggestion(String suggestionId) throws Exception{
		try {
			String hql = "update com.medialounge.reevo.entity.MediaReviewEntity set reviewStatus = 'Ignored' where mediaReviewId= "
					+ suggestionId ;
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}
	
	@Override
	public Map blossomSuggestion(String loginUser) throws Exception {
		
		Map blossom = new HashMap();
		List<MediaReviewEntity> suggestion = sessionFactory.getCurrentSession().createQuery("FROM com.medialounge.reevo.entity.MediaReviewEntity where userId  ="+ loginUser +"order by created DESC" ).list();
		List<MediaReviewDTO> suggestionList = new ArrayList<MediaReviewDTO>();
		try {
			
			for (MediaReviewEntity reviewEntity : suggestion) {
				MediaReviewDTO reviewDTO = new MediaReviewDTO();
				BeanUtils.copyProperties(reviewDTO, reviewEntity);
				suggestionList.add(reviewDTO);
			}
			blossom.put("REVIEW", suggestionList);
			
			
			List<MediaEntity> media = sessionFactory.getCurrentSession().createQuery("FROM com.medialounge.reevo.entity.MediaEntity where userEntity  ="+ loginUser +"order by created DESC" ).list();
			List<MediaDto> mediaList = new ArrayList<MediaDto>();
			
			for (MediaEntity mediaEntity : media) {
				MediaDto mediaDto = new MediaDto();
				BeanUtils.copyProperties(mediaDto, mediaEntity);
				mediaList.add(mediaDto);
			} 
			blossom.put("MEDIA", mediaList);
			
			
		} catch(Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("this is io exception");
		}
		
		return blossom;
	}

	@Override
	public List getReviewDetails(String reviewId) throws Exception{
		
		List<MediaReviewDTO> mediaReviewDetails = new ArrayList<MediaReviewDTO>();
		List<MediaReviewEntity> mediaList = sessionFactory.getCurrentSession().createQuery("FROM com.medialounge.reevo.entity.MediaReviewEntity where mediaReviewId  ="+ reviewId ).list();
		try {
			for (MediaReviewEntity reviewEntity : mediaList) {
				MediaReviewDTO reviewDTO = new MediaReviewDTO();
				BeanUtils.copyProperties(reviewDTO, reviewEntity);
				mediaReviewDetails.add(reviewDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return mediaReviewDetails;
	}

	@Override
	public void publishReview(String reviewId) throws Exception{
		try {
			String hql = "update com.medialounge.reevo.entity.MediaReviewEntity set  publish = 'YY' where mediaReviewId= "+ reviewId ;
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
	}


}
