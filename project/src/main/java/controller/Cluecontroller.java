package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import entity.Customer;
import entity.Custype;
import entity.User;
import service.ClueService;
import service.CustypeService;
import service.UserService;
import utils.ReturnInfo;

@Controller
@RequestMapping("Clue")
public class Cluecontroller  {
	@Autowired
	ClueService service;
	@Autowired
	UserService uservice;
	@Autowired
	CustypeService cservice;
	@RequestMapping("index")
	public @ResponseBody ReturnInfo index(String txt, Integer page, Integer limit,Integer userid) {
		String where = "";
		if (txt != null) {
			where = "where   userid="+userid+" and customer.name like '%" + txt + "%' and customer.type=0 and customer.free=1";
		}else {
			where = "where userid="+userid+" and customer.name like '%%' and customer.type=0 and customer.free=1";
		}
		return service.getWhere(where, page, limit);
	}
	@RequestMapping("index1")
	public @ResponseBody ReturnInfo index1(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where customer.name like '%" + txt + "%' and customer.type=0 and customer.free=0";
		}else {
			where = "where customer.name like '%%' and customer.type=0 and customer.free=0";
		}
		System.out.println(where+" clue");
		return service.getWhere(where, page, limit);
	}

	@RequestMapping("delete")
	public @ResponseBody String delete(Integer id, ModelMap m, HttpServletRequest req) {
		service.delete(id);
		return "{\"status\":1}";
	}
	@RequestMapping(value="manyupdate")
	public @ResponseBody Object manyupdate(@RequestBody  List<Customer> list, Map m) {
		Integer code=0;
		try{
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setFree(0);
				list.get(i).setUserid(0);
				list.get(i).setNexttime("未指定");
				service.update(list.get(i));
				code=1;
			}
		}catch (Exception e) {
			e.printStackTrace();
			code=-1;
		}
		return JSON.toJSONString(code);
	}
	@RequestMapping(value="manychange")
	public @ResponseBody Object manychange(@RequestBody  List<Customer> list, Map m) {
		Integer code=0;
		try{
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setFree(1);
				list.get(i).setType(1);
				list.get(i).setNexttime("未指定");
				service.update(list.get(i));
				code=1;
			}
		}catch (Exception e) {
			e.printStackTrace();
			code=-1;
		}
		return JSON.toJSONString(code);
	}
	@RequestMapping(value="manytake")
	public @ResponseBody Object manytake(@RequestBody  List<Customer> list, Map m) {
		Integer code=0;
		try{
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setFree(1);
				list.get(i).setNexttime("未指定");
				service.update(list.get(i));
				code=1;
			}
		}catch (Exception e) {
			e.printStackTrace();
			code=-1;
		}
		return JSON.toJSONString(code);
	}
	@RequestMapping(value="manydelete")
	public @ResponseBody Object manydelete(@RequestBody String ids, Map m) {
		Integer code=0;
		String a[]=ids.split(",");
		try{
			for (int i = 0; i <a.length; i++) {
				String id=a[i];
				Integer nid=Integer.parseInt(id);
				service.delete(nid);
				code=1;
			}
		}catch (Exception e) {
			e.printStackTrace();
			code=-1;
		}
		return JSON.toJSONString(code);
	}
	@RequestMapping("deleteFree")
	public @ResponseBody String deleteF(Customer t) {
		t.setFree(0);
		t.setUserid(0);
		service.update(t);;
		return "{\"status\":1}";
	}

	@RequestMapping("edit")
	public @ResponseBody Customer edit(Integer id) {
		Customer c=service.getByid(id);
		SecurityUtils.getSubject().getSession().setAttribute("c",c);
		return service.getByid(id);
	}

	@RequestMapping("insert")
	public @ResponseBody String insert(Customer t) {
		service.insert(t);
		return "{\"status\":1}";
	}

	@RequestMapping("update")
	public @ResponseBody String update(Customer t) {
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("updateFree")
	public @ResponseBody String updateFree(Customer t) {
		t.setFree(1);
		User u=(User) SecurityUtils.getSubject().getSession().getAttribute("user");
		t.setUserid(u.getId());
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("updateType")
	public @ResponseBody String updateType(Customer t) {
		t.setType(1);
		t.setNexttime("未指定");
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("getSexs")
	public @ResponseBody String[] getSexs() {
		return Customer.sexs;
	}
	@RequestMapping("getCustypeid")
	public @ResponseBody List<Custype> getTrades() {
		return cservice.getAll();
	}
	@RequestMapping("getLevels")
	public @ResponseBody String[] getLevels() {
		return Customer.levels;
	}
	@RequestMapping("getStatus")
	public @ResponseBody String[] getStatus() {
		return Customer.statustStrings;
	}
	@RequestMapping("getRoles")
	public @ResponseBody String[] getRoles() {
		return Customer.roles;
	}
	@RequestMapping("getUserid")
	public @ResponseBody List<User> getUsername() {
		return uservice.getAll();
	}
	

}
