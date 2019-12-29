package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RevisitDao;
import entity.Revisit;
import service.RevisitService;
import utils.ReturnInfo;

@Service
public class RevisitServiceImpl implements RevisitService{
	@Autowired 
	RevisitDao dao;

	public Revisit getByid(Integer id) {
		
		return dao.getByid(id);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public void insert(Revisit t) {
		dao.insert(t);
	}

	public void update(Revisit t) {
		dao.update(t);
	}


	public List<Revisit> getAll() {
		return dao.getAll();
	}

	public ReturnInfo getWhere(String where, Integer page, Integer max) {
		boolean canpage=page!=null;
		ReturnInfo info = new ReturnInfo();
		info.setList(dao.getWhere(where,ReturnInfo.getLimit(page, max)));
		if(canpage)info.setCount(dao.selectCount(where));
		return info;
	}

	public int selectNum() {
		// TODO Auto-generated method stub
		return 0;
	}

}
