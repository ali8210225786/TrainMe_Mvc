<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>學員-個人資料-編輯</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/style_st_info.css">
    <link rel="stylesheet" href="../css/style_nav.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <!-- 暫時代替側邊選單點擊變色的功能的CSS -->
    <style>
        .aside ul li:nth-child(2) a{
            color: #21d4a7;
        }
    </style>
</head>
<body>
   <jsp:include page="/fragment/nav_st.jsp"/>  
   

    <!-- 編輯資料 -->

    <div class="container">
    <jsp:include page="/fragment/sidebar_st.jsp"/>
        



        <div class="content">
            <div class="title"><h3>個人資料 > 編輯</h3></div>
              

                   <!-- 說明 -->

                <div class="explain">
                    <p>您所填寫的資料將反映到BMI、BMR與TDEE的數據上。</p>
                </div>
                <div class="edit_area">
                        <div class="edit_box">
                            <label>身高(cm)</label><br>
                            <input type="number" id="heigth" required>
                        </div>
                        <div class="edit_box">
                            <label>體重(kg)</label><br>
                            <input type="number" id="weight" required>
                        </div>
                        <div class="edit_box">
                            <label>活動量程度</label><br>
                            <select id="activity" name="activity" class="select_activity" required>
                                <option value = 0>久坐（很少或完全沒運動）</option>
                                <option value = 1>輕度活動量（偶爾運動 / 每周運動1~3天）</option>
                                <option value = 2>中度活動量（適度運動 / 每周運動3~5天）</option>
                                <option value = 3>高度活動量（積極運動 / 每周運動6~7天）</option>
                                <option value = 4>超高度活動量（加強鍛鍊 / 密集運動、從事體力工作或高度身體訓練）</option>
                            </select>
                        </div>
                        <div class="edit_box">
                            <label>自我介紹（150字以內）</label><br>
                            <div class="explain">
                                <p>教練將藉由自我介紹了解您。您可以在此填寫平常的運動習慣、是否有過健身經驗、目前的身體狀態或飲食習慣等資訊。</p>
                            </div>
                            <textarea name="" id="" cols="41" rows="10"></textarea>
                        </div>
                        <div class="edit_box e_button">
                            <button class="cancel" id="cancel_btn">取消</button>
                            <button class="save" id="save_btn">儲存</button>
                        </div>
                    </div>
             </div>
        </div>
    <script>
    	var save = document.getElementById('save_btn');
    	var heigth = document.getElementById('heigth');
    	var weight = document.getElementById('weight');
    	var activity = document.getElementById('activity');
    	save.addEventListener('click',function(){
//     	  console.log(heigth.value);
//     	  console.log(weight.value);
//     	  console.log(activity.value);
    	.post{"",{
		    		heigth : heigth.value,
		    		weight : weight.value,
					activity : acthivity.value   		
    	   		}    		
    		}    		
    	})
    
	    var cancel_btn = document.getElementById('cancel_btn');
	    cancel_btn.addEventListener('click',function () {
	    	console.log("aaa");
		window.location.href="<c:url value='/_07_student_info/student_info.jsp' />";		
	    })
    
    </script>
</body>
</html>