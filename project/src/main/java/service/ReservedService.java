package service;

import java.util.List;

import entity.Reserved;
import utils.ReturnInfo;

public interface ReservedService extends basicService<Reserved>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<Reserved> getAll();
}
