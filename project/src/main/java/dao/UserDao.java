package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.User;

@Repository
public interface UserDao {
	@Select("select count(1)  from  User LEFT JOIN dept on user.deptid=dept.id ${where}")
	public Integer selectCount(@Param("where") String where);
	@Select("select count(1)  from  User LEFT JOIN dept on user.deptid=dept.id")
	public Integer selectNum();
	@Select("SELECT user.*,dept.name deptname FROM user LEFT JOIN dept on dept.id=deptid ${where} order by user.id ${limit}")
	public  List<User> getWhere(@Param("where") String where,@Param("limit") String limit);
	@Select("select permission from user LEFT JOIN user_role on user.id=user_role.userid LEFT JOIN role__permission on user_role.roleid=role__permission.roleid LEFT JOIN permission on role__permission.permissionid=permission.id where user.login=#{login}")
	public List<String> getPermissionByName(@Param("login") String login);
	@Select("select role.key FROM user LEFT JOIN user_role on user.id=userid LEFT JOIN role on roleid=role.id where user.login=#{login}")
	public List<String> getRoleByname(@Param("login") String login);
	@Select("SELECT user.*,dept.name deptname FROM user LEFT JOIN dept on dept.id=deptid ")
	public  List<User> getAll();
	@Select("select*from user where login=#{login} and password=#{password}")
	public  User login(User u);
	@Select("SELECT user.*,dept.name deptname FROM user LEFT JOIN dept on dept.id=deptid  where user.id=#{id}")
	public  User getByid(int id);
	@Select("select max(id) from user")
	public Integer getMaxid();
	@Select("SELECT roleid from user LEFT JOIN user_role on user.id=userid LEFT JOIN role on roleid=role.id where user.id=#{id}")
	public List<Integer> getRoleids(int id);
	@Select("select id from user where login=#{login}")
	public Integer getCurrid(@Param("login") String login);
	@Delete("delete from User where id=#{id}")
	public int delete(int id);

	 @Insert("insert into User (name,login,password,status,sex,deptid,power) values(#{name},#{login},#{password},#{status},#{sex},#{deptid},#{power})")
	 public Integer insert(User t);

	 @Update("update User set name=#{name},login=#{login},password=#{password},status=#{status},sex=#{sex},deptid=#{deptid},power=#{power} where id=#{id}")
	 public Integer update(User t);
}
