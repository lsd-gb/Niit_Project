package service;

import java.util.List;

import entity.Custype;
import utils.ReturnInfo;

public interface CustypeService extends basicService<Custype>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);

	public  List<Custype> getAll();
}
