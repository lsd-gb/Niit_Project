package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Goods_detailsDao;
import entity.Goods_details;
import service.Goods_detailsService;
import utils.ReturnInfo;
@Service
public class Goods_detailsServiceImpl implements Goods_detailsService{
@Autowired
Goods_detailsDao dao;
	public Goods_details getByid(Integer id) {
		return dao.getByid(id);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public void insert(Goods_details t) {
		dao.insert(t);
	}

	public void update(Goods_details t) {
		dao.update(t);
	}
	public ReturnInfo getWhere(String where, Integer page, Integer max) {
		boolean canpage=page!=null;
		ReturnInfo info = new ReturnInfo();
		info.setList(dao.getWhere(where,ReturnInfo.getLimit(page, max)));
		if(canpage)info.setCount(dao.selectCount(where));
		return info;
	}

	public List<Goods_details> getAll() {
		return dao.getAll();
	}

	public int selectNum() {
		// TODO Auto-generated method stub
		return 0;
	}

	public Goods_details getBynumber(String number) {
		// TODO Auto-generated method stub
		return dao.getBynumber(number);
	}
}
