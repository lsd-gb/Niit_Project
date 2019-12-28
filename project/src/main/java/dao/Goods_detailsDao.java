package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Goods_details;

public interface Goods_detailsDao {
	@Select("select Goods_details.* from  Goods_details   ${where}  ${limit}")
	public  List<Goods_details> getWhere(@Param("where") String where,@Param("limit") String limit);

	@Select("select Goods_details.* from  Goods_details ")
	public  List<Goods_details> getAll();

	@Select("select Goods_details.* from Goods_details  where id=#{id}")
	public  Goods_details getByid(int id);
	@Select("select Goods_details.* from Goods_details  where contractnumber=#{number}")
	public  Goods_details getBynumber(@Param("number") String number);
	
	@Select("select Count(1) from Goods_details  ${where}")
	public  int selectCount(@Param("where") String where);
	

	@Delete("delete from Goods_details where id=#{id}")
	public int delete(int id);

	 @Insert("insert into Goods_details (goodsid,goodsname,price,contractnumber,discount,quantity,statistics) values(#{goodsid},#{goodsname},#{price},#{contractnumber},#{discount},#{quantity},#{statistics})")
	 public Integer insert(Goods_details t);

	 @Update("update Goods_details set goodsid=#{goodsid},goodsname=#{goodsname},price=#{price},contractnumber=#{contractnumber},discount=#{discount},quantity=#{quantity},statistics=#{statistics} where id=#{id}")
	 public Integer update(Goods_details t);
}
