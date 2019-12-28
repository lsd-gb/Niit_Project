package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import entity.Role;


public interface RoleDao {
	@Select("select count(*) from  Role   ${where}")
	public int selectCount(@Param("where") String where);

	@Select("select Role.* from  Role   ${where}  ${limit}")
	public  List<Role> getWhere(@Param("where") String where,@Param("limit") String limit);

	@Select("select Role.* from  Role ")
	public  List<Role> getAll();


	@Select("select Role.* from Role  where id=#{id}")
	public  Role getByid(int id);

	@Delete("delete from Role where id=#{id}")
	public int delete(int id);

	 @Insert("insert into Role (name) values(#{name})")
	 public Integer insert(Role t);

	 @Update("update Role set name=#{name} where id=#{id}")
	 public Integer update(Role t);
}
