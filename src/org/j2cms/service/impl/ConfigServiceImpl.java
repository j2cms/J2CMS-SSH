package org.j2cms.service.impl;


import javax.persistence.Query;

import org.j2cms.model.config.Config;
import org.j2cms.service.ConfigService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ConfigServiceImpl extends DaoSupport<Config> implements ConfigService {
	public Config findByUuid(String uuid){
		Query query =em.createQuery("select o from Config o where o.uuid=?1").setParameter(1, uuid);
		if(query.getResultList().size()==0 ){
            return null;
        }else{
            return (Config) query.getSingleResult();
        }
	}

}
