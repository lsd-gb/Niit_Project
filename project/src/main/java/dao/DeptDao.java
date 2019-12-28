package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Dept;

public interface DeptDao {
	@Select("select count(*) from  Dept   ${where}")
	public int selectCount(@Param("where") String where);
	@Select("select count(*) from  Dept ")
	public int selectNum();
	@Select("select Dept.* from  Dept   ${where}  ${limit}")
	public  List<Dept> getWhere(@Param("where") String where,@Param("limit") String limit);

	@Select("select Dept.* from  Dept ")
	public  List<Dept> getAll();

	@Select("select Dept.* from Dept  where id=#{id}")
	public  Dept getByid(int id);

	@Delete("delete from Dept where id=#{id}")
	public int delete(int id);

	 @Insert("insert into Dept (name) values(#{name})")
	 public Integer insert(Dept t);

	 @Update("update Dept set name=#{name} where id=#{id}")
	 public Integer update(Dept t);
}
