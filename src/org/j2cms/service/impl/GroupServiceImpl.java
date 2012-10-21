package org.j2cms.service.impl;

import org.j2cms.model.group.Group;
import org.j2cms.service.GroupService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class GroupServiceImpl extends DaoSupport<Group> implements GroupService {

}
