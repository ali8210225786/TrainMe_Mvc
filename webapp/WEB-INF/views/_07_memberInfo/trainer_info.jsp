<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/style_trainer_page.css' />">
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


	<!-- 教練個人導覽列 -->

	<header id="trainer_navbar">
		<ul>
			<div class="items">
				<li><a href="#introduction">教練簡介</a></li>
				<li><a href="#class">課程種類</a></li>
				<li><a href="#license">專業證照</a></li>
				<li><a href="#video">教學影片</a></li>
				<li><a href="#reservation">預約教練</a></li>
				<li><a href="#feedback">學員評價</a></li>
			</div>
		</ul>
	</header>


	<!-- ====================================================================== -->

	<!-- 教練簡介 -->

	<a name="introduction"></a>
	<div class="trpg_wrap">
		<div class="trpg_content">
			<div class="trpg_content_left">
				<div class="picture">
					<c:choose>
						<c:when test="${empty  trainerBean.profile_image}">
							<img
								src="${pageContext.request.contextPath}/images/_03_MemberData/upimage.png">
						</c:when>
						<c:otherwise>
							<img src="/upload/${trainerBean.profile_image}">
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="trpg_content_right">
				<div class="page_title_t">
					<h3>${trainerBean.course}</h3>
				</div>
				<div class="page_title ">

					<h3>${trainerBean.name}</h3>
					<h3>${trainerBean.nickname}</h3>
					<span> <c:if test="${trainerBean.sex.equals('M')}">
							<i class="fas fa-mars"></i>
						</c:if> <c:if test="${trainerBean.sex.equals('F')}">
							<i class="fas fa-venus"></i>
						</c:if>
					</span>
				</div>
				<div class="info_div">
					<label>教練評價</label>
					<div class="starss" id="starss">
						<img value="1" src="<c:url value='/images/star1.png' />"> <img
							value="2" src="<c:url value='/images/star1.png' />"> <img
							value="3" src="<c:url value='/images/star1.png' />"> <img
							value="4" src="<c:url value='/images/star1.png' />"> <img
							value="5" src="<c:url value='/images/star1.png' />">
					</div>
					<p>(30)</p>
				</div>
				<div class="info_div">
					<label>授課區域</label>
					<p>${gym.getName()}</p>
					<!--點此可搜尋屬於該健身房的教練-->
				</div>
				<div class="info_div">
					<label>教練年資</label>
					<p>${trainerBean.year}</p>
					年
				</div>
				<div class="info_div">
					<label>課程種類</label>
					<p>
						<c:if test="${trainerCoursesSkillType.size() > 0}">
							<c:forEach varStatus="i" begin="0"
								end="${trainerCoursesSkillType.size()-1}">
										${trainerCoursesSkillType.get(i.current).getName()} 
										<c:if test="${i.current != trainerCoursesSkillType.size()-1}">
										、
										</c:if>
							</c:forEach>
						</c:if>
					</p>
				</div>
			</div>

			<div class="trpg_content_gym">

				<div class="page_title gym">
					<h3>${gym.getName()}</h3>
				</div>
				<div class="info_div">
					<span><i class="fas fa-map-marker-alt"></i>${gym.getAddress()}
					</span>
				</div>
				<div class="info_div">
					<span><i class="fas fa-phone"></i>${gym.getPhone()}</span>
				</div>
				<div class="info_div">
					<span><i class="fas fa-home"></i><a href="">官方網站</a></span>
				</div>
				<div class="info_div">
					<span>${gym.getIntroduction()}</span>
				</div>
			</div>

		</div>
	</div>


	<!-- 自我介紹 -->

	<div class="trpg_wrap">
		<div class="title">
			<h4>自我介紹</h4>
		</div>
		<div class="trpg_content si" id="introduction">
			${trainerBean.introduction};</div>
	</div>



	<!-- 課程種類 -->
	<a name="class"></a>
	<div class="trpg_wrap">

		<div class="title">
			<h4>課程種類</h4>
		</div>

		<div class="trpg_content si">

			<div class="tab-pane fade show active" id="pills-wait"
				role="tabpanel" aria-labelledby="pills-wait-tab">
				<table class="table table-border ls_class">
					<thead class="thead">
						<tr>
							<th scope="col">課程種類</th>
							<th scope="col" class="class_name">課程名稱</th>
							<th scope="col">課程點數</th>
						</tr>
					</thead>
					<tbody class="tr_height">

						<c:if test="${trainerCourses.size() > 0}">
							<c:forEach varStatus="i" begin="0"
								end="${trainerCourses.size()-1}">
								<tr>
									<td>${trainerCourses.get(i.current).getSkill_typeBean_H().getName()}</td>
									<td>${trainerCourses.get(i.current).getSkillBean_H().getName()}</td>
									<td>${trainerCourses.get(i.current).getPrice()}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!-- 專業證照 -->
	<a name="license"></a>
	<div class="trpg_wrap">
		<div class="title">
			<h4>專業證照</h4>
		</div>

		<div class="trpg_content si">
			<div class="lcs">
				<li>AASFP 亞洲運動及體適能專業學院高級私人體適能教練</li>
				<li>ACE 美國運動體適能協會私人教練</li>
				<li>AFAA PFT 美國有氧體適能協會個人體適能顧問</li>
				<li>Balanced Body Pilates 皮拉提斯墊上訓練第一級和第二級指導員</li>
				<li>EOXi 國際飛輪教練認證</li>
			</div>
		</div>
	</div>

	<!-- 教學影片 -->
	<a name="video"></a>
	<div class="trpg_wrap">
		<div class="title">
			<h4>教學影片</h4>
		</div>

		<div class="trpg_content si">
			<div class="video">
				<c:choose>
					<c:when test="${empty  trainerBean.profile_video}">
						<video id="video" class="upload_videobox" controls></video>
					</c:when>
					<c:otherwise>
						<video id="video" class="upload_videobox" controls>
							<source src="/upload/${trainerBean.profile_video}"
								type="video/mp4" id="video_del">
						</video>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>


	<!-- 預約教練 -->

	<a name="reservation"></a>
	<div class="trpg_wrap">
		<div class="title">
			<h4>預約教練</h4>
		</div>
		<div class="trpg_content si">(暫無)</div>
	</div>



	<!-- 學員評價 -->

	<a name="feedback"></a>
	<div class="trpg_wrap">
		<div class="title">
			<h4>學員評價</h4>
		</div>
		<div class="trpg_content si feedback">


			<!-- 單則評價(每次新增就是整個fb div) -->

			<div class="fb">

				<!-- 會員大頭貼 -->
				<div class="mb_picture">
					<img src="<c:url value='/images/_03_MemberData/upimage.png' />">
				</div>

				<!-- 評價內容 -->
				<div class="fb_content">

					<!-- 會員名稱時間等等 -->
					<div class="fc_title">
						<span>天竺鼠</span> <span>2021-01-27 08:30</span> <label>課程：</label><span>基德老師快樂減重課程快樂減重課程快樂課程</span>
					</div>

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

					<!-- 留言 -->
					<div class="fc_content">
						<p>
							很認真,很照顧學員<br> 對於第一次使用健身房器材,也講的很詳細,<br>
							以及飲食控制也不怕麻煩請學員每日提供餐食內容物以判斷熱量吸取的狀態。<br> 真心推薦!
						</p>
					</div>

				</div>
			</div>

			<div class="fb">
				<!-- 會員大頭貼 -->
				<div class="mb_picture">
					<img src="<c:url value='/images/_03_MemberData/member.jpg' />">
				</div>

				<!-- 評價內容 -->
				<div class="fb_content">

					<!-- 會員名稱時間等等 -->
					<div class="fc_title">
						<span>天竺鼠</span> <span>2021-01-27 08:30</span> <label>課程：</label><span>基德老師快樂減重課程快樂減重課程快樂課程</span>
					</div>

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

					<!-- 留言 -->
					<div class="fc_content">
						<p>
							很認真,很照顧學員<br> 對於第一次使用健身房器材,也講的很詳細,<br>
							以及飲食控制也不怕麻煩請學員每日提供餐食內容物以判斷熱量吸取的狀態。<br> 真心推薦!
						</p>
					</div>

				</div>
			</div>

			<div class="fb">

				<!-- 會員大頭貼 -->
				<div class="mb_picture">
					<img src="<c:url value='/images/_03_MemberData/member.jpg' />">
				</div>

				<!-- 評價內容 -->
				<div class="fb_content">

					<!-- 會員名稱時間等等 -->
					<div class="fc_title">
						<span>天竺鼠</span> <span>2021-01-27 08:30</span> <label>課程：</label><span>基德老師快樂減重課程快樂減重課程快樂課程</span>
					</div>

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

					<!-- 留言 -->
					<div class="fc_content">
						<p>
							很認真,很照顧學員<br> 對於第一次使用健身房器材,也講的很詳細,<br>
							以及飲食控制也不怕麻煩請學員每日提供餐食內容物以判斷熱量吸取的狀態。<br> 真心推薦!
						</p>
					</div>

				</div>
			</div>

		</div>
	</div>




</body>
</html>