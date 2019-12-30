package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import entity.Clue;
import entity.Customer;
import entity.Dept;
import entity.Role;
import entity.User;
import entity.User_role;
import service.ClueService;
import service.DeptService;
import service.RoleService;
import service.UserService;
import service.User_roleService;
import utils.ReturnInfo;

@Controller
@RequestMapping("User")
public class Usercontroller  {
	@Autowired
	UserService service;
	@Autowired
	RoleService rservice;
	@Autowired
	DeptService dservice;
	@Autowired
	User_roleService urservice;
	@RequestMapping("login")
	public String login(User u, String code, ModelMap m, HttpSession s) {
//		String num = s.getAttribute("number").toString();
//		if (!num.equalsIgnoreCase(code)) {
//			return "redirect:/login.html";
//		}
		try {
			SecurityUtils.getSubject().getSession().setTimeout(1000000);
			SecurityUtils.getSubject().login(new UsernamePasswordToken(u.getLogin(),u.getPassword()));
			
		}catch(AccountException e) {
			return "redirect:/login.html";
		}
		User curr=(User) SecurityUtils.getSubject().getSession().getAttribute("user");
		if(curr.getStatus()==0) {
			return "redirect:/index.jsp";
		}else {
			return "redirect:/login.html";
		}
	}

	@RequestMapping("outlogin")
	public String login(HttpSession s, HttpServletRequest req) {
		SecurityUtils.getSubject().logout();
		return "redirect:/login.html";
	}
	
	@RequestMapping("index")
	public @ResponseBody ReturnInfo index(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where user.name like '%" + txt + "%'";
		}
		return service.getWhere(where, page, limit);
	}
	@RequestMapping("user_role")
	public @ResponseBody ReturnInfo getUser_role(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where user.name like '%" + txt + "%'";
		}
		return urservice.getWhere(where, page, limit);
	}
	@RequestMapping("takeRole")
	public @ResponseBody ReturnInfo takeRole(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where name like '%" + txt + "%'";
		}
		return rservice.getWhere(where, page, limit);
	}

	@RequestMapping("delete")
	public @ResponseBody String delete(Integer id, ModelMap m, HttpServletRequest req) {
		service.delete(id);
		return "{\"status\":1}";
	}

	@RequestMapping("insert_role")
	public @ResponseBody String insert_role(User_role t) {
		urservice.insert(t);
		return "{\"status\":1}";
	}
	@RequestMapping("delete_role")
	public @ResponseBody String delete_role(Integer id, ModelMap m, HttpServletRequest req) {
		urservice.delete(id);
		return "{\"status\":1}";
	}
	@RequestMapping("stop")
	public @ResponseBody String stop(User t) {
		t.setStatus(1);
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("restart")
	public @ResponseBody String res(User t) {
		t.setStatus(0);
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping(value = "role",produces = "application/json;charset=utf-8")
	public @ResponseBody String getRole(Integer id){
		List<String> list=urservice.getRoleByid(id);
		String role="";
		for(int i=0;i<list.size();i++) {
			if(i!=list.size()-1) {
				role=role+list.get(i)+",";
			}else {
				role=role+list.get(i);
			}
		}
		
		return JSON.toJSONString(role);
	}
	@RequestMapping("edit")
	public @ResponseBody User edit(Integer id) {
		return service.getByid(id);
	}
	@RequestMapping("edit_role")
	public @ResponseBody User_role edit_role(Integer id) {
		return urservice.getByid(id);
	}

	@RequestMapping("insert")
	public @ResponseBody String insert(HttpServletRequest req) {
		User user=new User();
		user.setLogin(req.getParameter("login"));
		user.setDeptid(Integer.parseInt(req.getParameter("deptid")));
        user.setName(req.getParameter("name"));
        user.setSex(Integer.parseInt(req.getParameter("sex")));
        user.setPassword(req.getParameter("password"));
        user.setPower(Integer.parseInt(req.getParameter("power")));
        user.setStatus(Integer.parseInt(req.getParameter("status")));
        service.insert(user);
        int uid=service.getCurrid(req.getParameter("login"));
		
		String a[]=req.getParameter("roleids").split(",");
		for (int i = 0; i <a.length; i++) {
			String id=a[i];
			Integer rid=Integer.parseInt(id);
			User_role ur=new User_role();
			ur.setRoleid(rid);
			ur.setUserid(uid);
			urservice.insert(ur);
		}
		return "{\"status\":1}";
	}
	@RequestMapping("getRoleids")
	public @ResponseBody String getRoleids(Integer id) {
		List<Integer> list=service.getRoleids(id);
		String ids="";
		for(int i=0;i<list.size();i++) {
			if(i!=list.size()-1) {
				ids=ids+list.get(i)+",";
			}else {
				ids=ids+list.get(i);
			}
		}
		return JSON.toJSONString(ids);
	}

	@RequestMapping("update")
	public @ResponseBody String update(HttpServletRequest req) {
		User user=new User();
		user.setId(Integer.parseInt(req.getParameter("id")));
		user.setLogin(req.getParameter("login"));
		user.setDeptid(Integer.parseInt(req.getParameter("deptid")));
        user.setName(req.getParameter("name"));
        user.setSex(Integer.parseInt(req.getParameter("sex")));
        user.setPassword(req.getParameter("password"));
        user.setPower(Integer.parseInt(req.getParameter("power")));
        user.setStatus(Integer.parseInt(req.getParameter("status")));
        service.update(user);
		return "{\"status\":1}";
	}
	@RequestMapping("update_role")
	public @ResponseBody String update_role(User_role t) {
		urservice.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("getRoleid")
	public @ResponseBody List<Role> getRolename(){
		return rservice.getAll();
	}
	@RequestMapping("getDeptid")
	public @ResponseBody List<Dept> getDeptname(){
		return dservice.getAll();
	}
	@RequestMapping("getSexs")
	public @ResponseBody String[] getSexs() {
		return User.sexs;
	}
	@RequestMapping("getStatus")
	public @ResponseBody String[] getStatusname() {
		return User.statusStrings;
	}
//	@RequestMapping("getPower")
//	public @ResponseBody String[] getPowername() {
//		return User.powername;
//	}
}
