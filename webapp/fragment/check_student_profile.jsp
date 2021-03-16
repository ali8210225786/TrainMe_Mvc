<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>查看學員資料</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 查看學員資料 -->
<!-- 遮罩 -->
<div id="overlay" class="hide" onclick="Hide();"></div>

<!-- 彈出框 -->
<div id="student_infobox" class="popup_box hide">

	<div class="st_info_wrap">
		<a class="close" href="#" onclick="Hide();">&times;</a>

		<!-- 左相片 -->
		<div class="st_picture">
			<img src="${pageContext.request.contextPath}/images/ud.jpg">
		</div>

		<!-- 右資訊 -->
		<div class="profile">


				<div class="wp_div">
					<h2>林瑪莉</h2>
					<p>Mary</p>
					<i class="fas fa-mars"></i>
				</div>
				<div class="pf">
					<div class="wrap">

						<div class="wp_div">
							<label>年齡</label><span>28歲</span>
						</div>
						<div class="wp_div">
							<label>生日</label><span>1993/01/01</span>
						</div>
						<div class="wp_div">
							<label>連絡電話</label><span>0911999999</span>
						</div>
					</div>

					<div class="wrap">
						<div class="wp_div">
							<label>身高</label><span>165 cm</span>
						</div>
						<div class="wp_div">
							<label>體重</label><span>50 kg</span>
						</div>
						<div class="wp_div">
							<label>BMI</label><span>17.6</span>
						</div>
					</div>
				</div>
			</div>
		
		</div>

	<hr>

	<!-- 自我介紹 -->

	<div class="st_info_wrap">
		<div class="self_intro">
			<p>自我介紹</p>

			<p>一些關於是否有運動習慣、身體狀態等等的自我介紹約150字以內。</p>
		</div>
	</div>
</div>

<script>


//查看學員資料


        // 顯示框
        function Show() {
            document.getElementById('student_infobox').classList.remove('hide');
            document.getElementById('overlay').classList.remove('hide');
            $("#student_infobox").css("display", "block");
            document.documentElement.style.overflow = 'hidden';//電腦端禁止滑動
            document.body.style.overflow = 'hidden';//手機端禁止滑動
            login()
        }
        // 隱藏框
        function Hide() {
            document.getElementById('student_infobox').classList.add('hide');
            document.getElementById('overlay').classList.add('hide');
            $("#student_infobox").css("display", "none");
            document.documentElement.style.overflow = 'auto';//電腦端可以滑動
            document.body.style.overflow = 'auto';//手機端可以滑動
        }
      
</script>
