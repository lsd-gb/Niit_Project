package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.User_roleDao;
import entity.User_role;
import service.User_roleService;
import utils.ReturnInfo;
@Service
public class User_roleServiceImpl implements User_roleService {
@Autowired
User_roleDao dao;
	public User_role getByid(Integer id) {
		return dao.getByid(id);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public void insert(User_role t) {
		dao.insert(t);
	}

	public void update(User_role t) {
		dao.update(t);
	}
	public ReturnInfo getWhere(String where, Integer page, Integer max) {
		boolean canpage=page!=null;
		ReturnInfo info = new ReturnInfo();
		info.setList(dao.getWhere(where,ReturnInfo.getLimit(page, max)));
		if(canpage)info.setCount(dao.selectCount(where));
		return info;
	}

	public List<User_role> getAll() {
		return dao.getAll();
	}

	public int selectNum() {
		// TODO Auto-generated method stub
		return dao.selectNum();
	}

	public List<String> getRoleByid(int id) {
		return dao.getRoleByid(id);
	}

}
