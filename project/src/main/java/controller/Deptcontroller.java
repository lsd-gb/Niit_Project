package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Dept;
import service.DeptService;

import utils.ReturnInfo;

@Controller
@RequestMapping("Dept")
public class Deptcontroller  {
	@Autowired
	DeptService service;
	@RequestMapping("index")
	public @ResponseBody ReturnInfo index(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where clue.name like '%" + txt + "%'";
		}
		return service.getWhere(where, page, limit);
	}

	@RequestMapping("delete")
	public @ResponseBody String delete(Integer id, ModelMap m, HttpServletRequest req) {
		service.delete(id);
		return "{\"status\":1}";
	}

	@RequestMapping("edit")
	public @ResponseBody Dept edit(Integer id) {
		return service.getByid(id);
	}

	@RequestMapping("insert")
	public @ResponseBody String insert(Dept t) {
		service.insert(t);
		return "{\"status\":1}";
	}

	@RequestMapping("update")
	public @ResponseBody String update(Dept t) {
		service.update(t);
		return "{\"status\":1}";
	}

	

}
