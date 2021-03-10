<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>學員-帳戶查詢</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_money.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
    <style>
        .aside ul li:nth-child(4) a{
            color: #21d4a7;
        }
        /* 查詢區間： */
        .qr{
            margin: 10px 0 15px 0;
            display: flex;
            align-items:baseline;
            vertical-align: middle;
            font-size: 15px;
        }
        .qr li select{
            width: 150px;
            font-size: 14px;
        }
        .bank tr th:last-child{
            width: 150px;
        }
    
    </style>
</head>
<body>

	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_tr.jsp" />



	<div class="container">

		<!-- ============左側選單======================================================= -->
		<jsp:include page="/fragment/sidebar_tr.jsp" />

		<!-- ============右側網頁======================================================= -->


		       <!-- ============個人資料======================================================= -->

        <div class="content">
            <div class="title">
                <h3>帳戶查詢</h3>
            </div>
            <!-- 說明 -->

            <div class="explain">
                <p>查詢您在Train Me的課程帳款。</p>
            </div>

        <!-- ============帳戶======================================================= -->
               
                <div class="info_wrap t lesson">

                  <div class="qr">
                    <label>查詢區間：</label>
                    <li>    
                        <select name="">
                            <option value="1">最近三個月</option>
                            <option value="2">最近半年</option>
                            <option value="2">全部資料</option>
                        </select>
                    </li>
                  </div>

                            <table class="table border">
                                <thead class="thead bank">
                                  <tr>
                                    <th scope="col">交易日期</th>
                                    <th scope="col">款項名目</th>
                                    <th scope="col">轉出帳號</th>
                                    <th scope="col">轉入帳號</th>
                                    <th scope="col">轉入金額</th>
                                  </tr>
                                </thead>
                                <c:if test="${AccountBean.size()>0}">
                                <tbody class="tr_height">
                                <c:forEach varStatus="i" begin="0" end="${AccountBean.size()-1}">
                                  <tr>
                                    <td >${AccountBean.get(i.current).time}</td>
                                    <td >${AccountBean.get(i.current).getNote()}</td>
                                    <td>111111111111</td>
                                    <td>${AccountBean.get(i.current).getTrainerBean_H().getBank_account()}</td>
                                    <td>${AccountBean.get(i.current).getTotal_amount()}元</td>
                                  </tr>
                                  </c:forEach>
                                </tbody>
                                </c:if>
                              </table>
                        </div>



                </div>




		</div>
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
			crossorigin="anonymous"></script>
		<script>
	//選單點選變色(待補)
	
	
	var changeTab = null;
	//頁籤

	$('#pills-tab a').on('click', function(event) {
		event.preventDefault()
		console.log(this);
		$(this).tab('show')
	})

	
</script>
</body>
</html>