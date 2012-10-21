package org.j2cms.service.impl;

import org.j2cms.model.channel.Channel;
import org.j2cms.service.ChannelService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class ChannelServiceImpl extends DaoSupport<Channel> implements
		ChannelService {
}
