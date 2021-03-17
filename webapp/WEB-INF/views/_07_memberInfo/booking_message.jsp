<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
    crossorigin="anonymous"
    />
    <link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
    <link rel="stylesheet" href="<c:url value='/css/style_st_account.css' />">
    <link rel="stylesheet" href="<c:url value='/css/style_booking_message.css' />">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/css/themes/splide-sea-green.min.css">
</head>
<body>
    <c:if test="${LoginOK.type == 1}">
		<jsp:include page="/fragment/nav_st.jsp" />
	</c:if>



    <!-- ====================================================================== -->
    <div class="booking_title" >
        <div class="title">
            <h3>預約課程 > 確認預約</h3>
        </div>
    </div>
    <div class="booking_lesson">
          
               <!-- 說明 -->

        <div class="b_tutle">
            <h4>發送預約訊息</h4>
        </div>

           <div class="explain">
                <p>即將向教練發送預約訊息。所費點數將在教練同意預約後扣除。</p>
            </div>

            <div class="setting_area">

                <form  method="POST" action="/TrainMe/addBookCourse?tr=${trainerBean.id}&st=${LoginOK.id}&date=${date}&hour=${hour}"  >
                    <div class="setting_box">
                        <label>預約教練</label><p>${trainerBean.name}</p>
                    </div>
                    <div class="setting_box">
                        <label>預約時段</label><p>${bookTime}</p>
                    </div>
                    <div class="setting_box">
                        <label>選擇課程</label>
                        <select id="skill" name="skill" required>                 
	                        <c:if test="${trainerCourses.size() > 0}">
								<c:forEach varStatus="i" begin="0" end="${trainerCourses.size()-1}">
									<option value="${trainerCourses.get(i.current).getSkillBean_H().getId()}">${trainerCourses.get(i.current).getSkillBean_H().getName()}</option>
								</c:forEach>
							</c:if>
                        </select>
                        
                    </div>
                    <div class="setting_box">
                        <label>預計扣除點數</label><p id="price">1500點</p>
                    </div>

                </form>
            </div>

            <div class="check_btn">
                <button class="cancel" id="cancel_btn">取消</button>
                <button class="save" id="save_btn">送出</button>
            </div>

         </div>
    </div>


    
</body>

<!-- <script src="./js/jquery-3.5.1.js"></script> -->

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

	var skillList = document.getElementById('skill');
	skillList.addEventListener("change",function (e) {
		const skillId = e.target.value;
		var price = document.getElementById('price');
// 		getPrice();

		axios.get("/TrainMe/getSkillPrice", {
    	    params: {
    	    	skillId: skillId,
    	    	trId: ${trainerBean.id}
    	    }})
	    .then(function (res) {
	        var getskillPrice = res.data;
	        price.innerText =  getskillPrice;
   		 })
		
	});
	
	
	var cancel_btn = document.getElementById('cancel_btn');
	cancel_btn.addEventListener('click',function(event) {

// 		console.log("aaa");
		window.location.href = "/TrainMe/trainer_info/" + ${trainerBean.id}  + "?type=search";
		event.preventDefault();  // 阻止瀏欄器預設行為(送出表單)
	})

	var save_btn = document.getElementById('save_btn');
	save_btn.addEventListener('click',function(event) {
// 		console.log("aaa");
// 		console.log(document.forms[0]);
		 document.forms[0].submit();	
	});

</script>


</html>