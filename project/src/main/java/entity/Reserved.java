package entity;

import java.io.Serializable;

public class Reserved implements Serializable {
	private Integer id;
	private Integer customerid;
	private String customername;
	private String createdate;
	private Integer userid;
	private String username;
	private String reservedate;
	private String execusername;
	private Integer status;
	public static String[] statusStrings= {"正常","超时"};
	public String getStatusname() {
		return statusStrings[status];
	}
	private Integer execstatus;
	public static String[] execs= {"未执行","已完成"};
	public String getExecstatusname() {
		return execs[execstatus];
	}
	private String result;
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

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getReservedate() {
		return reservedate;
	}

	public void setReservedate(String reservedate) {
		this.reservedate = reservedate;
	}

	public String getExecusername() {
		return execusername;
	}

	public void setExecusername(String execusername) {
		this.execusername = execusername;
	}


	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getExecstatus() {
		return execstatus;
	}

	public void setExecstatus(Integer execstatus) {
		this.execstatus = execstatus;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
