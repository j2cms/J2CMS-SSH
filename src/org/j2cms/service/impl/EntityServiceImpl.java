package org.j2cms.service.impl;

import org.j2cms.service.EntityService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("entityService")
@Transactional
public class EntityServiceImpl<T> extends DaoSupport<T> implements EntityService<T>{

}
