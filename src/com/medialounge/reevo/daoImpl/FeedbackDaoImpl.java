package com.medialounge.reevo.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.FeedbackDao;
import com.medialounge.reevo.dto.FeedbackDto;
import com.medialounge.reevo.entity.FeedbackEntity;
import com.medialounge.reevo.entity.MediaEntity;
import com.medialounge.reevo.entity.UserEntity;

@Repository("feedbackDao")
public class FeedbackDaoImpl implements FeedbackDao {

	private static final Logger logger = Logger.getLogger(FeedbackDaoImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	ArrayList<FeedbackDto> previousFeedbackOfParticularMedia = new ArrayList<FeedbackDto>();
	ArrayList<FeedbackDto> allMediaFeedbackDetailsOfParticularUser = new ArrayList<FeedbackDto>();

	@Override
	public void submitNewFeedBack(String color, String keyword, int mediaId,
			int userId, String description) throws Exception {

		try {
			FeedbackEntity feedbackEntity = new FeedbackEntity();
			feedbackEntity.setColour(color);
			feedbackEntity.setMediaSearchKey(keyword);
			MediaEntity mediaEntity = new MediaEntity();
			mediaEntity.setMediaId(mediaId);
			feedbackEntity.setMediaEntity(mediaEntity);
			UserEntity userEntity = new UserEntity();
			userEntity.setUserId(userId);
			feedbackEntity.setFeedbackUserDetails((userEntity));
			feedbackEntity.setDescription(description);
			sessionFactory.getCurrentSession().saveOrUpdate(feedbackEntity);
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}
	}

	public ArrayList<FeedbackDto> getPreviousFeedback(int mediaId)
			throws Exception {
		try {
			List<FeedbackEntity> feedbackEntityList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.FeedbackEntity as f where f.mediaEntity.mediaId = "
									+ mediaId + " order by created desc")
					.list();
			previousFeedbackOfParticularMedia = new ArrayList<FeedbackDto>();
			for (FeedbackEntity feedBackEntity : feedbackEntityList) {
				
				FeedbackDto feedbackDto = new FeedbackDto();
				BeanUtils.copyProperties(feedbackDto, feedBackEntity);
				previousFeedbackOfParticularMedia.add(feedbackDto);

			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}

		return previousFeedbackOfParticularMedia;
	}

	public ArrayList<FeedbackDto> getAllMediaFeedbackDetailsOfParticularUser(
			int userId) throws Exception {
		try {
			List<FeedbackEntity> feedbackEntityList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.FeedbackEntity as f where f.mediaEntity.userEntity.userId = "
									+ userId + " order by created desc").list();
			allMediaFeedbackDetailsOfParticularUser = new ArrayList<FeedbackDto>();
			for (FeedbackEntity feedBackEntity : feedbackEntityList) {
				
				FeedbackDto feedbackDto = new FeedbackDto();
				BeanUtils.copyProperties(feedbackDto, feedBackEntity);
				allMediaFeedbackDetailsOfParticularUser.add(feedbackDto);

			}
		} catch (Exception e) {
			logger.error("EXCEPTION " + e);
			throw new Exception("Exception");
		}

		return allMediaFeedbackDetailsOfParticularUser;
	}
}
