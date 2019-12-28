package entity;

import java.io.Serializable;

public class Goods_details implements Serializable {
	private Integer id;
	private Integer goodsid;
	private String goodsname;
	private double price;
	private String contractnumber;
	private double discount;
	private double quantity;
	private double statistics;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getContractnumber() {
		return contractnumber;
	}
	public void setContractnumber(String contractnumber) {
		this.contractnumber = contractnumber;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public double getStatistics() {
		return statistics;
	}
	public void setStatistics(double statistics) {
		this.statistics = statistics;
	}
	
}
