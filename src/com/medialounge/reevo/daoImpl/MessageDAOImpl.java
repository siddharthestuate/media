package com.medialounge.reevo.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.MessageDAO;
import com.medialounge.reevo.dto.MessageDTO;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.entity.MessageEntity;
import com.medialounge.reevo.entity.UserEntity;

@Repository("messageDAO")
public class MessageDAOImpl implements MessageDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List getUsers(String userId) {

		/*List<MessageEntity> message = sessionFactory.getCurrentSession()
				.createQuery(
						"FROM com.medialounge.reevo.entity.MessageEntity where messageTo = "
								+ userId + " AND deleted is " + null).list();*/
		List<MessageEntity> message = sessionFactory.getCurrentSession().createQuery("FROM com.medialounge.reevo.entity.MessageEntity where (messageTo = "+ userId + " OR messageFrom ="+ userId +") AND deleted is " + null).list();
		System.out.println();
		List user1 = new ArrayList();
		for (MessageEntity messageEntity : message) {
			if (!user1.contains(messageEntity.getMessageFrom())) {
				if(!(userId.equalsIgnoreCase(messageEntity.getMessageFrom()+""))){
					user1.add(messageEntity.getMessageFrom());
					List<UserEntity> user = sessionFactory
							.getCurrentSession()
							.createQuery(
									"FROM com.medialounge.reevo.entity.UserEntity where userId = "
											+ messageEntity.getMessageFrom())
							.list();
					for (UserEntity userEntity : user) {
						user1.add(userEntity.getFirstName() + " "
								+ userEntity.getLastName());
					}
					List<MessageEntity> messageCount = sessionFactory
							.getCurrentSession()
							.createQuery(
									"FROM com.medialounge.reevo.entity.MessageEntity where messageTo = "
											+ userId + " and messageFrom = " + messageEntity.getMessageFrom()
											+ " and deleted is " + null
											+ " and status = 'Unread'").list();
					String count = messageCount.size()+"";
					user1.add(count);
				}
			}
			if (!user1.contains(messageEntity.getMessageTo())) {
				if(!(userId.equalsIgnoreCase(messageEntity.getMessageTo()+""))){
					user1.add(messageEntity.getMessageTo());
					List<UserEntity> user = sessionFactory
							.getCurrentSession()
							.createQuery(
									"FROM com.medialounge.reevo.entity.UserEntity where userId = "
											+ messageEntity.getMessageTo())
							.list();
					for (UserEntity userEntity : user) {
						user1.add(userEntity.getFirstName() + " "
								+ userEntity.getLastName());
					}
					List<MessageEntity> messageCount = sessionFactory
							.getCurrentSession()
							.createQuery(
									"FROM com.medialounge.reevo.entity.MessageEntity where messageTo = "
											+ userId + " and messageFrom = " + messageEntity.getMessageTo()
											+ " and deleted is " + null
											+ " and status = 'Unread'").list();
					String count = messageCount.size()+"";
					user1.add(count);
				}
			}
		}
		System.out.println();
		return user1;
	}

	@Override
	public Map listMessages(String loginUser, String messageFrom) {

		try {
			// TrackMessageEntity messageEntity = new TrackMessageEntity();
			List messages = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.MessageEntity where ((message_to ="
									+ loginUser + " and message_from ="
									+ messageFrom + ") OR (message_to = "
									+ messageFrom + " and message_from = "
									+ loginUser + " )) AND deleted is null")
					.list();
			List list = new ArrayList();
			Map userMap = new HashMap();
			List userList = sessionFactory
					.getCurrentSession()
					.createQuery("FROM com.medialounge.reevo.entity.UserEntity")
					.list();
			for (Iterator iterator = userList.iterator(); iterator.hasNext();) {
				UserEntity userEntity = (UserEntity) iterator.next();
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, userEntity);
				System.out.println();
				userDto.getUserId();
				userMap.put(userDto.getUserId(), userDto.getFirstName() + " "
						+ userDto.getLastName());
			}
			for (Iterator iterator = messages.iterator(); iterator.hasNext();) {
				MessageEntity messageEntity = (MessageEntity) iterator.next();
				MessageDTO messageDto = new MessageDTO();
				BeanUtils.copyProperties(messageDto, messageEntity);
				list.add(messageDto);
			}
			userMap.put("messageList", list);
			return userMap;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public String getFriendMessageCount(String userId, String loginUser) {

		List<MessageEntity> message = sessionFactory
				.getCurrentSession()
				.createQuery(
						"FROM com.medialounge.reevo.entity.MessageEntity where messageTo = "
								+ loginUser + " and messageFrom = " + userId
								+ " and deleted is " + null
								+ " and status = 'Unread'").list();
		String size = message.size() + "";
		System.out.println(size);
		return size;
	}

	@Override
	public String viewFrndMsg(String messageTo, String messageFrom) {

		String hql = "update com.medialounge.reevo.entity.MessageEntity set status = 'Read' where messageTo= "
				+ messageTo + "and messageFrom= " + messageFrom;
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		return "viewed";
	}

	@Override
	public String userMessageCount(String userId) {

		List<MessageEntity> message = sessionFactory
				.getCurrentSession()
				.createQuery(
						"FROM com.medialounge.reevo.entity.MessageEntity where messageTo = "
								+ userId + " and deleted is " + null
								+ " and status = 'Unread'").list();
		String size = message.size() + "";
		System.out.println(size);
		return size;
	}
	@Override
	public String saveMessage(MessageDTO messageDto) {

		try {
			MessageEntity messageEntity = new MessageEntity();
			BeanUtils.copyProperties(messageEntity, messageDto);
			sessionFactory.getCurrentSession().saveOrUpdate(messageEntity);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}

	}

	@Override
	public ArrayList<String> getSpotLightDetails(int userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*@Override
	public void saveMessage(MessageDTO messageDto) {

		try {
			MessageEntity messageEntity = new MessageEntity();
			BeanUtils.copyProperties(messageEntity, messageDto);
			sessionFactory.getCurrentSession().saveOrUpdate(messageEntity);
			listMessages(messageEntity.getMessageFrom()+"",messageEntity.getMessageTo()+"");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}*/
}
