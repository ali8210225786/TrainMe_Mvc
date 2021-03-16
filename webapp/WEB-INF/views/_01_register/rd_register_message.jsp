<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>註冊成功</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_rd_page.css' />">

</head>
<body>
	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav.jsp" />
	
   <div class="message">
          
               <!-- 說明 -->
        <div class="sa">
            <div class="b_tutle">
                <h4>歡迎您加入Train Me</h4>
            </div>

            <div class="block">


                <h5>請查收您的電子郵件</h5>
                <p>註冊驗證信已發送至</p>
                <p>xxs@gmail.com</p>
                <p>請點擊郵件內的驗證連結，完成會員啟用。</p>
                    
            </div>


         </div>
    </div>
</body>
</html>