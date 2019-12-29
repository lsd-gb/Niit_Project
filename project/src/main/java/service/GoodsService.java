package service;

import java.util.List;

import entity.Goods;
import utils.ReturnInfo;

public interface GoodsService extends basicService<Goods>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<Goods> getAll();
}
