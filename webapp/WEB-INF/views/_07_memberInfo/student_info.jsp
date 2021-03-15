<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>學員-個人資料</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="../css/style_st_info.css">
<link rel="stylesheet" href="../css/style_nav.css">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
.aside ul li:nth-child(2) a {
	color: #21d4a7;
}
</style>
</head>
<body>

	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_st.jsp" />




	<div class="container">

		<!-- ============左側選單======================================================= -->
		<jsp:include page="/fragment/sidebar_st.jsp" />


		<!-- ============右側網頁======================================================= -->



		<div class="main">

			<!-- ============個人資料======================================================= -->
			<div class="content">
				<div class="title">
					<h3>個人資料</h3>
					<a href="<c:url value='/student_info_edit/${LoginOK.id}' />"
						id="edit_info"><i class="fas fa-pen-square"
						style="color: #ddd"></i></a>
				</div>

				<div class="info_wrap">

					<div class="wrap picture">
						<c:choose>
							<c:when test="${empty  LoginOK.profile_image}">
								<img id="photo" name="photo"
									src="${pageContext.request.contextPath}/images/_03_MemberData/upimage.png">
							</c:when>
							<c:otherwise>
								<img id="photo" name="photo"
									src="/upload/${LoginOK.profile_image}">
							</c:otherwise>
						</c:choose>

					</div>

					<div class="wrap profile">

						<div class="wrap_right">

							<div class="wrap_profile left">

								<div class="wp_div">
									<h2>${LoginOK.name}</h2>
									<p>${LoginOK.nickname}</p>
								</div>
								<div class="wp_div">
									<p>
										帳號 : <span>${LoginOK.email}</span>
									</p>
								</div>
								<div class="wp_div">
									<p>
										點數餘額 : <span> <c:choose>
												<c:when test="${MoneyBean.size() == 0}">
													0
												</c:when>
												<c:otherwise>
												${MoneyBean.get((MoneyBean.size()-1)).total_amount} 	
												</c:otherwise>

											</c:choose>
										</span> 點 <a href="#">我要儲值</a>
									</p>
								</div>

							</div>



							<div class="wrap_profile right">

								<div class="body_data">
									<div class="data">
										<p>年齡</p>
										<span>${age}</span>

									</div>
									<div class="data">
										<p>身高</p>
										<span>${LoginOK.heigth}</span>

									</div>
									<div class="data">
										<p>體重</p>
										<span>${LoginOK.weight}</span>

									</div>
								</div>
								<div class="body_data">
									<div class="data">
										<p>BMI</p>
										<span>${BMI}</span>

									</div>
									<div class="data">
										<p>BMR</p>
										<span>${BMR}</span>

									</div>
									<div class="data">
										<p>TDEE</p>
										<span>${TDEE}</span>

									</div>
								</div>

							</div>

						</div>




						<div class="wrap_right self_intro">

							<p>${LoginOK.introduction}</p>
						</div>


					</div>


				</div>

				<!-- ============即將開始的課程======================================================= -->

				<div class="info_wrap t">

					<h5>
						<i class="far fa-list-alt"></i> 即將開始的課程
					</h5>
					<table class="table border">
						<thead class="thead">
							<tr class="my-auto">
								<th scope="col" class="class_name">課程名稱</th>
								<th scope="col">教練</th>
								<th scope="col">上課時間</th>
								<th scope="col">本堂點數</th>
								<th scope="col">取消課程</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${comingSoonCourse.size() > 0}">
								<c:forEach varStatus="i" begin="0"
									end="${comingSoonCourse.size()-1}">

									<tr>
										<td class="class_name">${comingSoonCourse.get(i.current).getTrainerCourseBean_H().getSkillBean_H().getName()}</td>
										<td>${comingSoonCourse.get(i.current).getTrainerCourseBean_H().getTrainerBean_H().getName()}</td>
										<td>${comingSoonCourse.get(i.current).getDate()}

											${comingSoonCourse.get(i.current).getTime()}:00 -
											${comingSoonCourse.get(i.current).getTime() + 1}:00</td>
										<td>${comingSoonCourse.get(i.current).getTrainerCourseBean_H().getPrice()}</td>
										<td><a href="/TrainMe/CancelCourse/${LoginOK.id}?courseId=${comingSoonCourse.get(i.current).getId()}"
											class="cancel">取消</a></td>
									</tr>

								</c:forEach>
							</c:if>

						</tbody>
					</table>






				</div>

				<!-- ============等待同意的預約======================================================= -->

				<div class="info_wrap t">

					<h5>
						<i class="far fa-list-alt"></i> 等待同意的預約
					</h5>
					<table class="table border">
						<thead class="thead">
							<tr>
								<th scope="col" class="class_name">課程名稱</th>
								<th scope="col">教練</th>
								<th scope="col">上課時間</th>
								<th scope="col">本堂點數</th>
								<th scope="col">取消課程</th>
							</tr>
						</thead>

						<tbody>
							<c:if test="${waitCourse.size() > 0}">
								<c:forEach varStatus="i" begin="0" end="${waitCourse.size()-1}">
									<td class="class_name">${waitCourse.get(i.current).getTrainerCourseBean_H().getSkillBean_H().getName()}</td>
									<td>${waitCourse.get(i.current).getTrainerCourseBean_H().getTrainerBean_H().getName()}</td>
									<td>${waitCourse.get(i.current).getDate()}

										${waitCourse.get(i.current).getTime()}:00 -
										${waitCourse.get(i.current).getTime() + 1}:00</td>
									<td>${waitCourse.get(i.current).getTrainerCourseBean_H().getPrice()}</td>
									<td><a href="/TrainMe/CancelCourse/${LoginOK.id}?courseId=${waitCourse.get(i.current).getId()}" class="cancel">取消</a></td>
								</c:forEach>
							</c:if>
						</tbody>


					</table>


				</div>

				<!-- ============體重趨勢圖======================================================= -->

				<div class="info_wrap t">
					<div class="title">
						<h5>
							<i class="fas fa-weight"></i> 我的體重趨勢圖
						</h5>
						<p>單位:kg</p>
					</div>

					<canvas id="myChart" width="400" height="150"></canvas>
				</div>

			</div>

		</div>
</body>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
<script>
	//選單點選變色
	//javascript太爛複製教學拿來改也失敗,之後再補...QQ

	// 圖表
	var ctx = document.getElementById('myChart').getContext('2d');

	function weight(){
		var array = new Array();
		<c:forEach items="${StudentDataBean}" var="sdb">
	 		array.push(${sdb}); //js中可以使用此標籤，將EL表示式中的值push到陣列中
	 	</c:forEach>
	return array;
	}
	var myChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月',
					'10月', '11月', '12月' ], // 時間
			datasets : [ {
				// label: '# of Votes',				
				
				data : 
					
					[ ] = weight(),  //體重			
					backgroundColor : 'transparent',
					borderColor : 'red',
					borderWidth : 1	,					
			} ]
		},
		options : {
			legend : { 
				display: false 
				},
			plugins : {
				title : {
					display : false,

				},
			},
			scales : {

				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
	
	// 確認是否取消通知
	$('.cancel').on('click', function (event) {
		var yes = confirm('是否確定取消課程？');
		if(!yes){
			event.preventDefault();
		}
	})
	


	
</script>


</html>