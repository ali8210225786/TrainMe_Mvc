<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>搜尋教練</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/style_search_trainer.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/css/themes/splide-sea-green.min.css">
</head>
<body>
	<c:if test="${LoginOK == null}">
		<jsp:include page="/fragment/nav.jsp" />
	</c:if>

	<c:if test="${LoginOK.type == 1}">
		<jsp:include page="/fragment/nav_st.jsp" />
	</c:if>

	<c:if test="${LoginOK.type == 2}">
		<jsp:include page="/fragment/nav_tr.jsp" />
	</c:if>

	<!-- ====================================================================== -->



	<!-- 搜尋 -->

	<div class="search_area">
		<div class="title">
			<h3>搜尋教練</h3>
		</div>

		<div class="search_trainer">

			<!-- 搜尋bar -->
			<form action="#">
				<label>課程種類：</label>
				<li><select name="" class="lesson">

						<option value="0">請選擇</option>
						<option value="1">增肌</option>
						<option value="2">減脂</option>
				</select></li> <label>地點：</label>
				<li><select name="" class="location">
						<option value="0">請選擇</option>
						<option value="1">台北市</option>
						<option value="2">新北市</option>
				</select></li>
				<li><input type="search" placeholder="輸入關鍵字"
					class="search_input"></li>
				<li><button class="search_btn">
						<i class="fas fa-search"></i>
					</button></li>

			</form>


			<!-- 排序 -->

			<div class="sequence">

				<label>目前排序</label> <a href="#">即時推薦</a> <a href="#">優質教練優先</a> <a
					href="#">新教練優先</a> <a href="#">低價優先</a> <a href="#">多評價優先</a>

			</div>
		</div>


		<!-- 搜尋結果 -->

		<div class="result">

			<!-- 教練框(每次新增就是整個fb div) -->

			<div class="fb">

				<!-- 教練頭像&名稱&評價 -->
				<div class="mpb">
					<div class="mb_picture">
						<img src="./images/ud.jpg">
					</div>


					<span>基德</span>

					<!-- 評價星星 (暫)-->
					<div class="fc_star">
						<div class="starss" id="starss">
							<img value="1" src="<c:url value='/images/star1.png' />"> <img
								value="2" src="<c:url value='/images/star1.png' />"> <img
								value="3" src="<c:url value='/images/star1.png' />"> <img
								value="4" src="<c:url value='/images/star1.png' />"> <img
								value="5" src="<c:url value='/images/star1.png' />">
						</div>
					</div>

				</div>

				<!-- 內容 -->
				<div class="fb_content">

					<!-- 課程資訊 -->
					<div class="fc_title">
						<a class="trTitle" href="" >嗨，我是基德，是個健身教練　請加LINE:Kidtrainyou</a>
					</div>
					<div class="ls_info">
						<label>課程種類：<span>重訓、有氧</span></label> <label>課程價格：<span>1500
								up</span></label>
					</div>


					<!-- 自我介紹 -->
					<div class="fc_content">
						<p>
							一對一 一對二私人健身課程<br> 不論是減脂或增重雕塑身材,肌肥大或力量<br>
							都可以幫助你加快效率並且讓你降低受傷的風險,減少不必要的途徑和運動受傷<br>
							不管是幾歲的朋友,都需要健身趁年輕開始保持訓練的生活。
						</p>
					</div>

				</div>
			</div>


		</div>


	</div>


</body>
</html>