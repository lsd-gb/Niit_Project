package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Role;
import service.RoleService;

import utils.ReturnInfo;

@Controller
@RequestMapping("Role")
public class Rolecontroller  {
	@Autowired
	RoleService service;
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
	public @ResponseBody Role edit(Integer id) {
		return service.getByid(id);
	}

	@RequestMapping("insert")
	public @ResponseBody String insert(Role t) {
		service.insert(t);
		return "{\"status\":1}";
	}

	@RequestMapping("update")
	public @ResponseBody String update(Role t) {
		service.update(t);
		return "{\"status\":1}";
	}

	

}
