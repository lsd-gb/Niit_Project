package entity;

import java.io.Serializable;

public class Revisit implements Serializable {
	private Integer id;
	private String time;
	private Integer customerid;
	private String customername;
	private Integer userid;
	private String username;
	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	private Integer linkstatus;
	public static String[] lstatus={"挂机","未接","有交流","深入交流"};
	public String getLstatusname() {
		return lstatus[linkstatus];
	}
	private Integer customerstatus;
	public static String[] cstatus={"排斥","推脱","后续","较好"};
	public String getCstatusname() {
		return cstatus[customerstatus];
	}
	private Integer purposestatus;
	public static String[] pstatus={"不感兴趣","普通","有意向","很感兴趣","成交"};
	public String getPstatusname() {
		return pstatus[purposestatus];
	}
	private Integer assessstatus;
	public static String[] astatus={"结束","无结果","有预约"};
	public String getAstatusname() {
		return astatus[assessstatus];
	}
	private String askinfo;
	private String followinfo;
	private Integer status;
	private String comments;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}

	public Integer getLinkstatus() {
		return linkstatus;
	}

	public void setLinkstatus(Integer linkstatus) {
		this.linkstatus = linkstatus;
	}

	public Integer getCustomerstatus() {
		return customerstatus;
	}

	public void setCustomerstatus(Integer customerstatus) {
		this.customerstatus = customerstatus;
	}

	public Integer getPurposestatus() {
		return purposestatus;
	}

	public void setPurposestatus(Integer purposestatus) {
		this.purposestatus = purposestatus;
	}

	public Integer getAssessstatus() {
		return assessstatus;
	}

	public void setAssessstatus(Integer assessstatus) {
		this.assessstatus = assessstatus;
	}


	public String getAskinfo() {
		return askinfo;
	}

	public void setAskinfo(String askinfo) {
		this.askinfo = askinfo;
	}

	public String getFollowinfo() {
		return followinfo;
	}

	public void setFollowinfo(String followinfo) {
		this.followinfo = followinfo;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
