<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<link rel="stylesheet" href="<c:url value='/css/popup_t1.css' />">
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

	<!-- 登入/註冊 -->
	<c:if test="${LoginOK == null}">
		<jsp:include page="/fragment/login.jsp" />
	</c:if>



	<!-- 搜尋 -->

	<div class="search_area">
		<div class="title">
			<h3>搜尋教練</h3>
		</div>

		<div class="search_trainer">

			<!-- 搜尋bar -->
			
			<form action="<c:url value='/searchTrainerByCondition' />"  >
				<label>課程種類：</label>
				<li><select name="skillType" class="lesson">
						<option value="0">請選擇</option>
						<c:if test="${skillTypeAll.size() > 0}">
							<c:forEach varStatus="i" begin="0" end="${skillTypeAll.size()-1}">
								<option value="${skillTypeAll.get(i.current).getId()}">${skillTypeAll.get(i.current).getName()}</option>
							</c:forEach>
						</c:if>
				</select></li> <label>地點：</label>
				<li><select name="city" class="location">
						<option value="0">請選擇</option>
						<c:if test="${cities.size() > 0}">
							<c:forEach varStatus="i" begin="0" end="${cities.size()-1}">
								<option value="${cities.get(i.current).getId()}">${cities.get(i.current).getName()}</option>
							</c:forEach>
						</c:if>
				</select></li>
				<li><input type="search" name="keyword" placeholder="輸入關鍵字"
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
			<c:if test="${trainerCourseAll.size() > 0}">
				<c:forEach varStatus="i" begin="0"
					end="${trainerCourseAll.size()-1}">


					<div class="fb">

						<!-- 教練頭像&名稱&評價 -->
						<div class="mpb">
							<div class="mb_picture">
								<c:choose>
									<c:when
										test="${trainerCourseAll.get(i.current).getTrainerBean_H().getProfile_image() == null}">
										<img
											src="<c:url value="/images/_03_MemberData/upimage.png" />">
									</c:when>
									<c:otherwise>
										<img
											src="/upload/${trainerCourseAll.get(i.current).getTrainerBean_H().getProfile_image()}">
									</c:otherwise>
								</c:choose>
							</div>


							<span>${trainerCourseAll.get(i.current).getTrainerBean_H().getName()}</span>

							<!-- 評價星星 (暫)-->
							<div class="fc_star">
								<div class="starss">
				                    <div class="empty_star">★★★★★</div>
				                    <div class="full_star">★★★★★</div>
	                			</div>
							</div>

						</div>

						<!-- 內容 -->
						<div class="fb_content">

							<!-- 課程資訊 -->
							<div class="fc_title">
								<a class="trTitle"
									href="<c:url value='/trainer_info/${trainerCourseAll.get(i.current).getTrainerBean_H().getId()}?type=search' />">
									${trainerCourseAll.get(i.current).getTrainerBean_H().getCourse()}
								</a>
							</div>
							<div class="ls_info">
								<label>課程種類： <span> 
								
								
								<c:if test="${trainerOfSkillType.size() != 0}">
											<c:forEach varStatus="a" begin="0" end="${trainerOfSkillType.size()-1}">
												<c:if test="${trainerCourseAll.get(i.current).getTrainerBean_H().getId() == trainerOfSkillType.get(a.current).getTrainerBean_H().getId()}">				
													${trainerOfSkillType.get(a.current).getSkill_typeBean_H().getName()}
												</c:if>
											</c:forEach>
								</c:if>

								</span>
								</label> <label>課程價格： <span>${trainerCourseAll.get(i.current).getPrice()}
										up</span></label>
							</div>


							<!-- 自我介紹 -->
							<div class="fc_content">
								<p>
									${trainerCourseAll.get(i.current).getTrainerBean_H().getIntroduction()}
								</p>
							</div>

						</div>



					</div>
				</c:forEach>
			</c:if>


		</div>


	</div>

	
</body>
</html>