package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CustomerDao;
import entity.Customer;
import service.ClueService;
import utils.ReturnInfo;
@Service
public class ClueServiceImpl implements ClueService {
	@Autowired
	CustomerDao dao;
		public Customer getByid(Integer id) {
			return dao.getByid(id);
		}

		public void delete(Integer id) {
			dao.delete(id);
		}

		public void insert(Customer t) {
			dao.insert(t);
		}

		public void update(Customer t) {
			dao.update(t);
		}
		public ReturnInfo getWhere(String where, Integer page, Integer max) {
			boolean canpage=page!=null;
			ReturnInfo info = new ReturnInfo();
			info.setList(dao.getWhere(where,ReturnInfo.getLimit(page, max)));
			if(canpage)info.setCount(dao.selectCount(where));
			return info;
		}

		public List<Customer> getAll() {
			return dao.getAll();
		}


		public int selectNum() {
			// TODO Auto-generated method stub
			return dao.selectNum();
		}

}
