<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>重置密碼</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> --%>
</head>
<body>

	<div align="center">
		<h2>重置密碼</h2>
		<p>請輸入您的信箱, 系統會寄一組新的密碼給你:</p>

		<form:form id="resetForm" method="POST" action="/TrainMe/resetPassword" modelAttribute="loginBean"
			enctype='multipart/form-data'>
			<table>
				<tr>
					<td>Email:</td>
					<td><form:input type="text" path="userEmail" placeholder="請輸入您的信箱" required="required" size="20" /></td>
					<form:errors path="userEmail" style = "font-size: 1px; color: red;" />
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">送出</button>
					</td>
				</tr>
			</table>
			<div align="center">
				<br />
				<h3>${message}</h3>
				<br />
			</div>
		</form:form>
	</div>


<!-- <!-- 	<script type="text/javascript"> --> -->
<!-- // 	$(document).ready(function() { -->
<!-- // 	    $("#resetForm").validate({ -->
<!-- // 	        rules: { -->
<!-- // 	            email: { -->
<!-- // 	                required: true, -->
<!-- // 	                email: true -->
<!-- // 	            } -->
<!-- // 	        }, -->
<!-- // 	    messages : { -->
<!-- // 	        email: { -->
<!-- // 	            email: "The email should be in the format: abc@domain.tld" -->
<!-- // 	        } -->
<!-- // 	    } -->
<!-- // 	    }); -->
<!-- // 	}); -->
<!-- <!-- 	</script> --> -->
</body>
</html>