package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CustypeDao;
import entity.Custype;
import service.CustypeService;
import utils.ReturnInfo;


@Service
public class CustypeServiceImpl implements CustypeService{
@Autowired
CustypeDao dao;
	public Custype getByid(Integer id) {
		return dao.getByid(id);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public void insert(Custype t) {
		dao.insert(t);
	}

	public void update(Custype t) {
		dao.update(t);
	}
	public ReturnInfo getWhere(String where, Integer page, Integer max) {
		boolean canpage=page!=null;
		ReturnInfo info = new ReturnInfo();
		info.setList(dao.getWhere(where,ReturnInfo.getLimit(page, max)));
		if(canpage)info.setCount(dao.selectCount(where));
		return info;
	}

	public List<Custype> getAll() {
		return dao.getAll();
	}

	public int selectNum() {
		// TODO Auto-generated method stub
		return 0;
	}
}
