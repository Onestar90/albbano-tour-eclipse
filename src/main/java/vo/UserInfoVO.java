package vo;

import java.sql.Date;

public class UserInfoVO {
 
	private String id, pass, name, tel, email;
	private Date create_date, modify_date;
	private String email1,email2,ip;
	private String newPass;
	private String del_yn;
	
	public UserInfoVO(String id, String pass, String name, String tel, String email, Date create_date, Date modify_date,
			String email1, String email2, String ip, String newPass, String del_yn) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.create_date = create_date;
		this.modify_date = modify_date;
		this.email1 = email1;
		this.email2 = email2;
		this.ip = ip;
		this.newPass = newPass;
		this.del_yn = del_yn;
	}



	public String getDel_yn() {
		return del_yn;
	}



	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}



	public UserInfoVO() {
		super();
	}
	
	

	public String getNewPass() {
		return newPass;
	}



	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}



	public UserInfoVO(String id, String pass, String name, String tel, String email, Date create_date, Date modify_date,
			String email1, String email2, String ip, String newPass) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.create_date = create_date;
		this.modify_date = modify_date;
		this.email1 = email1;
		this.email2 = email2;
		this.ip = ip;
		this.newPass = newPass;
	}





	public UserInfoVO(String id, String pass, String name, String tel, String email, Date create_date, Date modify_date,
			String email1, String email2, String ip) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.create_date = create_date;
		this.modify_date = modify_date;
		this.email1 = email1;
		this.email2 = email2;
		this.ip = ip;
	}
	
	
	
	
	public String getEmail1() {
		return email1;
	}



	public void setEmail1(String email1) {
		this.email1 = email1;
	}


	public String getEmail2() {
		return email2;
	}



	public void setEmail2(String email2) {
		this.email2 = email2;
	}



	public String getIp() {
		return ip;
	}



	public void setIp(String ip) {
		this.ip = ip;
	}

	

	@Override
	public String toString() {
		return "UserInfoVO [id=" + id + ", pass=" + pass + ", name=" + name + ", tel=" + tel + ", email=" + email
				+ ", create_date=" + create_date + ", modify_date=" + modify_date + ", email1=" + email1 + ", email2="
				+ email2 + ", ip=" + ip + ", newPass=" + newPass + ", del_yn=" + del_yn + "]";
	}





	public UserInfoVO(String id, String pass, String name, String tel, String email, Date create_date,
			Date modify_date) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.create_date = create_date;
		this.modify_date = modify_date;
	}
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Date getModify_date() {
		return modify_date;
	}
	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	
	
}
