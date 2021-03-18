
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>教練-個人資料</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_info.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_st_account.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_nav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_tr_info.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="./css/style_st_lesson.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
/* 暫時代替側邊選單點擊變色的功能的CSS */
.aside ul li:nth-child(2) a {
	color: #21d4a7;
}

body {
	color: #404E67;
	background: #F5F7FA;
	font-family: 'Open Sans', sans-serif;

}

.table-wrapper {
	width: 690px;
	margin: 30px auto;
	background: #fff;
	padding: 20px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 10px;
	margin: 0 0 10px;
}

.table-title h2 {
	margin: 6px 0 0;
	font-size: 22px;
}

.table-title .add-new {
	float: right;
	height: 30px;
	font-weight: bold;
	font-size: 12px;
	text-shadow: none;
	min-width: 100px;
	border-radius: 50px;
	line-height: 13px;
}

.table-title .add-new i {
	margin-right: 4px;
}

table.table {
	table-layout: fixed;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	text-align: center;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table th:last-child {
	width: 100px;
}

table.table td a {
	cursor: pointer;
	display: inline-block;
	margin: 0 5px;
	min-width: 24px;
}

table.table td a.add {
	color: #27C46B;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}

table.table td a.add i {
	font-size: 24px;
	margin-right: -1px;
	position: relative;
	top: 3px;
}

table.table .form-control {
	height: 32px;
	line-height: 32px;
	box-shadow: none;
	border-radius: 2px;
}

table.table .form-control.error {
	border-color: #f50000;
}

table.table td .add {
	display: none;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
</head>
<body>
	<!-- ============上方導覽列======================================================= -->
	<jsp:include page="/fragment/nav_tr.jsp" />

	<!-- 編輯資料 -->

	<div class="container">
		<!-- ============左側選單======================================================= -->
		<jsp:include page="/fragment/sidebar_tr.jsp" />

		<div class="content">
			<div class="title">
				<h3>上課日誌</h3>
			</div>


			<div class="setting_area">
				<form:form action="/TrainMe/updateStudentCourseDatDiaryContent/${CourseMsg.id}"
					method="post" modelAttribute="courseDiaryItemBean_VO"
					enctype="multipart/form-data">
					<div class="setting_box">
						<div class="container-lg">
							<div class="table-responsive">
								<div class="table-wrapper">
									<div class="table-title">
										<div class="row">
											<div class="col-sm-8">
												<h2>
													重量訓練
												</h2>
											</div>
											<div class="col-sm-4">
												<button type="button" class="btn btn-info add-new">
													<i class="fa fa-plus"></i>新增
												</button>
											</div>
										</div>
									</div>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>訓練動作</th>
												<th>總重量</th>
												<th>次數</th>
												<th>組數</th>
												<th>休息時間</th>
												<td><a class="add" title="Add" data-toggle="tooltip"><i
														class="material-icons">&#xE03B;</i></a> <a class="edit"
													title="Edit" data-toggle="tooltip"><i
														class="material-icons">&#xE254;</i></a> <a class="delete"
													title="Delete" data-toggle="tooltip"><i
														class="material-icons">&#xE872;</i></a></td>
											</tr>
										</thead>
										<tbody>
											<tr>
<!-- 												<td>John Doe</td> -->
<!-- 												<td>Administra</td> -->
<!-- 												<td>555-2222</td> -->
<!-- 												<td>555-2222</td> -->
<!-- 												<td>555-2222</td>				 -->
											</tr>									
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>


					<div class="setting_box upload_file">
						<label for="name"><h5>教練建議:</h5></label>
						<textarea name="datdiary_content" id="text" cols="60" rows="15"
							maxlength="1000" placeholder="限1000字以內">${CourseMsg.datdiary_content}</textarea>
						<p id="feedback"></p>
					</div>


					<div class="edit_box e_button">
						<button class="save">更新</button>
					</div>
				</form:form>
			</div>


		</div>
	</div>
	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js">
		
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script>
		// 自我介紹       
		$(document)
				.ready(
						function() {
							let textMax = ($("#text").val()).length;

							$('#feedback')
									.html(
											`已經輸入 <span style="color:red;">${'${'}textMax}</span> 個字 `);

							$('#text')
									.keyup(
											function() {
												let textMax = 0;
												let textLength = $(this).val().length;
												total = textMax + textLength;
												$('#feedback')
														.html(
																`已經輸入 <span style="color:red;">${'${'}total}</span> 個字 `);
												//$('#feedback').html("已經輸入 <span style='color:red;'>" + totle + "</span> 個字");
											});
						});

		// 將換行、空白符號轉換成<br>，存入資料庫
		var content = $("#text").val();
		content = content.replace(/\n|\r\n/g, "<br>");
		// 		console.log(content);

		$(document)
				.ready(
						function() {
							$('[data-toggle="tooltip"]').tooltip();
							var actions = $("table td:last-child").html();
							// Append table with add row form on add new button click
							$(".add-new")
									.click(
											function() {
												$(this).attr("disabled",
														"disabled");
												var index = $(
														"table tbody tr:last-child")
														.index();
												var row = '<tr>'
														+ '<td><input style="width:85px;" type="text" class="form-control" path="action" id="action"/></td>'
														+ '<td><input  style="width:86px;" type="text" class="form-control" name="lord" id="lord"></td>'
														+ '<td><input  style="width:86px;" type="text" class="form-control" name="reps" id="reps"></td>'
														+ '<td><input  style="width:86px;" type="text" class="form-control" name="sets" id="sets"></td>'
														+ '<td><input  style="width:86px;" type="text" class="form-control" name="rest" id="phone"></td>'
														+ '<td>' + actions
														+ '</td>' + '</tr>';
												$("table").append(row);
												$("table tbody tr").eq(
														index + 1).find(
														".add, .edit").toggle();
												$('[data-toggle="tooltip"]')
														.tooltip();
											});
							// Add row on add button click
							$(document).on(
									"click",
									".add",
									function() {
										var empty = false;
										var input = $(this).parents("tr").find(
												'input[type="text"]');
										input.each(function() {
											if (!$(this).val()) {
												$(this).addClass("error");
												empty = true;
											} else {
												$(this).removeClass("error");
											}
										});
										$(this).parents("tr").find(".error")
												.first().focus();
										if (!empty) {
											alert("123");
											input.each(function() {
												$(this).parent("td").html(
														$(this).val());
											});
											$(this).parents("tr").find(
													".add, .edit").toggle();
											$(".add-new")
													.removeAttr("disabled");
										}
									});
							// Edit row on edit button click
							$(document).on("click",".edit",
											function() {$(this).parents("tr").find("td:not(:last-child)").each(function() {
												$(this).html('<input type="text" style="width:86px;" class="form-control" value="'+ $(this).text()+ '">');});
												$(this).parents("tr").find(
														".add, .edit").toggle();
												$(".add-new").attr("disabled",
														"disabled");
											});
							// Delete row on delete button click
							$(document).on("click", ".delete", function() {
								$(this).parents("tr").remove();
								$(".add-new").removeAttr("disabled");
							});
						});
	</script>
</body>
</html>
