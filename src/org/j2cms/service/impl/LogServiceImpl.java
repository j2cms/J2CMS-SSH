package org.j2cms.service.impl;

import org.j2cms.model.log.Log;
import org.j2cms.service.LogService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class LogServiceImpl extends DaoSupport<Log> implements LogService {

}
