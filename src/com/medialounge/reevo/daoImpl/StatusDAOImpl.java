package com.medialounge.reevo.daoImpl;

import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medialounge.reevo.dao.StatusDAO;
import com.medialounge.reevo.dto.StatusDTO;
import com.medialounge.reevo.entity.StatusEntity;

@Repository("statusDAO")
public class StatusDAOImpl implements StatusDAO {

	@Autowired  
	private SessionFactory sessionFactory; 
	
	@Override
	public void saveStatus(StatusDTO statusDTO) {
		
		try {
			StatusEntity statusEntity = new StatusEntity();
			BeanUtils.copyProperties(statusEntity, statusDTO);
			sessionFactory.getCurrentSession().saveOrUpdate(statusEntity);
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	@Override
	public List<StatusDTO> getStatus(String userId) {
		
		/*List<StatusEntity> status = sessionFactory.getCurrentSession().createQuery("FROM com.medialounge.reevo.entity.StatusEntity order by created desc").list();
		List<ContactEntity> contact = sessionFactory.getCurrentSession().createQuery("FROM com.medialounge.reevo.entity.ContactEntity where (fromUserId = "+userId+"or toUserId ="+userId+") and status = 'active'").list();
		List statusList = new ArrayList<>();
		for (StatusEntity statusEntity : status) {
			for (ContactEntity contactEntity : contact) {
				if(contactEntity.getFromUserId() == statusEntity.getUserId() || contactEntity.getToUserId() == statusEntity.getUserId()){
					if (!(statusEntity.getUserId() == Integer.parseInt(userId))) {
						if(!(statusList.contains(statusEntity.getUserId()))){
							statusList.add(statusEntity.getUserId());
							List<UserEntity> user = sessionFactory.getCurrentSession().createQuery("FROM com.medialounge.reevo.entity.UserEntity where userId = "+statusEntity.getUserId()).list();
							for (UserEntity userEntity : user) {
								statusList.add(userEntity.getFirstName()+" "+userEntity.getLastName());
								statusList.add(userEntity.getContentPath());
							}
							statusList.add(statusEntity.getStatus());
						}
					}
				}
			}
		}
		return statusList;*/
		return null;
	}

}
