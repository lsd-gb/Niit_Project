package service;

import java.util.List;

import entity.Role;
import utils.ReturnInfo;

public interface RoleService extends basicService<Role>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<Role> getAll();
}
