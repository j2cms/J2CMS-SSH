package org.j2cms.web.action.manage.user;

import java.util.ArrayList;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.j2cms.model.CheckState;
import org.j2cms.model.QueryResult;
import org.j2cms.model.group.Group;
import org.j2cms.model.user.User;
import org.j2cms.service.GroupService;
import org.j2cms.service.UserService;
import org.j2cms.utils.MD532;
import org.j2cms.utils.Struts2Utils;
import org.j2cms.web.action.EntityAction;

@Results({
	  @Result(name="add",location = "add.jsp"),
	  @Result(name="edit",location = "edit.jsp"),
	  @Result(name="toList",location = "toList.jsp"),
	  @Result(name="succ",type="freemarker",location="/WEB-INF/content/util/succ.ftl"),
	  @Result(name="error",type="freemarker",location="/WEB-INF/content/util/error.ftl"),
	  @Result(name="errorPage",type="freemarker",location="/WEB-INF/content/util/errorPage.ftl"),
	  @Result(name="urlRedirect",type="freemarker",location="/WEB-INF/content/util/urlRedirect.ftl")
})
@ExceptionMappings({
@ExceptionMapping(exception = "java.sql.SQLException", result = "error", params = {"message", "操作数据库失败！"})
})
public class UserAction extends EntityAction<User> {
	private static final long serialVersionUID = -6543398335118585789L;
	@Resource
	private UserService userService;
	@Resource
	private GroupService groupService;


	private User selector=new User();
	
	private List<Group> groups  = new ArrayList<Group>();
	
