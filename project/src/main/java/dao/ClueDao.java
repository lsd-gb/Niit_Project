package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Customer;

@Repository
public interface ClueDao {
	@Select("select customer.*,user.name username,custype.name custypename from customer LEFT JOIN user ON customer.userid=user.id LEFT JOIN custype on customer.custypeid=custype.id ${where} order by customer.id ${limit}")
	public List<Customer> getWhere(@Param("where") String where,@Param("limit") String limit);
	@Select("select customer.*,user.name username,custype.name custypename from customer LEFT JOIN user ON customer.userid=user.id LEFT JOIN custype on customer.custypeid=custype.id  order by customer.id ")
	public List<Customer> getAll();
	@Select("select customer.*,user.name username,custype.name custypename from customer LEFT JOIN user ON customer.userid=user.id LEFT JOIN custype on customer.custypeid=custype.id where customer.id=#{id}  ")
	public Customer getByid(Integer id);
	@Select("select count(1)  from customer LEFT JOIN user ON customer.userid=user.id LEFT JOIN custype on customer.custypeid=custype.id ${where} order by customer.id")
	public int selectCount(@Param("where") String where);
	@Select("select count(1)  from customer LEFT JOIN user ON customer.userid=user.id LEFT JOIN custype on customer.custypeid=custype.id where type=0 order by customer.id")
	public int selectNum();

	@Delete("delete from Customer where id=#{id}")
	public int delete(int id);

	 @Insert("insert into Customer (name,userid,nexttime,status,custypeid,address,level,contacts,sex,phone,role,post,type,free) values(#{name},#{userid},#{nexttime},#{status},#{custypeid},#{address},#{level},#{contacts},#{sex},#{phone},#{role},#{post},#{type},#{free})")
	 public Integer insert(Customer t);

	 @Update("update Customer set name=#{name},userid=#{userid},nexttime=#{nexttime},status=#{status},custypeid=#{custypeid},address=#{address},level=#{level},contacts=#{contacts},sex=#{sex},phone=#{phone},role=#{role},post=#{post},type=#{type},free=#{free} where id=#{id}")
	 public Integer update(Customer t);
	
}
