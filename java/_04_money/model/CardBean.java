package _04_money.model;

import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;

public class CardBean {

	String cardNo1;
	String expiryMonth;
	String cardCVV;
	String cardName;
	String tel;
	String email;
	String address;
	Integer money;
	
	
	public CardBean() {
		
	};

	public CardBean(String cardNo1, String expiryMonth, String cardCVV, String cardName, String tel, String email,
			String address, Integer money) {
		super();
		this.cardNo1 = cardNo1;
		this.expiryMonth = expiryMonth;
		this.cardCVV = cardCVV;
		this.cardName = cardName;
		this.tel = tel;
		this.email = email;
		this.address = address;
		this.money = money;
	}

	
	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getCardNo1() {
		return cardNo1;
	}


	public void setCardNo1(String cardNo1) {
		this.cardNo1 = cardNo1;
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



	public String getExpiryMonth() {
		return expiryMonth;
	}

	public void setExpiryMonth(String expiryMonth) {
		this.expiryMonth = expiryMonth;
	}

	
	
}
