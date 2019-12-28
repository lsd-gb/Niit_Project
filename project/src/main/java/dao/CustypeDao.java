package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Custype;

public interface CustypeDao {
	@Select("select count(*) from  custype   ${where}")
	public int selectCount(@Param("where") String where);

	@Select("select custype.* from  custype   ${where}  ${limit}")
	public  List<Custype> getWhere(@Param("where") String where,@Param("limit") String limit);
	@Select("select Custype.* from  Custype ")
	public  List<Custype> getAll();

	@Select("select Custype.* from Custype  where id=#{id}")
	public  Custype getByid(int id);

	@Delete("delete from Custype where id=#{id}")
	public int delete(int id);

	 @Insert("insert into Custype (name) values(#{name})")
	 public Integer insert(Custype t);

	 @Update("update Custype set name=#{name} where id=#{id}")
	 public Integer update(Custype t);
}
