package study.bin;

import java.util.Date;

public class RequestBean {
private String name;
private String address;
private String email;
private Date registerDate;

public void setName(String name){
	this.name = name;
}
public String getName(){
	return name;
}
public void setAddress(String address){
	this.address = address;
}
public String getAddress(){
	return address;
}
public void setEmail(String email){
	this.email = email;
}
public String getEmail(){
	return email;
}
public void setRegisterDate(Date registerDate){
	this.registerDate = registerDate;
}
public Date getRegisterDate() {
	return registerDate;
}
}