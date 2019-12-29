package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import entity.User;
import service.UserService;
import utils.ReturnInfo;
@Service
public class UserServiceImpl implements UserService{
@Autowired
UserDao dao;

	public User getByid(Integer id) {
		return dao.getByid(id);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public void insert(User t) {
		dao.insert(t);
	}

	public void update(User t) {
		dao.update(t);
	}

	public ReturnInfo getWhere(String where, Integer page, Integer max) {
		boolean canpage=page!=null;
		ReturnInfo info = new ReturnInfo();
		info.setList(dao.getWhere(where,ReturnInfo.getLimit(page, max)));
		if(canpage)info.setCount(dao.selectCount(where));
		return info;
	}

	public List<User> getAll() {
		return dao.getAll();
	}

	public User login(User u) {
		return dao.login(u);
	}

	public int selectNum() {
		return dao.selectNum();
	}

	public List<String> getPermissionByName(String login) {
		return dao.getPermissionByName(login);
	}

	public Integer getMaxid() {
		return dao.getMaxid();
	}

	public Integer getCurrid(String login) {
		return dao.getCurrid(login);
	}

	public List<Integer> getRoleids(int id) {
		return dao.getRoleids(id);
	}

	public List<String> getRoleByname(String login) {
		return dao.getRoleByname(login);
	}

}
