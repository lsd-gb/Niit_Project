package service;

import java.util.List;

import entity.Customer;
import utils.ReturnInfo;

public interface CusService extends basicService<Customer>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<Customer> getAll();
}
