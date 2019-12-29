package entity;

import java.io.Serializable;

public class User implements Serializable{
	private Integer id;
	private String name;
	private String login;
	private String password;
	private Integer status;
	private Integer deptid;
	private String deptname;
	private Integer power;
	private Integer sex;
	public static String[] statusStrings={"正常","禁用"};
	public static String[] sexs= {"先生","女士"};
	public String getStatusname() {
		return statusStrings[status];
	}
	public String getSexname() {
		return sexs[sex];
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getDeptid() {
		return deptid;
	}
	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public Integer getPower() {
		return power;
	}
	public void setPower(Integer power) {
		this.power = power;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public static String[] getStatusStrings() {
		return statusStrings;
	}
	public static void setStatusStrings(String[] statusStrings) {
		User.statusStrings = statusStrings;
	}
	public static String[] getSexs() {
		return sexs;
	}
	public static void setSexs(String[] sexs) {
		User.sexs = sexs;
	}
	
	
}
