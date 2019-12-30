package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Reserved;
import entity.Customer;
import entity.User;
import service.ReservedService;
import service.CusService;
import service.UserService;
import utils.ReturnInfo;

@Controller
@RequestMapping("Reserved")
public class Reservedcontroller  {
	@Autowired
	ReservedService service;
	@Autowired
	UserService uservice;
	@Autowired
	CusService cservice;
	@RequestMapping("index1")
	public @ResponseBody ReturnInfo index1(String txt, Integer page, Integer limit,Integer customerid) {
		String where = "";
		where="where customerid="+customerid+"";
		return service.getWhere(where, page, limit);
	}
	@RequestMapping("index")
	public @ResponseBody ReturnInfo index(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where customername like '%" + txt + "%'";
		}else {
			where = "where customername like '%%'";
		}
		return service.getWhere(where, page, limit);
	}
	@RequestMapping("getToday")
	public @ResponseBody ReturnInfo getToday(String username,Integer page, Integer limit) {
		String where = "";
		Date date = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 String currdate=sdf.format(date);
		 currdate="'"+currdate+"'";
		 username="'"+username+"'";
		where = "where reservedate="+currdate+" and execusername="+username+"";
		return service.getWhere(where, page, limit);
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
		return cservice.getWhere(where, page, limit);
	}

	@RequestMapping("delete")
	public @ResponseBody String delete(Integer id, ModelMap m, HttpServletRequest req) {
		service.delete(id);
		return "{\"status\":1}";
	}


	@RequestMapping("edit")
	public @ResponseBody Reserved edit(Integer id) {
		Reserved c=service.getByid(id);
		SecurityUtils.getSubject().getSession().setAttribute("c",c);
		return service.getByid(id);
	}

	@RequestMapping("insert")
	public @ResponseBody String insert(Reserved t) {
		service.insert(t);
		return "{\"status\":1}";
	}

	@RequestMapping("update")
	public @ResponseBody String update(Reserved t) {
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("getStatus")
	public @ResponseBody String[] getStatus() {
		return Reserved.statusStrings;
	}
	@RequestMapping("getExec")
	public @ResponseBody String[] geExecstatus() {
		return Reserved.execs;
	}
	
	

}
