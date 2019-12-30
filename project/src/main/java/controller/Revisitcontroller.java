package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.org.apache.bcel.internal.generic.NEW;

import entity.Customer;
import entity.Revisit;
import service.CusService;
import service.RevisitService;
import service.UserService;
import utils.ReturnInfo;

@Controller
@RequestMapping("Revisit")
public class Revisitcontroller  {
	@Autowired
	RevisitService service;
	@Autowired
	CusService cservice;
	@Autowired
	UserService uservice;
	
	@RequestMapping("index")
	public @ResponseBody ReturnInfo index(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where customername like '%" + txt + "%'";
		}
		return service.getWhere(where, page, limit);
	}
	@RequestMapping("index1")
	public @ResponseBody ReturnInfo index1(String txt, Integer page, Integer limit,Integer customerid) {
		String where = "";
		if (txt != null) {
			where = "where customerid="+customerid+"";
		}else {
			where = "where customerid="+customerid+"";
		}
		return service.getWhere(where, page, limit);
	}
	@RequestMapping("user")
	public @ResponseBody ReturnInfo user(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where customer.name like '%" + txt + "%'";
		}
		return uservice.getWhere(where, page, limit);
	}
	@RequestMapping("getTomonth")
	public @ResponseBody ReturnInfo getTomonth(Integer userid,Integer page, Integer limit) throws ParseException {
		String where = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		where = "where revisit.userid="+userid+"";
		List<Revisit> list=service.getWhere(where, page, limit).getList();
		for(int i=0;i<list.size();i++) {
			Date date1=sdf.parse(list.get(i).getTime());
			Date date2=new Date();
			String date=sdf.format(date2);
			date2=sdf.parse(date);
            Calendar cal1 = Calendar.getInstance();
            cal1.setTime(date1);
            Calendar cal2 = Calendar.getInstance();
            cal2.setTime(date2);
            if(cal1.get(Calendar.MONTH)!=cal2.get(Calendar.MONTH)) {
            	list.remove(list.get(i));
            }
		}
		service.getWhere(where, limit, page).setList(list);
		return service.getWhere(where, page, limit);
	}

	@RequestMapping("delete")
	public @ResponseBody String delete(Integer id, ModelMap m, HttpServletRequest req) {
		service.delete(id);
		return "{\"status\":1}";
	}

	@RequestMapping("edit")
	public @ResponseBody Revisit edit(Integer id) {
		return service.getByid(id);
	}

	@RequestMapping("insert")
	public @ResponseBody String insert(Revisit t) {
		service.insert(t);
		return "{\"status\":1}";
	}

	@RequestMapping("update")
	public @ResponseBody String update(Revisit t) {
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("getCustomerid")
	public @ResponseBody List<Customer> getCusid(){
		return cservice.getAll();
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
	
}
