package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Permission;
import entity.User;
import utils.ReturnInfo;

public interface UserService extends basicService<User>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<User> getAll();
	public User login(User u);
	public int selectNum();
	public List<String> getPermissionByName(String login);
	public Integer getMaxid();
	public Integer getCurrid(String login);
	public List<Integer> getRoleids(int id);
	public List<String> getRoleByname(String login);
}
