<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>學員-個人資料</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="<c:url value='/css/style_st_info.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">
<link rel="stylesheet" href="<c:url value='/css/style_favorite.css' />">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
.aside ul li:nth-child(5) a {
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
					<h3>收藏教練</h3>
				</div>
				 <!-- 說明 -->

        <div class="explain explain_s">
            <label>排序依據：</label>
            <a href="#">加入順序優先</a>
            <a href="#">評價數量優先</a>
            <a href="#">高評價優先</a>
        </div>

            <div class="favorite">
                    
                <!-- 每個教練框 -->
                <a href="javascript:;"><!-- 超連結至教練個人頁面的a -->
                    <div class="trainer">
                        <div class="bgcolor">
                            <span id="heart"><i class="fas fa-heart like"></i></span>
                            <div class="tr_picture">
                                <img src="./images/ud.jpg">    
                            </div>
                            <h6>基德</h6>
                        </div>
                                    
                        <div class="trainer_wrap">
                            <div class="twbox">
                                            
                                <div class="tw">
                                    <label>教練評價</label>
                                        <div class="rating">
                                            <span class="star">★</span> 
                                            <span>5.0</span> 
                                        </div>
                                </div>
                                    <div class="tw">
                                        <label>授課地點</label> <span>新北市新店區</span>
                                    </div>
                                </div>
                                    <div class="twbox">
                                        <div class="tw">
                                        <label>課程類型</label> <span>重訓、減脂</span>
                                        </div>
                                        <div class="tw">
                                            <label>課程價格</label> <span>1500up</span>
                                        </div>
                                    </div>

                                

                        </div>


                    </div>
                </a>
                
                </div>


    
        </div>
    </div>
</div>


<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	//點擊收藏愛心切換顏色
	$(document).ready(function() {
	  $('#heart').click(function() {
	    $('.like').toggleClass('change_color');
	  })
	})


</script>
</body>
</html>