package com.medialounge.reevo.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.ChatDao;
import com.medialounge.reevo.dto.ChatDto;
import com.medialounge.reevo.dto.UserDto;
import com.medialounge.reevo.entity.ChatEntity;
import com.medialounge.reevo.entity.UserEntity;
@Repository("chatDao")
public class ChatDaoImpl implements ChatDao {
	
	private static final Logger logger = Logger.getLogger(ChatDaoImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	Query query = null;
	UserDto userDto;
	private ArrayList<UserDto>  messagedUserArrayList;
	private ArrayList<ChatDto>  previousChatMessagesOfPartciularUser;
	@Override
	public ArrayList getPreviousChats(int loginUserId, int messengerUserId) throws Exception {
		try{
			
			String sql = "select u.user_id ,u.telephone,u.first_name,u.last_name,u.email,u.password,gender,u.dj,u.vs,u.journalist,u.anchor,u.photo_path,u.location,u.role,u.genre,u.bio,u.latitude,u.longitude,u.zipcode,u.nickname,u.profile_photo,u.age,u.birthday,u.status_message "+
					", (select count(*) from messagetrack as m  where status='unread' and m.message_to =  " + loginUserId +" and m.message_from = u.user_id  ) as unreadMessageCount " +
					" from user as u where u.user_id in (select distinct message_from as mFrom from messagetrack as c where  c.message_to =  " + loginUserId +
					" union select distinct message_to as mFrom from messagetrack as c where c.message_from = "+loginUserId+ ") ";
			SQLQuery query = sessionFactory
					.getCurrentSession().createSQLQuery(sql);
			query.addEntity(UserEntity.class);
			List<UserEntity> users = query.list();
			messagedUserArrayList = new ArrayList<UserDto>();
			for (UserEntity user : users) {
				UserDto userDto = new UserDto();
				BeanUtils.copyProperties(userDto, user);
				messagedUserArrayList.add(userDto);
			}
		}catch(Exception e){
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return messagedUserArrayList;
	}
	@Override
	public ArrayList previousChatMessages(int userId,int chatUserId) throws Exception{
		try{
			
			if(chatUserId > 0){
				query = sessionFactory.getCurrentSession().createQuery("update ChatEntity  as c set c.status = 'read' where c.messageTo = "+ userId + " and c.messageFrom = "+ chatUserId);
				query.executeUpdate();		
			}
			
			List<ChatEntity> chatMessagesList = sessionFactory
					.getCurrentSession()
					.createQuery(
							"FROM com.medialounge.reevo.entity.ChatEntity as c where  ((c. messageFrom = "+ userId + " )  and ( c.messageTo = "+ chatUserId + ")) OR  ((c. messageFrom = "+ chatUserId + " ) and ( c.messageTo = "+ userId + ")) order by created asc").list();
			previousChatMessagesOfPartciularUser = new ArrayList<ChatDto>();
			for(ChatEntity chatMessage : chatMessagesList){
				ChatDto chatDto = new ChatDto();
				BeanUtils.copyProperties(chatDto, chatMessage);
				previousChatMessagesOfPartciularUser.add(chatDto);				
			}
		}catch(Exception e){
			previousChatMessagesOfPartciularUser = null;
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return previousChatMessagesOfPartciularUser;
	}
	@Override
	public ArrayList sendChatMessage(int userId, int chatUserId, String chatMessageText) throws Exception {
		
		try {
			
			ChatEntity chatEntity = new ChatEntity();
			UserEntity messageFrom = new UserEntity();
			messageFrom.setUserId(userId);
			UserEntity messageTo = new UserEntity();
			messageTo.setUserId(chatUserId);
			chatEntity.setMessageFrom(messageFrom);
			chatEntity.setMessageTo(messageTo);
			chatEntity.setDescription(chatMessageText);
			chatEntity.setStatus("unread");
			sessionFactory.getCurrentSession().saveOrUpdate(chatEntity);
		} catch(Exception e) {
			logger.error("EXCEPTION "+e);
			throw new Exception("Exception");
		}
		return null;//previousChatMessages(userId,chatUserId);
	}
	@Override
	public String getTotalUnreadChatMessageCount(int userId) throws Exception {
		 String query = "SELECT count(*) as count FROM ChatEntity as c where c.status= 'unread' and messageTo =  " + userId;
		 Query q = null;
		 try{
			  q = sessionFactory
			.getCurrentSession().createQuery(query);
		 }catch(Exception e) {
			 logger.error("EXCEPTION "+e);
			 throw new Exception("Exception");
		 }
		return (Long)q.list().get(0)+"";
	}
	
}
	