	private String sortType="id";//排序类型


	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	public User getSelector() {
		return selector;
	}
	public void setSelector(User selector) {
		this.selector = selector;
	}
	public List<Group> getGroups() {
		groups=groupService.getScrollData().getResultlist();
		return  groups;
	}
	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}
	private User setEntityToUser(User user)
	{
		user.setGroup(entity.getGroup());
		user.setCheckState(entity.getCheckState());
		user.setUsername(entity.getUsername());
		user.setRealName(entity.getRealName());
		user.setGender(entity.getGender());
		user.setBirthday(entity.getBirthday());
		user.setEmail(entity.getEmail());
		user.setTelephone(entity.getTelephone());
		user.setQQ(entity.getQQ());
		user.setAddress(entity.getAddress());
		user.setZipCode(entity.getZipCode());
		user.setInfo(entity.getInfo());
		user.setSysDate(new Date());
		if (entity.getPassword() != null&& !"".equals(entity.getPassword()))
			user.setPassword(new MD532().getMD5(entity.getPassword()));
		return user;
	}
	private boolean checkEntityForm()
	{
		if(entity.getUsername()==null||entity.getUsername().equals("")) 
		{
			Struts2Utils.setAttribute("message1", "用户名不能为空！");
			return false;
		}
		if(userService.checkUsername(entity.getUsername()))
			if(!(userService.findByUsername(entity.getUsername()).getId()).equals(entity.getId()))
			{		
				Struts2Utils.setAttribute("message1", "用户名已经被注册!");
				return false;
			}
		return true;
	}
	@Actions({
		@Action("update")
	})
	public String update(){
		try {
			if(!checkEntityForm()) return "edit";
			User user = setEntityToUser(userService.find(entity.getId()));
			this.userService.update(user);
			return "toList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}			
	}
	

	@Action(value="save")
	public String save(){
		try{			
			if(!checkEntityForm()) return "add";
			if(entity.getPassword()==null||entity.getPassword().equals(""))
			{
				Struts2Utils.setAttribute("message2", "密码不能为空!");
				return "add";
			}
			User user = setEntityToUser(new User());
			this.userService.save(user);
			return "toList";	
		}
		catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
	@Actions({
		@Action("list")
	})	
	public String list(){
		QueryResult<User> qr;
		StringBuffer jpql = new StringBuffer("");
		List<Object> params = new ArrayList<Object>();
		
		if(selector!=null&&selector.getId()!=null){
			jpql.append(" o.id=?").append((params.size()+1));
			params.add(selector.getId());
			qr=userService.getScrollData(0, 1,jpql.toString(), params.toArray());
		}
		else{
			int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();
		    LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
			orderby.put(sortType==null?"id":sortType, "desc");
			if(selector.getGroup()!=null&&selector.getGroup().getId()!=null&&selector.getGroup().getId()!=0){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.group=?").append((params.size()+1));
				params.add(new Group(selector.getGroup().getId()));
			}
			if(selector.getGender()!=null &&!"".equals(selector.getGender())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.gender=?").append((params.size()+1));
				params.add(selector.getGender());
			}
			if(selector.getCheckState()!=null && !"".equals(selector.getCheckState())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.checkState=?").append((params.size()+1));
				params.add(selector.getCheckState());
			}
			
			if(selector.getUsername()!=null && !"".equals(selector.getUsername())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.username like ?").append((params.size()+1));
				params.add("%"+ selector.getUsername()+ "%");
			}
			if(selector.getRealName()!=null && !"".equals(selector.getRealName())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.realName like ?").append((params.size()+1));
				params.add("%"+ selector.getRealName()+ "%");
			}
			if(selector.getBirthday()!=null && !"".equals(selector.getBirthday())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.birthday like ?").append((params.size()+1));
				params.add("%"+ selector.getBirthday()+ "%");
			}
			if(selector.getEmail()!=null && !"".equals(selector.getEmail())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.email like ?").append((params.size()+1));
				params.add("%"+ selector.getEmail()+ "%");
			}
			if(selector.getTelephone()!=null && !"".equals(selector.getTelephone())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.telephone like ?").append((params.size()+1));
				params.add("%"+ selector.getTelephone()+ "%");
			}
			if(selector.getQQ()!=null && !"".equals(selector.getQQ())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.QQ like ?").append((params.size()+1));
				params.add("%"+ selector.getQQ()+ "%");
			}
			if(selector.getAddress()!=null && !"".equals(selector.getAddress())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.address like ?").append((params.size()+1));
				params.add("%"+ selector.getAddress()+ "%");
			}
			if(selector.getZipCode()!=null && !"".equals(selector.getZipCode())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.zipCode like ?").append((params.size()+1));
				params.add("%"+ selector.getZipCode()+ "%");
			}
			qr=userService.getScrollData(firstindex, pageView.getMaxresult(),jpql.toString(), params.toArray(), orderby);
		}
		pageView.setQueryResult(qr);
		return SUCCESS;
	}
	
	@Action(value="/register",results={@Result(name="register",type="freemarker",location="template/register.html")})
	public String register(){
		return "register";
	}
	
	@Actions({
		@Action(value="/userSave",results={@Result(name="register",type="freemarker",location="template/register.html"),@Result(name="success",location="template/registered.html")}),
	})
	public String userSave()throws Exception{
		try{
			if(entity.getUsername()==null||entity.getUsername().equals("")) 
			{
				Struts2Utils.setAttribute("message1", "用户名不能为空！");
				return "register";
			}
			if(entity.getPassword()==null||entity.getPassword().equals(""))
			{
				Struts2Utils.setAttribute("message2", "密码不能为空!");
				return "register";
			}
			if(userService.checkUsername(entity.getUsername()))
			{
				Struts2Utils.setAttribute("message1", "用户名已经被注册!");
				return "register";
			}else
			{
				User user = new User();
				user.setUsername(this.entity.getUsername());
				user.setCheckState(CheckState.noCheck);//默认未审核
				user.setPassword(new MD532().getMD5(this.entity.getPassword()) );
				userService.save(user);
				return "success";			
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return "register";
		}
		
	}
	
	@Action(value="/login",results={@Result(name = "manage", location = "/manage",type="redirect"),
									@Result(name = "success",type="freemarker",location = "manage/login.ftl")})
	public String login(){
		if(Struts2Utils.getSession().getAttribute("user")!=null)
			return "manage";
		return SUCCESS;
	}
	
	@Actions({	
		@Action(value="/loginCheck",results={@Result(name = "manage", location = "/manage",type="redirect"),
											 @Result(name="failure",type="chain",location = "login")})
	})
	public String loginCheck(){
		String code= Struts2Utils.getParameter("code")==null?"":Struts2Utils.getParameter("code");
		String rand =(String) Struts2Utils.getSession().getAttribute("rand");
		if(entity.getUsername()==null||entity.getUsername().equals("")) 
		{
			Struts2Utils.setAttribute("message", "用户名不能为空！");
			return "failure";
		}
		if(entity.getPassword()==null||entity.getPassword().equals(""))
		{
			Struts2Utils.setAttribute("message", "密码不能为空!");
			return "failure";
		}
		if(code.equals(rand))
		{
			if(entity.getUsername()!=null && !"".equals(entity.getUsername().trim())
					&& entity.getPassword()!=null && !"".equals(entity.getPassword().trim())){
				if(userService.validate(entity.getUsername().trim(), entity.getPassword().trim())){
					Struts2Utils.getSession().setAttribute("user", userService.findByUsername(entity.getUsername().trim()));
					return "manage";
				}
				Struts2Utils.setAttribute("message", "用户名或密码有误!");
				return "failure";
			}		
		}
		else{
			Struts2Utils.setAttribute("message", "验证码有误!");
			return "failure";
		}
		return "failure";
	}
	
	@Actions({	
		@Action(value="/user/logout",results={@Result(name="login",location="/login",type="redirect")})
	})
	public String logout(){
		Struts2Utils.getSession().setAttribute("user", null);
		return "login";
	}

	

}
