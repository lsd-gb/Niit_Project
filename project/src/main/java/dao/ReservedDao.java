package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Reserved;

public interface ReservedDao {
	@Select("select*FROM reserved  ${where}  ${limit}")
	public List<Reserved> getWhere(@Param("where") String where,@Param("limit") String limit);
	@Select("select*FROM reserved  ")
	public List<Reserved> getAll();
	@Select("select*FROM reserved  where reserved.id=#{id}  ")
	public Reserved getByid(Integer id);
	@Select("select count(1)  from  reserved  ${where}")
	public int selectCount(@Param("where") String where);
	@Delete("delete from Reserved where id=#{id}")
	public int delete(int id);

	 @Insert("insert into Reserved (customerid,customername,createdate,userid,username,reservedate,execusername,status,execstatus,result) values(#{customerid},#{customername},#{createdate},#{userid},#{username},#{reservedate},#{execusername},#{status},#{execstatus},#{result})")
	 public Integer insert(Reserved t);

	 @Update("update Reserved set customerid=#{customerid},customername=#{customername},createdate=#{createdate},userid=#{userid},username=#{username},reservedate=#{reservedate},execusername=#{execusername},status=#{status},execstatus=#{execstatus},result=#{result} where id=#{id}")
	 public Integer update(Reserved t);
}
