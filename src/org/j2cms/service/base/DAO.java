package org.j2cms.service.base;

import java.io.Serializable;
import java.util.LinkedHashMap;

import org.j2cms.model.CheckState;
import org.j2cms.model.QueryResult;


public interface DAO<T> {
	
	public void setEntityClass(Class<T> entityClass);
	
	
	/**
	 * 获取记录总数
	 * @param entityClass 实体类
	 * @return
	 */
	public long getCount();
	/**
	 * 清除一级缓存的数据
	 */
	public void clear();
	/**
	 * 保存实体
	 * @param entity 实体id
	 */
	public void save(Object entity);
	/**
	 * 更新实体
	 * @param entity 实体id
	 */
	public void update(Object entity);
	/**
	 * 删除单个实体
	 * @param T 实体类
	 * @param entity 实体
	 */
	public void remove(T entity);
	/**
	 * 删除实体
	 * @param entityClass 实体类
	 * @param entityids 实体id数组
	 */
	public void delete(Serializable ... entityids);
	/**
	 * 获取实体
	 * @param <T>
	 * @param entityClass 实体类
	 * @param entityId 实体id
	 * @return
	 */
	public T find(Serializable entityId);
	/**
	 * 获取分页数据
	 * @param <T>
	 * @param entityClass 实体类
	 * @param firstindex 开始索引
	 * @param maxresult 需要获取的记录数
	 * @return
	 */
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams,LinkedHashMap<String, String> orderby);
	
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams);
	
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql);
	
	public QueryResult<T> getScrollData(int firstindex, int maxresult, LinkedHashMap<String, String> orderby);
	
	public QueryResult<T> getScrollData(int firstindex, int maxresult);
	
	public QueryResult<T> getScrollData();
	/**
	 * 设置对象状态
	 * @param ids 产品id数组
	 * @param checkState 对象状态
	 * @Date 2011-5-11 
	 */
	public void setCheckState(Integer[] ids, CheckState checkState);
	
}
