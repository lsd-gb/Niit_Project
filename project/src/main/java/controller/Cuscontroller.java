package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.sun.org.apache.xpath.internal.operations.And;

import entity.Customer;
import entity.Custype;
import entity.Reserved;
import entity.Revisit;
import entity.User;
import service.CusService;
import service.CustypeService;
import service.ReservedService;
import service.RevisitService;
import service.UserService;
import service_Impl.CusServiceImpl;
import utils.ReturnInfo;
import utils.ReturnJson;

@Controller
@RequestMapping("Cus")
public class Cuscontroller  {
	@Autowired
	CusService service;
	@Autowired
	UserService uservice;
	@Autowired
	CustypeService ctservice;
	@Autowired
	RevisitService revservice;
	@Autowired
	ReservedService reservice;
	@RequestMapping("index")
	public @ResponseBody ReturnInfo index(String txt, Integer page, Integer limit,Integer userid,Integer power,Integer deptid) {
		String where = "";
		if(txt==null) txt="";
		if(power==1) {
			where="where  customer.name like '%" + txt + "%' and customer.type=1 and customer.free=1";
		}else if (power==2) {
			where="where  customer.name like '%" + txt + "%' and customer.type=1 and deptid="+deptid+"";
		}else if(power==3) {
			where = "where  userid="+userid+" and customer.name like '%" + txt + "%' and customer.type=1 and customer.free=1 ";
		}
		return service.getWhere(where, page, limit);
	}
	@RequestMapping("index1")
	public @ResponseBody ReturnInfo index1(String txt, Integer page, Integer limit) {
		String where = "";
		if(txt==null) txt="";
		where = "where   customer.name like '%" + txt + "%' and customer.type=1 and customer.free=0";
		return service.getWhere(where, page, limit);
	}
	@RequestMapping("revisit")
	public @ResponseBody ReturnInfo revisit(String txt, Integer page, Integer limit,Integer customerid) {
		String where = "";
		if (txt != null) {
			where = "where customerid="+customerid+"";
		}else {
			where = "where customerid="+customerid+"";
		}
		return revservice.getWhere(where, page, limit);
	}
	@RequestMapping("getRevisitByid")
	public @ResponseBody Revisit getRevisit(Integer id) {
		return revservice.getByid(id);
	}
	@RequestMapping("getReserved")
	public @ResponseBody Reserved getReserved(Integer id) {
		return reservice.getByid(id);
	}
	@RequestMapping("reserved")
	public @ResponseBody ReturnInfo reserved(String txt, Integer page, Integer limit,Integer customerid) {
		String where = "";
		if (txt != null) {
			where = "where customerid="+customerid+"";
		}else {
			where = "where customerid="+customerid+"";
		}
		return reservice.getWhere(where, page, limit);
	}

	@RequestMapping("delete")
	public @ResponseBody String delete(Integer id, ModelMap m, HttpServletRequest req) {
		service.delete(id);
		return "{\"status\":1}";
	}
	@RequestMapping("Revdelete")
	public @ResponseBody String Revdelete(Integer id) {
		revservice.delete(id);
		return "{\"status\":1}";
	}
	@RequestMapping("Resdelete")
	public @ResponseBody String Resdelete(Integer id) {
		reservice.delete(id);
		return "{\"status\":1}";
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
	@RequestMapping("user")
	public @ResponseBody ReturnInfo user(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where user.name like '%" + txt + "%'";
		}else {
			where = "where user.name like '%%'";
		}
		System.out.println(where+" clue");
		return uservice.getWhere(where, page, limit);
	}
	@RequestMapping("customer")
	public @ResponseBody ReturnInfo customer(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where customer.name like '%" + txt + "%'";
		}else {
			where = "where customer.name like '%%'";
		}
		System.out.println(where+" clue");
		return service.getWhere(where, page, limit);
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
	@RequestMapping("deleteFree")
	public @ResponseBody String deleteF(Customer t) {
		t.setFree(0);
		t.setUserid(0);
		t.setNexttime("未指定");
		service.update(t);
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
	@RequestMapping("insert_revisit")
	public @ResponseBody String insert_revisit(Revisit t) {
		revservice.insert(t);
		return "{\"status\":1}";
	}
	@RequestMapping("insert_reserved")
	public @ResponseBody String insert_reserved(Reserved t) {
		reservice.insert(t);
		return "{\"status\":1}";
	}
	@RequestMapping("updateFree")
	public @ResponseBody String updateFree(Customer t) {
		t.setFree(1);
		t.setNexttime("未指定");
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("update")
	public @ResponseBody String update(Customer t) {
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("getSexs")
	public @ResponseBody String[] getSexs() {
		return Customer.sexs;
	}
	@RequestMapping("getCustypeid")
	public @ResponseBody List<Custype> getTrades() {
		return ctservice.getAll();
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
	@RequestMapping("getCustomerid")
	public @ResponseBody List<Customer> getCusid(){
		return service.getAll();
	}
	@RequestMapping("getLstatus")
	public @ResponseBody String[] getLstatus() {
		return Revisit.lstatus;
	}
	
	@RequestMapping("getCstatus")
	public @ResponseBody String[] getCstatus() {
		return Revisit.cstatus;
	}
	@RequestMapping("getPstatus")
	public @ResponseBody String[] getPstatus() {
		return Revisit.pstatus;
	}
	@RequestMapping("getAstatus")
	public @ResponseBody String[] getAstatus() {
		return Revisit.astatus;
	}
	@RequestMapping("getExec")
	public @ResponseBody String[] geExecstatus() {
		return Reserved.execs;
	}
}
