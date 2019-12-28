package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Revisit;

public interface RevisitDao {
	@Select("SELECT revisit.*,customer.name customername from revisit LEFT JOIN customer on customerid=customer.id ${where} order by revisit.id ${limit}")
	public List<Revisit> getWhere(@Param("where") String where,@Param("limit") String limit);
	@Select("SELECT revisit.*,customer.name customername from revisit LEFT JOIN customer on customerid=customer.id   ")
	public List<Revisit> getAll();
	@Select("SELECT revisit.*,customer.name customername from revisit LEFT JOIN customer on customerid=customer.id where revisit.id=#{id}  ")
	public Revisit getByid(Integer id);
	@Select("select count(1)  from revisit LEFT JOIN customer on customerid=customer.id ${where}")
	public int selectCount(@Param("where") String where);
	
	@Delete("delete from Revisit where id=#{id}")
	public int delete(int id);

	 @Insert("insert into Revisit (time,customerid,userid,username,linkstatus,customerstatus,purposestatus,assessstatus,askinfo,followinfo,comments) values(#{time},#{customerid},#{userid},#{username},#{linkstatus},#{customerstatus},#{purposestatus},#{assessstatus},#{askinfo},#{followinfo},#{comments})")
	 public Integer insert(Revisit t);

	 @Update("update Revisit set time=#{time},customerid=#{customerid},userid=#{userid},username=#{username},linkstatus=#{linkstatus},customerstatus=#{customerstatus},purposestatus=#{purposestatus},assessstatus=#{assessstatus},askinfo=#{askinfo},followinfo=#{followinfo},comments=#{comments} where id=#{id}")
	 public Integer update(Revisit t);
}
