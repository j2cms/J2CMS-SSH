package org.j2cms.service;

import org.j2cms.model.config.Config;
import org.j2cms.service.base.DAO;

public interface ConfigService extends DAO<Config> {
	public Config findByUuid(String uuid);
}
