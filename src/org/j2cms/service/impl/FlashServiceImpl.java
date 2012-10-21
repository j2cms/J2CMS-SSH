package org.j2cms.service.impl;

import org.j2cms.model.config.Flash;
import org.j2cms.service.FlashService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class FlashServiceImpl extends DaoSupport<Flash> implements FlashService {

}
