package org.j2cms.web.action;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.LinkedHashMap;
import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.j2cms.model.CheckState;
import org.j2cms.model.PageView;
import org.j2cms.model.QueryResult;
import org.j2cms.service.EntityService;
import org.j2cms.utils.Struts2Utils;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 提供CRUD操作的Action
 * 
 * @author GT
 * @since  2012
 */
public abstract class EntityAction<T> extends BaseAction implements ModelDriven<T>, Preparable {
	private static final long	serialVersionUID	= 7909985827753544081L;
  
	@Resource(name = "entityService")
	protected EntityService<T> entityService;
	
	// 实体对象
	protected T entity;
	// 实体类主键
	protected Integer id;
	// 实体类的名字
	protected String entityClassName = "";
	// 实体对象页表
	protected PageView<T> pageView = new PageView<T>(15,1);
	// 批量删除的id
	protected Integer[] ids={0};

	
	public T getEntity() {
		return entity;
	}

	public void setEntity(T entity) {
		this.entity = entity;
	}

    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	
	public String getEntityClassName() {
		return entityClassName;
	}

	public void setEntityClassName(String entityClassName) {
		this.entityClassName = entityClassName;
	}

	public PageView<T> getPageView() {
		return pageView;
	}

	public void setPageView(PageView<T> pageView) {
		this.pageView = pageView;
	}

	
	
	/**
	 * 根据泛型类型实例化对象
	 * 
	 * @return 泛型类型的对象
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public T instanceAnnotationObject() throws Exception {
		Class<?> cl = this.getClass();
		// 得到泛型类型参数数组就是<>里面的2个值
		Type[] types = ((ParameterizedType) cl.getGenericSuperclass()).getActualTypeArguments();
		try {
			return ((Class<T>) types[0]).newInstance();
		} catch (Exception e) {
			log.error("crudAction的泛型类型实例化失败! 错误信息: {}", e.getMessage());
			throw e;
		} 
	}
	
	/* 
	 * @see com.opensymphony.xwork2.Preparable#prepare()
	 */
	@SuppressWarnings("unchecked")
	public void prepare() throws Exception {
		// 利用反射新建enity对象
		this.entity = this.instanceAnnotationObject();
		this.entityClassName = this.entity.getClass().getSimpleName();
		entityService.setEntityClass((Class<T>) entity.getClass());
		for(Integer id:ids)
		{
			System.out.println(id);
		}
		if(id != null) {
			// 根据主键从数据库查找entity
			try {
				T dataEntity =entityService.find(this.id);
				if(dataEntity != null) {
					this.entity = dataEntity;
				} else {
					this.entity = this.instanceAnnotationObject();
				}				
			} catch(NumberFormatException e) {
				log.error("实体对象对象[{}]的id:{}转换数字失败!", this.entityClassName, id);
			} catch (Exception e) {
				log.error("读取实体对象[{}]失败! id: {}, 错误原因 : {}",new Object[]{
						this.entityClassName,
						id,
						e.getMessage()
				});
				
				throw e;
			}
		}
	}

	/* 
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public T getModel() {
		return entity;
	}
	
	
	/**
	 * 读取实体类对象
	 * 
	 
	 */
	public boolean doRead() {
		// prepare已经完成此功能 ， 使用getModel()获得实体类
		log.info("成功读取实体对象[{}]", this.entityClassName);
		return true;
	}
	
	/**
	 * 创建实体类数据
	 * 
	 
	 */
	@Action("save")
	public String save() {
		try {
			entityService.save(entity);
		} catch (Exception e) {
			log.error("创建实体对象[{}]失败! 错误原因  : {}", this.entityClassName, e.getMessage());
			return ERROR;
		}
		log.info("成功创建实体对象[{}]", this.entityClassName);
		return "toList";
	}
	
	/**
	 * 更新实体类数据
	 * 
	 
	 */
	@Action("update")
	public String update() {
		try {
			entityService.update(entity);
		} catch (Exception e) {
			log.error("更新实体对象[{}]失败! 错误原因  : {}", this.entityClassName, e.getMessage());
			return ERROR;
		}
		
		log.info("成功更新实体对象[{}]", this.entityClassName);
		return "toList";
	}
	
	/**
	 * 删除实体对象数据
	 * 
	 */
	@Action("remove")
	public String remove() {
		try {
			entityService.remove(entity);
		} catch (Exception e) {
			log.error("删除实体对象[{}]失败! 错误原因  : {}", this.entityClassName, e.getMessage());
			return ERROR;
		}
		log.info("成功删除实体对象[{}]", this.entityClassName);
		return "toList";
	}
	
	@Action("recycle")
	public String recycle (){
		try {
			if(ids[0]==0) ids[0]=id;
			entityService.setCheckState(ids, CheckState.recycle);
			return "toList";
		} catch (Exception e) {
			return ERROR;
		}
	}
	/**
	 * 批量删除
	 * 
	 */
	
	@Action("delete")
	public String delete() {
		try {
			if(ids[0]==0) ids[0]=id;
			log.info("批量删除的实体类[{}]的ids: {}", this.entityClassName,ids.toString());
			entityService.delete(ids);
		} catch(Exception e) {
			log.error("批量删除实体对象[{}]失败! 错误原因: {}", this.entityClassName, e.getMessage());
			
			return ERROR;
		}
		
		
		return "toList";
	}

	@Action("edit")
	public String edit() {
		try {	
			Struts2Utils.setAttribute("func", "修改");
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}

	@Action("add")
	public String add() {
		Struts2Utils.setAttribute("func", "发布");
		return SUCCESS;
	}
	
//	@Action("entity")
//	public String execute() throws Exception{
//		//显示单个object的信息,输入参数为主键id
//		return SUCCESS;
//	}
//	
	/**
	 * 获得实体类分页列表
	 * 
	 */
	@Action("list")
	public String list() {
		try {
			int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();
			LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
			QueryResult<T> qr ;
			orderby.put("id", "desc");
//			StringBuffer jpql = new StringBuffer("o.checkState=?1");
//			List<Object> params = new ArrayList<Object>();
//			params.add(CheckState.pass);			
//			qr=entityService.getScrollData(firstindex, pageView.getMaxresult(),jpql.toString(), params.toArray(), orderby);
			qr=entityService.getScrollData(firstindex, pageView.getMaxresult(), orderby);
			pageView.setQueryResult(qr);
			
		} catch (Exception e) {
			log.error("读取实体类[{}]列表失败! 错误原因 : {}", new Object[]{
					entity.getClass().getName(),
					e.getMessage()
			});
			
			return ERROR;
		}
		
		log.info("成功读取实体对象[{}]列表", this.entityClassName);
		return SUCCESS;
	}
	
	/**
	 * 获得实体类所有对象列表
	 * 
	 */
	@Action(value="listAll",results=@Result(name="list",location = "list.jsp"))
    public String listAll() {
		try{
			LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
			orderby.put("id", "desc");
			QueryResult<T> qr ;
			qr= entityService.getScrollData(-1,-1,orderby);
			pageView.setQueryResult(qr);
		} catch(Exception e){
			log.error("读取实体类[{}]列表失败! 错误原因: {}", this.entityClassName, e.getMessage());
			return ERROR;
		}
		return "list";
	}
	


	
}

