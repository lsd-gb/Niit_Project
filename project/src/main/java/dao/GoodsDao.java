package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Goods;

public interface GoodsDao {
	@Select("select count(*) from  Goods   ${where}")
	public int selectCount(@Param("where") String where);
	@Select("select count(*) from  Goods ")
	public int selectNum();
	@Select("select Goods.* from  Goods   ${where}  ${limit}")
	public  List<Goods> getWhere(@Param("where") String where,@Param("limit") String limit);

	@Select("select Goods.* from  Goods ")
	public  List<Goods> getAll();

	@Select("select Goods.* from Goods  where id=#{id}")
	public  Goods getByid(int id);

	@Delete("delete from Goods where id=#{id}")
	public int delete(int id);

	 @Insert("insert into Goods (name,price) values(#{name},#{price})")
	 public Integer insert(Goods t);

	 @Update("update Goods set name=#{name},price=#{price} where id=#{id}")
	 public Integer update(Goods t);
}
