package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.GoodsDao;
import entity.Goods;
import service.GoodsService;
import utils.ReturnInfo;
@Service
public class GoodsServiceImpl implements GoodsService{
@Autowired
GoodsDao dao;
		public Goods getByid(Integer id) {
			return dao.getByid(id);
		}

		public void delete(Integer id) {
			dao.delete(id);
		}

		public void insert(Goods t) {
			dao.insert(t);
		}

		public void update(Goods t) {
			dao.update(t);
		}
		public ReturnInfo getWhere(String where, Integer page, Integer max) {
			boolean canpage=page!=null;
			ReturnInfo info = new ReturnInfo();
			info.setList(dao.getWhere(where,ReturnInfo.getLimit(page, max)));
			if(canpage)info.setCount(dao.selectCount(where));
			return info;
		}

		public List<Goods> getAll() {
			return dao.getAll();
		}

		public int selectNum() {
			// TODO Auto-generated method stub
			return dao.selectNum();
		}

}
