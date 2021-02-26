package _01_register.model;

import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;



/**
 * @author ali82
 *
 */
@Entity
@Table(name="trainer")
public class TrainerBean_H extends MemberBean_H {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Column(columnDefinition = "INT Default 2")
	Integer type;
	String name;
	String phone;
	Date birthday;
	String email;
	String password;
	@Transient
	String passwordcheck;
	String id_number;
	String sex;
	Integer verification;
	Integer year;
	@ManyToOne
	@JoinColumn(name="city_id")
	City_H city;
	@ManyToOne
	@JoinColumn(name="area_id")
	Area_H area;
	String address;
	@ManyToOne
	@JoinColumn(name="gym_id")
	GymBean_H gym;
	@Transient
	Integer gympassword;
	Integer is_delete;
	String hash;
	String nickname;
	String bank_account;
	String course;
	String introduction;
	
	Blob image;
	String fileName;
	@Transient
	MultipartFile productImage;
	@Transient
    public boolean hasError = false;
	
	
	





	public TrainerBean_H(Integer id, Integer type, String name, String phone, Date birthday, String email, String password,
			String id_number, String sex, Integer verification, GymBean_H gym, Integer is_delete, String hash) {
		super();
		this.id = id;
		this.type = type;
		this.name = name;
		this.phone = phone;
		this.birthday = birthday;
		this.email = email;
		this.password = password;
		this.id_number = id_number;
		this.sex = sex;
		this.verification = verification;
		this.gym = gym;
		this.is_delete = is_delete;
		this.hash = hash;
	}




	public TrainerBean_H() {
		
	}


	

	public Integer getId() {
		return id;
	}




	public void setId(Integer id) {
		this.id = id;
	}




	public Integer getType() {
		return type;
	}




	public void setType(Integer type) {
		this.type = type;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public Date getBirthday() {
		return birthday;
	}




	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getId_number() {
		return id_number;
	}




	public void setId_number(String id_number) {
		this.id_number = id_number;
	}




	public String getSex() {
		return sex;
	}




	public void setSex(String sex) {
		this.sex = sex;
	}




	public Integer getVerification() {
		return verification;
	}




	public void setVerification(Integer verification) {
		this.verification = verification;
	}




	public Integer getYear() {
		return year;
	}




	public void setYear(Integer year) {
		this.year = year;
	}




	public City_H getCity() {
		return city;
	}




	public void setCity(City_H city) {
		this.city = city;
	}




	public Area_H getArea() {
		return area;
	}




	public void setArea(Area_H area) {
		this.area = area;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public GymBean_H getGym() {
		return gym;
	}




	public void setGym(GymBean_H gym) {
		this.gym = gym;
	}

	public Integer getIs_delete() {
		return is_delete;
	}




	public void setIs_delete(Integer is_delete) {
		this.is_delete = is_delete;
	}




	public String getPasswordcheck() {
		return passwordcheck;
	}




	public void setPasswordcheck(String passwordcheck) {
		this.passwordcheck = passwordcheck;
	}




	public String getHash() {
		return hash;
	}	




	public void setHash(String hash) {
		this.hash = hash;
	}




	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public String getBank_account() {
		return bank_account;
	}




	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}




	public String getCourse() {
		return course;
	}




	public void setCourse(String course) {
		this.course = course;
	}




	public String getIntroduction() {
		return introduction;
	}




	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}




	public Integer getGympassword() {
		return gympassword;
	}




	public void setGympassword(Integer gympassword) {
		this.gympassword = gympassword;
	}




	public Blob getImage() {
		return image;
	}




	public void setImage(Blob image) {
		this.image = image;
	}




	public String getFileName() {
		return fileName;
	}




	public void setFileName(String fileName) {
		this.fileName = fileName;
	}




	public MultipartFile getProductImage() {
		return productImage;
	}




	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}




	public boolean getHasError() {
		return hasError;
	}




	public void setHasError(boolean hasError) {
		this.hasError = hasError;
	}
	
	
	
	


}