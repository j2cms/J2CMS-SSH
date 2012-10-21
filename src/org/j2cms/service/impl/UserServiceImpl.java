package org.j2cms.service.impl;

import javax.persistence.Query;

import org.j2cms.model.user.User;
import org.j2cms.service.UserService;
import org.j2cms.service.base.DaoSupport;
import org.j2cms.utils.MD532;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class UserServiceImpl extends DaoSupport<User> implements UserService {
	public boolean validate(String username, String password){
		long count = (Long)em.createQuery("select count(o) from User o where o.username=?1 and o.password=?2")
		.setParameter(1, username).setParameter(2, new MD532().getMD5(password)).getSingleResult();
		return count>0;
	}
	public User findByUsername(String username){
		Query query =em.createQuery("select o from User o where o.username=?1").setParameter(1, username);
		if(query.getResultList().size()==0 ){
            return null;
        }else{
            return (User) query.getSingleResult();
        }

	}
	public boolean checkUsername(String username){
		Query query =em.createQuery("select o from User o where o.username=?1").setParameter(1, username);
		if(query.getResultList().size()==0 ){
            return false;
        }else{
            return true;
        }
	}

}
