package service;

import java.util.List;

import entity.User_role;
import utils.ReturnInfo;

public interface User_roleService extends basicService<User_role>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<User_role> getAll();
	public  List<String> getRoleByid(int id);
}
