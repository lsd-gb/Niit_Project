package entity;

import java.io.Serializable;

public class Customer implements Serializable{

	private Integer id;
	private String name;
	private Integer userid;
	private String username;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	private String nexttime;
	private Integer status;
	private Integer custypeid;
	private String custypename;
	
	private String address;
	private String province;
	private String city;
	private String area;
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	private Integer level;
	private String contacts;
	private Integer sex;
	private String phone;
	private Integer role;
	private String post;
	private Integer type;
	private Integer free;
	public static String[] sexs= {"先生","女士"};
	public String getSexname() {
		return sexs[sex];
	}
	public static String[] statustStrings= {"无意向","有意向","感兴趣","可以合作","正在洽谈","完成"};
	public String getStatusname() {
		return statustStrings[status];
	}
	public static String[] roles= {"商务决策","技术决策","财务决策","意向人","管理者"};
	public String getRolename() {
		return roles[role];
	}
	public static String[] levels= {"一星客户","二星客户","三星客户","四星客户","五星客户"};
	public String getLevelname() {
		return levels[level];
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

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}



	public String getNexttime() {
		return nexttime;
	}
	public void setNexttime(String nexttime) {
		this.nexttime = nexttime;
	}
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String Contacts) {
		this.contacts = Contacts;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	public Integer getCustypeid() {
		return custypeid;
	}
	public void setCustypeid(Integer custypeid) {
		this.custypeid = custypeid;
	}
	public String getCustypename() {
		return custypename;
	}
	public void setCustypename(String custypename) {
		this.custypename = custypename;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getFree() {
		return free;
	}
	public void setFree(Integer free) {
		this.free = free;
	}

}

