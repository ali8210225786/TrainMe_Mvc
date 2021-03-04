package _04_money.model;

public class CardBean {
 
	String name;
	String cardNo;
	String expiryMonth;
	String expiryYear;
	String cardCVV;
	String cardName;
	String tel;
	String email;
	String zip;
	String address;
	
	
	public CardBean() {
		
	};
	
	
	
	


	public CardBean(String name, String cardNo, String expiryMonth, String expiryYear, String cardCVV, String cardName,
			String tel, String email, String zip, String address) {
		super();
		this.name = name;
		this.cardNo = cardNo;
		this.expiryMonth = expiryMonth;
		this.expiryYear = expiryYear;
		this.cardCVV = cardCVV;
		this.cardName = cardName;
		this.tel = tel;
		this.email = email;
		this.zip = zip;
		this.address = address;
	}






	public String getZip() {
		return zip;
	}



	public void setZip(String zip) {
		this.zip = zip;
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
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
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
