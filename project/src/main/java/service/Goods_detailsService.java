package service;

import java.util.List;

import entity.Goods_details;
import utils.ReturnInfo;

public interface Goods_detailsService extends basicService<Goods_details>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<Goods_details> getAll();
	public Goods_details getBynumber(String number);
}
