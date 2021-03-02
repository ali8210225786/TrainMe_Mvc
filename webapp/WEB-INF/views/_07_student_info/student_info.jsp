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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
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

    <!-- ============上方導覽列======================================================= -->
  <jsp:include page="/fragment/nav_st.jsp"/>  
   



    <div class="container">

        <!-- ============左側選單======================================================= -->
	<jsp:include page="/fragment/sidebar_st.jsp"/>
      

<!-- ============右側網頁======================================================= -->


        
    <div class="main">

        <!-- ============個人資料======================================================= -->
        <div class="content">
            <div class="title">
                <h3>個人資料</h3>
                <a href="<c:url value='/_07_student_info/student_info_edit.jsp' />" id="edit_info"><i class="fas fa-pen-square" style="color:#ddd"></i></a>
            </div>
                
                <div class="info_wrap">

                    <div class="wrap picture"><img src="../images/${LoginOK.photo}" alt=""></div>

                    <div class="wrap profile">

                        <div class="wrap_right">

                            <div class="wrap_profile left">
                                
                                <div class="wp_div">
                                    <h2>${LoginOK.name}</h2><p>${LoginOK.nickname}</p>
                                </div>
                                <div class="wp_div">
                                    <p>帳號 : <span>${LoginOK.email}</span></p>
                                </div>
                                <div class="wp_div" >
                                    <p>點數餘額 : <span>1500</span> 點 <a href="#">我要儲值</a></p>
                                </div>

                            </div>

                            

                            <div class="wrap_profile right">

                                <div class="body_data">
                                    <div class="data">
                                        <p>年齡</p>
                                            <span>22</span>
                                           
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
                                        <span></span>
                                           
                                    </div>
                                    <div class="data">
                                        <p>BMR</p>
                                        <span>1276.4</span>
                                        
                                    </div>
                                    <div class="data">
                                        <p>TDEE</p>
                                        <span>1531.68</span>
                                           
                                    </div>
                                </div>

                            </div>

                        </div>

                        


                        <div class="wrap_right self_intro">
                            
                            <p>一些關於是否有運動習慣、身體狀態等等的自我介紹約150字以內。一些關於是否有運動習慣、身體狀態等等的自我介紹約150字以內。一些關於是否有運動習慣、身體狀態等等的自我介紹約150字以內一些關於是否有運動習慣、身體狀態等等的自我介紹約150字以內。一些關於是否有運動習慣、身體狀態等等的自我介紹約150字以內。</p>
                        </div>
                    
                    
                    </div>            


                </div>

        <!-- ============即將開始的課程======================================================= -->
               
                <div class="info_wrap t">

                    <h5><i class="far fa-list-alt"></i> 即將開始的課程</h5>
                    <table class="table border">
                        <thead class="thead-light">
                          <tr class="my-auto">
                            <th scope="col" class="class_name">課程名稱</th>
                            <th scope="col">教練</th>
                            <th scope="col">上課時間</th>
                            <th scope="col">扣點</th>
                            <th scope="col" >取消課程</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="class_name">加強核心</td>
                            <td>Mark</td>
                            <td>2020-04-01 15:00-16:00</td>
                            <td>1500</td>
                            <td><a href="">取消</a></td>
                          </tr>
                          <tr>
                            <td class="class_name">加強核心</td>
                            <td>Mark</td>
                            <td>2020-04-09 15:00-16:00</td>
                            <td>1500</td>
                            <td><a href="#">取消</a></td>
                          </tr>
                        </tbody>
                      </table>
                      

                    



                </div>
                
        <!-- ============等待同意的預約======================================================= -->

                <div class="info_wrap t">

                    <h5><i class="far fa-list-alt"></i> 等待同意的預約</h5>
                    <table class="table border">
                        <thead class="thead-light">
                          <tr>
                            <th scope="col" class="class_name">課程名稱</th>
                            <th scope="col">教練</th>
                            <th scope="col">上課時間</th>
                            <th scope="col">扣點</th>
                            <th scope="col">取消課程</th>
                          </tr>
                        </thead>
                        <tbody>
                            <td class="class_name">加強核心</td>
                            <td>Mark</td>
                            <td>2020-04-20 15:00-16:00</td>
                            <td>1500</td>
                            <td><a href="#">取消</a></td>
                        </tbody>
                      </table>
                      

                </div>

        <!-- ============體重趨勢圖======================================================= -->

        <div class="info_wrap t">
            <div class="title">
                <h5><i class="fas fa-weight"></i> 我的體重趨勢圖</h5>
                <a href="<c:url value='/_07_student_info/student_info_edit.jsp' />" id="edit_info"><i class="fas fa-pen-square" style="color:#ddd"></i></a>
            </div>
            
            <canvas id="myChart" width="400" height="150"></canvas>
        </div>

        </div>
    
    </div>

</body>




<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
<script>

//選單點選變色
//javascript太爛複製教學拿來改也失敗,之後再補...QQ


// 圖表
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
            datasets: [{
                // label: '# of Votes',
                data: [50, 52, 53, 55, 52, 50, 53, 55, 52, 50],
                backgroundColor: 'transparent',
                borderColor: 'red',
                borderWidth: 1
            }]
        },
        options: {

            plugins: {
					title: {
						display: false,
						
					},
                },
            scales: {
                
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    </script>


</html>