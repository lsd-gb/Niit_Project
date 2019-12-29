package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReservedDao;
import entity.Reserved;
import service.ReservedService;
import utils.ReturnInfo;

@Service
public class ReservedServiceImpl implements ReservedService {
	@Autowired
	ReservedDao dao;
		public Reserved getByid(Integer id) {
			return dao.getByid(id);
		}

		public void delete(Integer id) {
			dao.delete(id);
		}

		public void insert(Reserved t) {
			dao.insert(t);
		}

		public void update(Reserved t) {
			dao.update(t);
		}
		public ReturnInfo getWhere(String where, Integer page, Integer max) {
			boolean canpage=page!=null;
			ReturnInfo info = new ReturnInfo();
			info.setList(dao.getWhere(where,ReturnInfo.getLimit(page, max)));
			if(canpage)info.setCount(dao.selectCount(where));
			return info;
		}

		public List<Reserved> getAll() {
			return dao.getAll();
		}


		public int selectNum() {
			// TODO Auto-generated method stub
			return 0;
		}

}
