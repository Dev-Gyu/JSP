package chap08.member;

import java.util.Date;

public class MemberInfo{

	private String id;
	private String password;
	private String name;
	private String address;
	private Date registerDate;
	private String email;

public void setId(String id){
	this.id = id;
	}

public String getId(){
	return id;
	}
public void setPassword(String password){
	this.password = password;
	}
public String getPassword(){
	return password;
	}
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
public void setResisterDate(Date registerDate){
	this.registerDate = registerDate;
	}
public Date getResisterDate(){
	return registerDate;
	}
public void setEmail(String email){
	this.email = email;
	}
public String getEmail(){
	return email;
	}
}