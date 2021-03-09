package _01_register.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="gym")
public class GymBean_H {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String name;
	String address;
	String phone;
	Integer verification; 
	@Column(columnDefinition="text")
	String introduction;
	
	

	
	public GymBean_H(Integer id, String name, String address, String phone, Integer verification, String introduction) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.verification = verification;
		this.introduction = introduction;
	}


	public GymBean_H() {
		
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getVerification() {
		return verification;
	}

	public void setVerification(Integer verification) {
		this.verification = verification;
	}


	public String getIntroduction() {
		return introduction;
	}


	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	
	
	
}
