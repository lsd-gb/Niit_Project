package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Contract;

@Repository
public interface ContractDao {
	@Select("select `contract`.*,user.name username,customer.name customername from `contract` LEFT JOIN user on `contract`.userid=user.id  LEFT JOIN customer on `contract`.customerid=customer.id LEFT JOIN dept on user.deptid=dept.id ${where} order by contract.id ${limit}")
	public List<Contract> getWhere(@Param("where") String where,@Param("limit") String limit);
	@Select("select `contract`.*,user.name username,customer.name customername from `contract` LEFT JOIN user on `contract`.userid=user.id  LEFT JOIN customer on `contract`.customerid=customer.id LEFT JOIN dept on user.deptid=dept.id  order by contract.id ")
	public List<Contract> getAll();
	@Select("select `contract`.*,user.name username,customer.name customername from `contract` LEFT JOIN user on `contract`.userid=user.id  LEFT JOIN customer on `contract`.customerid=customer.id LEFT JOIN dept on user.deptid=dept.id  where contract.id=#{id}  ")
	public Contract getByid(Integer id);
	@Select("select Count(1)  from `contract` LEFT JOIN user on `contract`.userid=user.id  LEFT JOIN customer on `contract`.customerid=customer.id LEFT JOIN dept on user.deptid=dept.id  ${where} order by contract.id")
	public int selectCount(@Param("where") String where);
	@Select("select Count(1)  from `contract` LEFT JOIN user on `contract`.userid=user.id  LEFT JOIN customer on `contract`.customerid=customer.id LEFT JOIN dept on user.deptid=dept.id   order by contract.id")
	public int selectNum();

	@Delete("delete from Contract where id=#{id}")
	public int delete(int id);

	 @Insert("insert into Contract (number,name,userid,approvalname,customerid,amount,signtime,begintime,endtime,goodsid,goodsname) values(#{number},#{name},#{userid},#{approvalname},#{customerid},#{amount},#{signtime},#{begintime},#{endtime},#{goodsid},#{goodsname})")
	 public Integer insert(Contract t);

	 @Update("update Contract set number=#{number},name=#{name},userid=#{userid},approvalname=#{approvalname},customerid=#{customerid},amount=#{amount},signtime=#{signtime},begintime=#{begintime},endtime=#{endtime},goodsid=#{goodsid},goodsname=#{goodsname} where id=#{id}")
	 public Integer update(Contract t);
}
