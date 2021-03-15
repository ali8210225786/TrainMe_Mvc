<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>教練-課程管理</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/style_st_account.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_timeset.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_lesson.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_tr_lesson.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
.aside ul li:nth-child(3) a {
	color: #21d4a7;
}

.short_nb {
	width: 90px;
}

.lesson_name {
	width: 300px;
}
</style>
</head>
<body>
	<jsp:include page="/fragment/nav_tr.jsp" />


	<div class="container">

		<jsp:include page="/fragment/sidebar_tr.jsp" />


		<div class="content">
			<div class="back">
				<a href="<c:url value='/trainerCourse/${LoginOK.id}' />"><i
					class="fas fa-chevron-left"></i> 返回課程管理</a>
			</div>

			<div class="title">
				<h3>課程管理 > 我的課程設定</h3>
			</div>


			<!-- ============課程設定======================================================= -->
			<div class="info_wrap t lesson">

				<!-- 新增 -->
				<div class="setting_box add_lesson">
					<p class="label_set">新增課程：</p>
					<select name="" id="l_category">
						<option value="0">請選擇</option>
						<c:if test="${skillTypeAll.size() > 0}">
							<c:forEach varStatus="i" begin="0" end="${skillTypeAll.size()-1}">
								<option value="${skillTypeAll.get(i.current).getId()}">${skillTypeAll.get(i.current).getName()}</option>
							</c:forEach>
						</c:if>
					</select>

					<p class="label_set">課程名稱：</p>
					<input type="text" id="l_name" name="" placeholder="限20字以內"
						class="lesson_name" />

					<p class="label_set">課程定價：</p>
					<input type="number" min="0" id="l_price" name="" class="short_nb" />

					<button type="button" class="btn btn-dark n_btn add_btn"
						onclick="addtr()">新增</button>


					<!-- 表格 -->
					<div class="tab-content mt-3" id="">
						<div class="tab-pane fade show active" id="" role="tabpanel"
							aria-labelledby="pills-wait-tab">
							<table id="" class="table table-border">
								<thead class="thead">
									<tr>
										<th scope="col">課程種類</th>
										<th scope="col">課程名稱</th>
										<th scope="col">價格</th>
										<th scope="col">編輯</th>
									</tr>
								</thead>
								<tbody class="tr_height tr_license tr_lesson">
									<tr>
										<!-- <td>重訓</td>
                                <td>TRX</td>
                                <td>1280</td>
                                <td><a href="#">修改</a>　<a href="#">刪除</a></td> -->
									</tr>
								</tbody>
							</table>
						</div>

					</div>





				</div>
			</div>
		</div>
</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script>
	// 編輯課程

	// ↓↓↓↓↓↓↓↓↓↓↓目前都壞掉ㄌ↓↓↓↓↓↓↓↓↓↓↓

	//新增
	function addtr() {
		// var l_category=document.getElementById('l_category').value;
		var checkValue = $("#l_category").val();
		var l_name = document.getElementById('l_name').value;
		var l_price = document.getElementById('l_price').value;
		var table = document.getElementById('table');
		var tradd = table.insertRow(1)
		tradd.innerHTML = ` <td>${checkValue}</td><td>${l_name}</td><td>${l_price}</td><td><a href="javascript:" onclick="del(this)">刪除</a></td>`

	}
	table.insertRow()

	//刪除
	function del(obj) {
		var yes = confirm('確定刪除？');
		if (yes) {
			var tr = obj.parentNode.parentNode;//得到按钮bai[obj]的父元素duzhi[td]的父元素[tr]
			tr.parentNode.removeChild(tr);//从daotr的父元素[tbody]移除tr
		}
	}
</script>
</html>