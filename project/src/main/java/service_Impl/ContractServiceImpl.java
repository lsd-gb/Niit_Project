package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ContractDao;
import entity.Contract;
import service.ContractService;
import utils.ReturnInfo;

@Service
public class ContractServiceImpl implements ContractService{
	@Autowired 
	ContractDao dao;

	public Contract getByid(Integer id) {
		
		return dao.getByid(id);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public void insert(Contract t) {
		dao.insert(t);
	}

	public void update(Contract t) {
		dao.update(t);
	}


	public List<Contract> getAll() {
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
		return dao.selectNum();
	}
}
