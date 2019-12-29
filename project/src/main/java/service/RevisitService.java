package service;

import java.util.List;

import entity.Revisit;
import utils.ReturnInfo;

public interface RevisitService extends basicService<Revisit>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<Revisit> getAll();
}
