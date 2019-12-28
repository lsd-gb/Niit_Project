package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.User_role;

public interface User_roleDao {
	@Select("select count(*)   FROM user_role LEFT JOIN role on roleid=role.id LEFT JOIN user on userid=user.id   ${where}")
	public int selectCount(@Param("where") String where);
	@Select("select count(*)   FROM user_role LEFT JOIN role on roleid=role.id LEFT JOIN user on userid=user.id")
	public int selectNum();
	@Select("SELECT user_role.*,role.name rolename,user.name username FROM user_role LEFT JOIN role on roleid=role.id LEFT JOIN user on userid=user.id   ${where}  ${limit}")
	public  List<User_role> getWhere(@Param("where") String where,@Param("limit") String limit);

	@Select("SELECT user_role.*,role.name rolename,user.name username FROM user_role LEFT JOIN role on roleid=role.id LEFT JOIN user on userid=user.id ")
	public  List<User_role> getAll();

	@Select("SELECT user_role.*,role.name rolename,user.name username FROM user_role LEFT JOIN role on roleid=role.id LEFT JOIN user on userid=user.id  where user_role.id=#{id}")
	public  User_role getByid(int id);
	@Select("SELECT role.name rolename FROM user LEFT JOIN user_role on userid=user.id LEFT JOIN role on roleid=role.id  where user.id=#{id}")
	public  List<String> getRoleByid(int id);
	
	@Delete("delete from User_role where id=#{id}")
	public int delete(int id);

	 @Insert("insert into User_role (userid,roleid) values(#{userid},#{roleid})")
	 public Integer insert(User_role t);

	 @Update("update User_role set userid=#{userid},roleid=#{roleid} where id=#{id}")
	 public Integer update(User_role t);
}
