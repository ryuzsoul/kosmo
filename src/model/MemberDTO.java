package model;

import java.sql.Date;
/*
DTO DataTransferObject
	데이터 저장을 위한 객체로 멤버변수, 생성자, 게터세터를 가지고 있는 클래스
	일반적인 자바 Bean 규약을 따른다
 */
public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private java.sql.Date regidate;
	
	public MemberDTO() {
	
	}
	public MemberDTO(String id, String pass, String name, Date regidate) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.regidate = regidate;
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
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	
	

}
