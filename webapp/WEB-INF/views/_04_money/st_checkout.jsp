<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="st_point.css">
<title>st_checkout</title>
<style>
.error {
	color: rgb(235, 57, 57);
	font-size: 10px;
}

table, td {
	border: #8B8B8B 1px solid;
}
</style>
</head>
<body>
	<table>

		<tr>
			<th>購買項目</th>
			<th>金額</th>
		</tr>
		<tr>
			<td><span id="feedback"></span></td>
			<td></td>
		</tr>
	</table>

<%-- 		action="<c:url value='/studentMoney/checkout' />" --%>
<!-- 		action="/studentMoney/checkout"  -->
	<form:form method="POST"
		modelAttribute="CardBean" enctype='multipart/form-data'>
		<div>信用卡付款</div>
		<div>
			<label>姓名</label><br>
			<form:input path='name' placeholder="請輸入您的姓名" required="required" />
		</div>

		<div>
			<form:errors path="name" cssClass="error" />
		</div>

		<div>
			<label>信用卡卡號</label><br>
			<form:input path='cardNo' required="required" maxlength="4" size="4"
				type="text" />
			<form:input path='cardNo' required="required" maxlength="4" size="4"
				type="text" />
			<form:input path='cardNo' required="required" maxlength="4" size="4"
				type="text" />
			<form:input path='cardNo' required="required" maxlength="4" size="4"
				type="text" />
		</div>

		<div>
			<form:errors path="name" cssClass="error" />
		</div>

		<div>
			<label>有效期限</label><br>
		</div>
		<div>
			<form:select path='expiryMonth'>
				<option selected="selected" value="">--</option>
				<option value="01">01月</option>
				<option value="02">02月</option>
				<option value="03">03月</option>
				<option value="04">04月</option>
				<option value="05">05月</option>
				<option value="06">06月</option>
				<option value="07">07月</option>
				<option value="08">08月</option>
				<option value="09">09月</option>
				<option value="10">10月</option>
				<option value="11">11月</option>
				<option value="12">12月</option>
			</form:select>

			<form:select path='expiryYear'>
				<option selected="selected" value="">--</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				<option value="2023">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
				<option value="2027">2027</option>
				<option value="2028">2028</option>
				<option value="2029">2029</option>
				<option value="2030">2030</option>
				<option value="2031">2031</option>
				<option value="2032">2032</option>
				<option value="2033">2033</option>
				<option value="2034">2034</option>
				<option value="2035">2035</option>
				<option value="2036">2036</option>
				<option value="2037">2037</option>
				<option value="2038">2038</option>
				<option value="2039">2039</option>
				<option value="2040">2040</option>
			</form:select>
		</div>

		<div>
			<form:errors path="expiryMonth" cssClass="error" />
			<form:errors path="expiryYear" cssClass="error" />
		</div>

		<div>
			<label>背面後三碼</label><br>
			<form:input path='cardCVV' required="required" size="3" maxlength="3" />
		</div>

		<div>
			<form:errors path="cardCVV" cssClass="error" />
		</div>

		<hr>

		<div>持卡人資料</div>
		<div>
			<label>持卡人姓名</label><br>
			<form:input path='cardName' placeholder="請輸入持卡人姓名"
				required="required" />
		</div>

		<div>
			<form:errors path="cardName" cssClass="error" />
		</div>
		<div>
			<label>手機號碼</label><br>
			<form:input path='tel' required="required" />
		</div>

		<div>
			<form:errors path="tel" cssClass="error" />
		</div>

		<div>
			<label>電子信箱</label><br>
			<form:input path='email' required="required" type="email" />
		</div>

		<div>
			<form:errors path="email" cssClass="error" />
		</div>
		
		<div>
			<label>帳單地址</label><br>
		</div>	
		<div>
				<form:select path='zip'>
					<option value="">郵遞區號</option>
					<option value="100 台北市 中正區">100 台北市 中正區</option>
					<option value="103 台北市 大同區">103 台北市 大同區</option>
					<option value="104 台北市 中山區">104 台北市 中山區</option>
					<option value="105 台北市 松山區">105 台北市 松山區</option>
					<option value="106 台北市 大安區">106 台北市 大安區</option>
					<option value="108 台北市 萬華區">108 台北市 萬華區</option>
					<option value="110 台北市 信義區">110 台北市 信義區</option>
					<option value="111 台北市 士林區">111 台北市 士林區</option>
					<option value="112 台北市 北投區">112 台北市 北投區</option>
					<option value="114 台北市 內湖區">114 台北市 內湖區</option>
					<option value="115 台北市 南港區">115 台北市 南港區</option>
					<option value="116 台北市 文山區">116 台北市 文山區</option>
					<option value="207 新北市 萬里區">207 新北市 萬里區</option>
					<option value="208 新北市 金山區">208 新北市 金山區</option>
					<option value="220 新北市 板橋區">220 新北市 板橋區</option>
					<option value="221 新北市 汐止區">221 新北市 汐止區</option>
					<option value="222 新北市 深坑區">222 新北市 深坑區</option>
					<option value="223 新北市 石碇區">223 新北市 石碇區</option>
					<option value="224 新北市 瑞芳區">224 新北市 瑞芳區</option>
					<option value="226 新北市 平溪區">226 新北市 平溪區</option>
					<option value="227 新北市 雙溪區">227 新北市 雙溪區</option>
					<option value="228 新北市 貢寮區">228 新北市 貢寮區</option>
					<option value="231 新北市 新店區">231 新北市 新店區</option>
					<option value="232 新北市 坪林區">232 新北市 坪林區</option>
					<option value="233 新北市 烏來區">233 新北市 烏來區</option>
					<option value="234 新北市 永和區">234 新北市 永和區</option>
					<option value="235 新北市 中和區">235 新北市 中和區</option>
					<option value="236 新北市 土城區">236 新北市 土城區</option>
					<option value="237 新北市 三峽區">237 新北市 三峽區</option>
					<option value="238 新北市 樹林區">238 新北市 樹林區</option>
					<option value="239 新北市 鶯歌區">239 新北市 鶯歌區</option>
					<option value="241 新北市 三重區">241 新北市 三重區</option>
					<option value="242 新北市 新莊區">242 新北市 新莊區</option>
					<option value="243 新北市 泰山區">243 新北市 泰山區</option>
					<option value="244 新北市 林口區">244 新北市 林口區</option>
					<option value="247 新北市 蘆洲區">247 新北市 蘆洲區</option>
					<option value="248 新北市 五股區">248 新北市 五股區</option>
					<option value="249 新北市 八里區">249 新北市 八里區</option>
					<option value="251 新北市 淡水區">251 新北市 淡水區</option>
					<option value="252 新北市 三芝區">252 新北市 三芝區</option>
					<option value="253 新北市 石門區">253 新北市 石門區</option>
			</form:select>
			<form:input path='address' required="required" />
		</div>

		<div>
		<form:errors path="zip" cssClass="error" />
			<form:errors path="address" cssClass="error" />
		</div>


		<button type="submit" class="submit-btn register-btn" onclick="location.href='/studentMoney/checkout'">提交</button>
	</form:form>


	<script>
		value = localStorage.getItem('name');
		// alert(value);
		document.getElementById("feedback").innerHTML = value;
		// alert(feedback);
		money = document.getElementById('money');
		money.value = value;
	</script>

</body>
</html>