package service;

import java.util.List;

import entity.Contract;
import utils.ReturnInfo;

public interface ContractService extends basicService<Contract>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<Contract> getAll();	
	
}
