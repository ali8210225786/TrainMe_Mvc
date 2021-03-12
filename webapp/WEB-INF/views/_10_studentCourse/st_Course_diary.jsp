<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>學員-我的日記</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_diary.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 暫時代替側邊選單點擊變色的功能的CSS -->
<style>
.aside ul li:nth-child(3) a {
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
    <div id="context">
    <h1 style="color:darkcyan;">上課日誌</h1>
  

    <p>
       學員名稱：${CourseMsg.getStudentBean_H().getName()}
    </p>

    <p>
        指導教練：${CourseMsg.getTrainerCourseBean_H().getTrainerBean_H().getName()}
    </p>

    <p>
        上課日期：${CourseMsg.getDate()}

    </p>
    <p>
        課程內容：${CourseMsg.getDatdiary_content()}

    </p>


</div>

    <div class="container">
        <div class="tab tab-1" >
            <table id="table" border="1">
                <tr class="active">
                    <th>訓練動作</th>
                    <th>總重量</th>
                    <th>次數</th>
                    <th>組數</th>
                    <th>休息時間</th>
                </tr>
                <c:if test="${CourseDiaryItem.size()!=0 }">
                <c:forEach varStatus="i" begin="0"	end="${CourseDiaryItem.size()-1}">
                <tr>
                    <td>${CourseDiaryItem.get(i.current).getAction()}</td>
                    <td>${CourseDiaryItem.get(i.current).getLord()}kg</td>
                    <td>${CourseDiaryItem.get(i.current).getReps()}次</td>
                    <td>${CourseDiaryItem.get(i.current).getSets()}組</td>
                    <td>${CourseDiaryItem.get(i.current).getRest()}分鐘</td>
                </tr>
               </c:forEach>
                </c:if>
            </table>
        <!-- </div> -->
        <!-- <div class="tab tab-2"> -->
            <div id="buttons">
        
            <input type="text" id="move" name="move" placeholder="訓練動作">
            <input type="number" id="weight" name="weight" placeholder="總重量">
            <input type="number" id="counts" name="counts" placeholder="次數">
            <input type="number" id="groups" name="groups" placeholder="組數">
            <input type="number" id="rest" name="rest" placeholder="休息時間">
            <!-- First Name :<input type="text" name="fname" id="fname" >
                Last Name :<input type="text" name="lname" id="lname">
                Age :<input type="number" name="age" id="age"> -->
                
                <button onclick="addHtmlTableRow();">新增</button>
<!--                 <button onclick="editHtmlTbleSelectedRow();">編輯</button> -->
                <button onclick="removeSelectedRow();">刪除</button>
          
            </div>
        <!-- </div> -->
    </div>

    <!-- ---------------------------------- -->
</div>
    <form>

        <h3>
            教練建議:
        </h3>
        <p>
            <textarea name="talk" cols="100" rows="10"></textarea>
        </p>
        <div id="feedback"></div>
    

        <hr>
        <div id="buttons2">
        <input type="submit" value="儲存日記">
        <input type="reset" value="重新填寫">
    </div>
    </form>

    <!-- ---------------------------------- -->






    <!-- DOR SCRIPT!!!!! -->



    <footer>
        &copy;2021 TrainMe
    </footer>
<script src="../javascript/diary.js"></script>
</body>

</html>