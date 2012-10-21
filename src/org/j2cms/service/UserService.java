package org.j2cms.service;

import org.j2cms.model.user.User;
import org.j2cms.service.base.DAO;

public interface UserService extends DAO<User> {
	/**
	 * 判断用户名及密码是否正确
	 * @param username 用户名
	 * @param password 密码
	 * @return
	 */
	public boolean validate(String username, String password);
	
	/*
	 * 根据用户名查找用户
	 * 
	 */
	public User findByUsername(String username);
	/*
	 * 检查用户名是否存在
	 * 
	 */
	public boolean checkUsername(String username);
	
}
