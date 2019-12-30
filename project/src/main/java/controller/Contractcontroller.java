package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Customer;
import entity.Goods;
import entity.Goods_details;
import entity.Revisit;
import entity.User;
import entity.Contract;
import service.CusService;
import service.GoodsService;
import service.Goods_detailsService;
import service.RevisitService;
import service.UserService;
import service.ContractService;
import utils.ReturnInfo;

@Controller
@RequestMapping("Contract")
public class Contractcontroller  {
	@Autowired
	ContractService service;
	@Autowired
	CusService cservice;
	@Autowired
	UserService uservice;
	@Autowired
	GoodsService gservice;
	@Autowired
	Goods_detailsService gdservice;
	@Autowired
	RevisitService revservice;
	@RequestMapping("index")
	public @ResponseBody ReturnInfo index(String txt, Integer page, Integer limit,Integer userid,Integer power,Integer deptid) {
		String where = "";
		if(txt==null) txt="";
		if(power==1) {
			where="where contract.name like '%"+txt+"%'";
		}else if (power==2) {
			where="where contract.name like '%"+txt+"%' and deptid="+deptid+"";
		}else if (power==3) {
			where="where contract.name like '%"+txt+"%' and contract.userid="+userid+"";
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
	@RequestMapping("goods")
	public @ResponseBody ReturnInfo goods(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where goods.name like '%" + txt + "%'";
		}
		return gservice.getWhere(where, page, limit);
	}


	@RequestMapping("delete")
	public @ResponseBody String delete(Integer id, ModelMap m, HttpServletRequest req) {
		service.delete(id);
		return "{\"status\":1}";
	}

	@RequestMapping("edit")
	public @ResponseBody Contract edit(Integer id) {
		return service.getByid(id);
	}
	@RequestMapping("getGoods_details")
	public @ResponseBody Goods_details getGoods_details(String contractnumber) {
		return gdservice.getBynumber(contractnumber);
	}
	@RequestMapping("goods_details")
	public @ResponseBody ReturnInfo goods_details(String txt, Integer page, Integer limit,String contractnumber) {
		String where = "";
		String con="'"+contractnumber+"'";
		where = "where contractnumber="+con+"";
		System.out.println(where);
		return gdservice.getWhere(where, page, limit);
	}
	@RequestMapping("revisit")
	public @ResponseBody ReturnInfo revisit(String txt, Integer page, Integer limit,Integer customerid) {
		String where = "";
		where = "where customerid="+customerid+"";
		return revservice.getWhere(where, page, limit);
	}
	@RequestMapping("getRevisit")
	public @ResponseBody Revisit getRevisit(Integer id) {
		return revservice.getByid(id);
	}
	@RequestMapping("goodsByid")
	public @ResponseBody Goods goodsByid(Integer id) {
		return gservice.getByid(id);
	}
	@RequestMapping("customer")
	public @ResponseBody Customer getCustomer(Integer id) {
		return cservice.getByid(id);
	}
	@RequestMapping("getCount")
	public @ResponseBody int getCount() {
		return service.selectNum();
	}
	@RequestMapping("insert")
	public @ResponseBody String insert(HttpServletRequest req) {
		Contract c=new Contract();
		c.setNumber(req.getParameter("number"));
		c.setName(req.getParameter("name"));
		c.setUserid(Integer.parseInt(req.getParameter("userid")));
		c.setApprovalname(req.getParameter("approvalname"));
		c.setCustomerid(Integer.parseInt(req.getParameter("customerid")));
		c.setAmount(Double.parseDouble(req.getParameter("amount")));
		c.setSigntime(req.getParameter("signtime"));
		c.setBegintime(req.getParameter("begintime"));
		c.setEndtime(req.getParameter("endtime"));
		c.setGoodsid(Integer.parseInt(req.getParameter("goodsid")));
		c.setGoodsname(req.getParameter("goodsname"));
		Goods_details gd=new Goods_details();
		gd.setGoodsid(Integer.parseInt(req.getParameter("goodsid")));
		gd.setContractnumber(req.getParameter("number"));
		gd.setGoodsname(req.getParameter("goodsname"));
		gd.setPrice(Double.parseDouble(req.getParameter("price")));
		gd.setDiscount(Double.parseDouble(req.getParameter("discount")));
		gd.setQuantity(Double.parseDouble(req.getParameter("quantity")));
		gd.setStatistics(Double.parseDouble(req.getParameter("statistics")));
		service.insert(c);
		gdservice.insert(gd);
		return "{\"status\":1}";
	}

	@RequestMapping("update")
	public @ResponseBody String update(HttpServletRequest req) {
		Contract c=new Contract();
		c.setId(Integer.parseInt(req.getParameter("id")));
		c.setNumber(req.getParameter("number"));
		c.setName(req.getParameter("name"));
		c.setUserid(Integer.parseInt(req.getParameter("userid")));
		c.setApprovalname(req.getParameter("approvalname"));
		c.setCustomerid(Integer.parseInt(req.getParameter("customerid")));
		c.setAmount(Double.parseDouble(req.getParameter("amount")));
		c.setSigntime(req.getParameter("signtime"));
		c.setBegintime(req.getParameter("begintime"));
		c.setEndtime(req.getParameter("endtime"));
		c.setGoodsid(Integer.parseInt(req.getParameter("goodsid")));
		c.setGoodsname(req.getParameter("goodsname"));
		Goods_details gd=new Goods_details();
		gd.setId(Integer.parseInt(req.getParameter("gd_id")));
		gd.setGoodsid(Integer.parseInt(req.getParameter("goodsid")));
		gd.setContractnumber(req.getParameter("number"));
		gd.setGoodsname(req.getParameter("goodsname"));
		gd.setPrice(Double.parseDouble(req.getParameter("price")));
		gd.setDiscount(Double.parseDouble(req.getParameter("discount")));
		gd.setQuantity(Double.parseDouble(req.getParameter("quantity")));
		gd.setStatistics(Double.parseDouble(req.getParameter("statistics")));
		service.update(c);
		gdservice.update(gd);
		return "{\"status\":1}";
	}
	@RequestMapping("getUserid")
	public @ResponseBody List<User> getUsername(){
		return uservice.getAll();
	}
	@RequestMapping("getApprovalname")
	public @ResponseBody List<User> getApproval(){
		return uservice.getAll();
	}
	@RequestMapping("getCustomerid")
	public @ResponseBody List<Customer> getCus(){
		return cservice.getAll();
	}
	@RequestMapping("getGoodsid")
	public @ResponseBody List<Goods> getGoods(){
		return gservice.getAll();
	}
	
	
	
}
