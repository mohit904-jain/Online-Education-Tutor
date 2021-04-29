package com.mvc.bean;

public class RegisterBean {
	 private String phonenumber;
	 private String email;
	 private String userName;
	 private String password;
	 private String parentemail;
	 private String teacheremail;
	 public String getUserName() {
	 return userName;
	 }
	 public void setUserName(String userName) {
	 this.userName = userName;
	 }
	 public String getPassword() {
	 return password;
	 }
	 public void setPassword(String password) {
	 this.password = password;
	 }
	 public void setPhoneNumber(String phonenumber ) {
	 this.phonenumber = phonenumber;
	 }
	 public String getPhoneNumber() {
	 return phonenumber;
	 }
	 public void setEmail(String email) {
	 this.email = email;
	 }
	 public String getEmail() {
	 return email;
	 }
	 public String getParentemail() {
		 return parentemail;
	 }
	 public String getTeacheremail() {
		 return teacheremail;
	 }
	 public void setParentemail(String parentemail) {
		 this.parentemail=parentemail;
	 }
	 public void setTeacheremail(String teacheremail) {
		 this.teacheremail= teacheremail;
	 }
}
