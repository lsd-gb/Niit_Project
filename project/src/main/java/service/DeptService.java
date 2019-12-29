package service;

import java.util.List;

import entity.Dept;
import utils.ReturnInfo;

public interface DeptService extends basicService<Dept>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<Dept> getAll();
}
