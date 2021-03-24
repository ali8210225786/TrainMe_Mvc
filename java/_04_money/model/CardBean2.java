package _04_money.model;

import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;

public class CardBean2 {
 
	String name;
	String cardNo1;
	String cardNo2;
	String cardNo3;
	String cardNo4;
	String expiryMonth;
	String expiryYear;
	String cardCVV;
	String cardName;
	String tel;
	String email;
	String address;
	City_H city;
	Area_H area;
	Integer money;
	
	
	public CardBean2() {
		
	};

	public CardBean2(String name, String cardNo1, String cardNo2, String cardNo3, String cardNo4, String expiryMonth,
			String expiryYear, String cardCVV, String cardName, String tel, String email, String address, City_H city,
			Area_H area) {
		super();
		this.name = name;
		this.cardNo1 = cardNo1;
		this.cardNo2 = cardNo2;
		this.cardNo3 = cardNo3;
		this.cardNo4 = cardNo4;
		this.expiryMonth = expiryMonth;
		this.expiryYear = expiryYear;
		this.cardCVV = cardCVV;
		this.cardName = cardName;
		this.tel = tel;
		this.email = email;
		this.address = address;
		this.city = city;
		this.area = area;
	}


	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
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


	public String getCardNo1() {
		return cardNo1;
	}


	public void setCardNo1(String cardNo1) {
		this.cardNo1 = cardNo1;
	}


	public String getCardNo2() {
		return cardNo2;
	}


	public void setCardNo2(String cardNo2) {
		this.cardNo2 = cardNo2;
	}


	public String getCardNo3() {
		return cardNo3;
	}


	public void setCardNo3(String cardNo3) {
		this.cardNo3 = cardNo3;
	}


	public String getCardNo4() {
		return cardNo4;
	}


	public void setCardNo4(String cardNo4) {
		this.cardNo4 = cardNo4;
	}

	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getCardName() {
		return cardName;
	}



	public void setCardName(String cardName) {
		this.cardName = cardName;
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



	public String getCardCVV() {
		return cardCVV;
	}



	public void setCardCVV(String cardCVV) {
		this.cardCVV = cardCVV;
	}



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getExpiryMonth() {
		return expiryMonth;
	}

	public void setExpiryMonth(String expiryMonth) {
		this.expiryMonth = expiryMonth;
	}

	public String getExpiryYear() {
		return expiryYear;
	}

	public void setExpiryYear(String expiryYear) {
		this.expiryYear = expiryYear;
	}
	
	
	
}
