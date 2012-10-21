package org.j2cms.service.base;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.j2cms.model.CheckState;
import org.j2cms.model.QueryResult;
import org.j2cms.utils.GenericsUtils;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



@SuppressWarnings("unchecked")
@Transactional
public abstract class DaoSupport<T> implements DAO<T>{
	protected Class<T> entityClass = GenericsUtils.getSuperClassGenricType(this.getClass());
	@PersistenceContext protected EntityManager em;//注入实体事物实行，允许在子类继承
	
	public void setEntityClass(Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	public void clear(){
		em.clear();
	}

	public void remove(T entity){
		em.remove(entity);
	}
	public void delete(Serializable ... entityids) {
		for(Object id : entityids){
			em.remove(em.getReference(this.entityClass, id));
		}
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)//查询不需要开事务
	public T find(Serializable entityId) {
		if(entityId==null) throw new RuntimeException(this.entityClass.getName()+ ":传入的实体id不能为空");
		return (T) em.find(this.entityClass, entityId);
	}

	public void save(Object entity) {
		em.persist(entity);
	}
	public void update(Object entity) {
		em.merge(entity);
	}
	//获得某列的记录数
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public long getCount() {
		return (Long)em.createQuery("select count("+ getCountField(this.entityClass) +") from "+ getEntityName(this.entityClass)+ " o").getSingleResult();
	}
	
	
	/**
	 * 设置对象状态
	 * @param ids 产品id数组
	 * @param checkState 对象状态
	 * @Date 2011-5-11 
	 */
	public void setCheckState(Integer[] ids, CheckState checkState) {
		if(ids!=null && ids.length>0){
			StringBuffer jpql = new StringBuffer();
			for(int i=0;i<ids.length;i++){
				jpql.append('?').append((i+2)).append(',');
			}
			jpql.deleteCharAt(jpql.length()-1);
			String entityname = getEntityName(this.entityClass);
			Query query = em.createQuery("update "+entityname+" o set o.checkState=?1 where o.id in("+ jpql.toString()+ ")");
			query.setParameter(1, checkState);
			for(int i=0;i<ids.length;i++){
				query.setParameter(i+2, ids[i]);
			}
			query.executeUpdate();
		}
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData(int firstindex, int maxresult, LinkedHashMap<String, String> orderby) {
		return getScrollData(firstindex,maxresult,null,null,orderby);
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams) {
		return getScrollData(firstindex,maxresult,wherejpql,queryParams,null);
	}
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql) {
		return getScrollData(firstindex,maxresult,wherejpql,null,null);
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData(int firstindex, int maxresult) {
		return getScrollData(firstindex,maxresult,null,null,null);
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData() {
		return getScrollData(-1, -1);
	}
	
	//LinkedHashMap<String, String> orderby  实体属性,asc/desc 排序的顺序按我们输入 的顺序
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)//只读，不需要开事务
	public QueryResult<T> getScrollData(int firstindex, int maxresult
			, String wherejpql, Object[] queryParams,LinkedHashMap<String, String> orderby) {
		QueryResult<T> qr = new QueryResult<T>();
		String entityname = getEntityName(this.entityClass);
		Query query = em.createQuery("select o from "+ entityname+ " o "+(wherejpql==null || "".equals(wherejpql.trim())? "": "where "+ wherejpql)+ buildOrderby(orderby));
		setQueryParams(query, queryParams);
		if(firstindex!=-1 && maxresult!=-1) query.setFirstResult(firstindex).setMaxResults(maxresult);
		qr.setResultlist(query.getResultList());
		query = em.createQuery("select count("+ getCountField(this.entityClass)+ ") from "+ entityname+ " o "+(wherejpql==null || "".equals(wherejpql.trim())? "": "where "+ wherejpql));
		setQueryParams(query, queryParams);
		qr.setTotalrecord((Long)query.getSingleResult());
		return qr;
	}
	
	protected static void setQueryParams(Query query, Object[] queryParams){
		if(queryParams!=null && queryParams.length>0){
			for(int i=0; i<queryParams.length; i++){
				query.setParameter(i+1, queryParams[i]);
			}
		}
	}
	/**
	 * 组装order by语句
	 * @param orderby
	 * @return
	 */
	protected static String buildOrderby(LinkedHashMap<String, String> orderby){
		StringBuffer orderbyql = new StringBuffer("");
		if(orderby!=null && orderby.size()>0){
			orderbyql.append(" order by ");
			for(String key : orderby.keySet()){
				orderbyql.append("o.").append(key).append(" ").append(orderby.get(key)).append(",");
			}
			orderbyql.deleteCharAt(orderbyql.length()-1);//删除最后一个,
		}
		return orderbyql.toString();
	}
	/**
	 * 获取实体的名称
	 * @param <E>
	 * @param clazz 实体类
	 * @return
	 */
	protected static <E> String getEntityName(Class<E> clazz){
		String entityname = clazz.getSimpleName();//简单名称
		Entity entity = clazz.getAnnotation(Entity.class);//是否标注 Entity
		if(entity.name()!=null && !"".equals(entity.name())){
			entityname = entity.name();
		}
		return entityname;
	}
	
	protected static <E> String getCountField(Class<E> clazz){
		String out = "o";
		try {
			PropertyDescriptor[] propertyDescriptors = Introspector.getBeanInfo(clazz).getPropertyDescriptors();
			for(PropertyDescriptor propertydesc : propertyDescriptors){
				Method method = propertydesc.getReadMethod();
				if(method!=null && method.isAnnotationPresent(EmbeddedId.class)){					
					PropertyDescriptor[] ps = Introspector.getBeanInfo(propertydesc.getPropertyType()).getPropertyDescriptors();
					out = "o."+ propertydesc.getName()+ "." + (!ps[1].getName().equals("class")? ps[1].getName(): ps[0].getName());
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return out;
	}
}
