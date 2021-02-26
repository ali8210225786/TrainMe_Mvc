<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>測試首頁</title>

<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">    --%>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/css/themes/splide-sea-green.min.css">

<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_nav.css">    --%>
    <link rel="stylesheet" href="<c:url value='/css/style_nav.css' />">   
    <link rel="stylesheet" href="<c:url value='/css/popup_t1.css' />">
    
    <style>
/* 	       @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap');  */
        
        /*教練推薦*/

        .hot_trainer{
            text-align: center; 
            display:block;
            margin: 20px 0px -10px;
        }
        .hot_trainer h3{
            font-size: 18px;
            text-align: center;
            color: #666;
            font-family: 'Noto Sans TC', sans-serif;
        }

        .splide{
            margin: auto;
            
        }
        .splide__slide{
            position: relative;
            /* width: 280px; */
            height: 320px;
            /* background-color: black; */
            /* background: linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0.65) 100%); */
            box-shadow: 0px 0px 5px 0.6px #999;
            
        }
        .splide__slide img{
            width: 100%;
            height: 100%;
            /* opacity: 0.5; */
        }

        .splide__slide .p_t{
            position: absolute;
            
            width: 100%;
            bottom: 0px;
            background-color: rgba(0,0,0,0.7);;
            padding: 7px 0px 10px;
            color: aliceblue;     
            font-family: 'Noto Sans TC', sans-serif;       
        }
        .t_name{
            font-size: 18px;
            font-weight: 700;

            text-align: center;
            margin: 8px;
        }
        .p_t span{
            display: flex;
            justify-content: space-around;
            /* padding: 5px; */
            font-size: 13px;
            margin: 0px 10px;
        }
        .p_t span i{
            margin: 0px 10px 0px 0px ;
        }

        /* <p class="t_name">教練名稱</p>
                    <p class="t_location">地點</p>
                    <p class="t_ltimes">20次課程媒合</p> */

        /*評價星星*/

        .p_t span:nth-child(3) p{
            /* vertical-align: middle; */
            margin: 6px 0px 0px -80px;
            font-size: 15px;
        }

        .ratings {
            position: relative;
            bottom: 20%;
            left: 4%;
            vertical-align: middle;
            display: inline-block;
            color: #b1b1b1;
            overflow: hidden;
        }
        .full-stars {
            position: absolute;
            left: 0;
            top: 0;
            white-space: nowrap;
            overflow: hidden;
            color: #fde16d;
        }
        .empty-stars:before, .full-stars:before {
            content:"\2605\2605\2605\2605\2605";
            font-size: 15pt;
        }
        .empty-stars:before {
            -webkit-text-stroke: 1px #848484;
        }
        .full-stars:before {
            -webkit-text-stroke: 1px orange;
        }
        /* Webkit-text-stroke is not supported on firefox or IE */

        /* Firefox */
        @-moz-document url-prefix() {
            .full-stars {
                color: #ECBE24;
            }
        }


        /*nav*/

        /* #navbar {
            overflow: hidden;
        }

        .sticky {
            position: fixed;
            top: 0;
            width: 100%;
        } */

        header{
            position: fixed; /* Make it stick/fixed */
            top: 0; /* Stay on top */
            width: 100%; /* Full width */
            transition: top 0.3s; /* Transition effect when sliding down (and up) */
            background-color: #fff;
            border-bottom: 1px solid  #eee;
            padding: 10px 100px 10px 100px;
            z-index: 1;
        }
        header ul{
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            width: 100%;
            max-width: 1200px;
            margin: auto;
        }
        .items{
            display: inline-flex;
            padding: 0 25px;
        }
        .items li{
            font-size: 14px;
            margin: 0 20px;
            font-family: 'Noto Sans TC', sans-serif;
        }
        .items li a{
            color: #333;
            transition: .3s;
        }
        .items li a:hover{
            color: #59ddb8;
            box-shadow: 0 2px #21d4a7;
            padding-bottom:8px;
        }
        .logo{
            flex: 1;
        }
        .logo img{
            vertical-align: bottom;
            width: 200px;

        }
        .login_btn{
            padding: 10px 20px;
            border: none;
            border-radius: 10px;
            color: #fff;
            background-color: #59ddb8;
            cursor: pointer;
            font-family: 'Noto Sans TC', sans-serif;
        }
        .login_btn:hover{
            padding:9px 19px;
            color: rgb(5, 230, 192);
            background-color:#fff;
            border: 1px solid #59ddb8;
        }
        .slider{
            position: relative;
        }


        .banner{
            position: relative;
            background-image: url('./images/index/banner_192001.jpg');
            background-size: cover;
            background-position: center;
            height: 600px;
            width: 100vw;
            margin: auto;
            /* max-height: 600px; */
        }

        .slider .ad{
            width: 500px;
            position: absolute;
            left: 20%;
            top: 30%;
            color: #fff
            /* background-color: white; */
        }
        .slider h3{
            padding: 0 0 10px;
            font-size: 30px;
            line-height: 35px;
            color:#00ffb7;
            font-family: 'Noto Sans TC', sans-serif;
        }
        .slider p{
            padding: 3px;
            line-height: 22px;
            font-family: 'Noto Sans TC', sans-serif;
        }

        /*搜尋*/
        .search_trainer{
            position: absolute;
            top: 70%;
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .search_trainer li{
            margin: 0px 10px;
        }
        .search_trainer select{
            width: 150px;
        }
        .search_trainer select,.search_input,.search_btn{
            padding: 15px 30px;
            border-radius: 10px;
            border: none;
            font-size: 16px;
            font-family: 'Noto Sans TC', sans-serif;
            text-align: center;
            vertical-align: baseline;
        }
        .search_trainer .search_input{
            width: 200px;
        }
        .search_trainer .search_btn{
            background-color: #59ddb8;
            color: #fff;
            /* font-weight: bold; */
            font-family: 'Noto Sans TC', sans-serif;
            cursor: pointer;
        }
        .search_trainer .search_btn:hover{
            padding: 14px 29px;
            color: rgb(5, 230, 192);
            background-color:#fff;
            border: 1px solid #59ddb8;
        }


        /* footer */

        footer{
            padding: 100px 0 0 0;
            background:#888
        }

        footer .container{
            display: flex;
            width: 1200px;
            margin: auto;
            font-family: 'Noto Sans TC', sans-serif;
        }
        .footer-item h3{
            font-size: 20px;
            color: #fff;
            border-bottom: 1px solid #fff;
            margin-bottom: .5em;
            padding-bottom: .5em;
        }
        .footer-item{
            width: 0;
            flex-grow: 1;
            margin: 0 20px;
        }
        .footer-item nav{
            display: flex;
            flex-direction: column;
 
        }
        .footer-item nav a{
            color: #fff;
            font-size: 14px;
            line-height: 1.2;
            text-decoration: none;
            padding: 5px 0;
        }
        .copyright{
            width: 100%;
            text-align: center;
            font-family:Verdana, Geneva, Tahoma, sans-serif;
            margin: 100px 0 0;
            padding: 10px 0px;
            background-color: #000;
            color: #fff;
        }

        /*其他區塊*/
        .other{
            display: flex;
            justify-content: space-around;
            margin: auto;
            width: 100%;
            max-width: 60%;
            height: 400px;
        }
        .about{
            width: 50%;
            margin: 0px 30px;
        }
        .about p{
            font-family:  'sans-seri','Noto Sans TC',;
            line-height: 1.7;
            font-size: 12px;
        }
        .about h3{
            font-family: 'Noto Sans TC', sans-serif;
            margin: 20px;
            text-align: center;
            color: #888;
        }


        /* @media screen and (min-width: 768px) {
            
        } */


        html .noscroll {
            position: fixed; 
            overflow-y: scroll;
            width: 100%;
        }

        html .fixWindow {
            position: fixed;
            width: 100%;
        }
        
        
        
    </style>
</head>
<body>

<c:if test="${LoginOK == null}">
    <header id="navbar">
        <ul>
            <li class="logo">
                <a href="#"><img src="${pageContext.request.contextPath}/images/index/logo_black.png"></a>
            </li>
            <div class="items">
                <li><a href="#">關於我們</a></li>
                <li><a href="#">尋找教練</a></li>
                <li><a href="#">購物商城</a></li>
                <li><a href="#">運動論壇</a></li>
            </div>
            <li>
                <button class="login_btn" onclick="Show();">登入/註冊</button>
            </li>            
    </header>
</c:if>

<c:if test="${LoginOK.type == 1}">
	<jsp:include page="/fragment/nav_st.jsp"/>  
</c:if>

<c:if test="${LoginOK.type == 2}">
	<jsp:include page="/fragment/nav_tr.jsp"/>  
</c:if>

    <div class="slider">
        <div class="banner">
        
        <div class="ad">
            <h3>健身教練與學員的<br>專屬媒合平台</h3>
            <p>教練課程價錢、時段公開透明<br>
            省去詢問時間，免於被健身業務打擾<br>
            透過評價系統，讓您篩選最適合自己的教練！
            </p>
        </div>
     
            <form class="search_trainer" action="#">
                <li>    
                    <select name="" class="lesson">
                        
                        <option value="0">課程種類</option>
                        <option value="1">增肌</option>
                        <option value="2">減脂</option>
                    </select>
                </li>
                <li>
                    
                    <select name="" class="location">
                        <option value="0">地點</option>
                        <option value="1">台北市</option>
                        <option value="2">新北市</option>
                    </select>
                </li>
                <li><input type="search" placeholder="輸入關鍵字" class="search_input">    </li>
                <li><button class="search_btn">搜尋教練</button>    </li>
            </form>
        </div>
    </div>

    <!-- 人氣教練 -->

    <span class="hot_trainer">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAABmJLR0QA/wD/AP+gvaeTAAAFxUlEQVRoge2ZSYwUZRTHf6+qa9jEgCJGQsSNRAMSBC4eTNCTBsQFlzHgAqSqWdw9aaJy8kxYZrqqewQRF9KoMS6JF+NBPWgGTUQU0IS4oCjSCijTM9Pf8zA1MvR81V09FCQm8z91f9/b/vXet8MoRnFWIGfD6OrVq6caYx4FFgEz4+b9qvqe67qbCoXCb1n7zJxIEAR3A13AxASR4yKyMgzDXVn6zZRITGJnCrsqIvdkSSYzInE5fUdyJupxrK+v76qtW7f+noV/JwsjAPGYSEsC4HzP8x7Jyn9mRIDF50jHiiyJXDkCnauycp4lET1HOlZkSeT7c6RjRWZEVPXdVnVE5J2s/GdGxHXdTcDxFlT+UtVNWfnPjEihUPhNRFaSru5VRFZGUXQkK/9uVoYAuru79y5YsOBr4GZgTILYXyKyLAzDN7P0nSkRGCAzZ86cLtd1exhYICcCvcAeESkCy6Mo6s7a7yhGMYrGGPE2PgiCKSLyiKrewcA+azxww7Rp0z49dOjQfpL3XvujKLo6CIKFwIfAP8D3IvKWqm4a6ZQ8onUkCIJ1wEFVfQ64lgESAOvWr19vgM4kXVXtYGCtWRc3jQeujW0d9H1/7Uhiajkjvu9vFJGkc0RvLpebUa1We13X/ZFTBAfxd29v7/SxY8dOMMYcBHIJdjZGUfRYK3G1lJF8Pn9fAxIAbX19fUFXV9dRVX3N0r9j27Ztfxpj8iSTAHjU9/32VmJLnZEVK1Zc5HneHmBqE9FfgBmqOktEvhja4TjOPGPMHuAgMK2JnT+MMbNKpdLhNPGlzojneZ00JwFwiYjcViwWvwQ+HdL+caFQ+EJVl9KcBMCFjuNEaeNLRSSfz98HLE1r1BgzOJC3DLap6hYAx3FaGcxL8vn8vWkEm5ZWCyVVjzmVSmXf5MmTfwC0UqnMmDRp0kwR+SqN3yE4YoyZ3azEmmYkl8t10DoJRGR1uVzuVdWiqpbK5XIv8DCtz5RTXNfd2NRfo84gCBYB1pOfqm4XkbsYPsUO4viYMWOmnzx58nyAcePGHatWqz8D5yXI/6Oqu0TkAWugIovCMHw/KdbEjARBMB7YnNB9wPO8dUCjdE+sVqv3l0qln0ql0k89PT3X0/jYcDi2ecDWqaqb45isaFRazwOXWdqrQHtHR8cJEWk2NZrBH8Vi8QNjzKwkQRE53NHRcQJoj33U4/J49bfCSmTVqlUzgCcSdJ6Oomg3gKo2ulXvcV339aENrutekyQ8aCu2/bRNRkSeDILgUluflYjruo8DnsXZ+1EUbRjS1IjI252dnZW6tgcbyP9nK4qiDapqGw+eqlq3LkmldZPNUX9//0OcfrmQWFqq+tLQ/2vWrJmsqkuS5Otsaexr2IcSkRttyklEbNPtBW1tbacRbDRGXNf9Zuj/Wq3WDoxNkq+35XneQuACi+jFNv2kjdvnwK31sqq6I5/PE4bhzrgtsbSMMXuDIHhXRF6v1WqfAEGSbL2tfD5/p6q+khDfZzZla0ZE5CngmKUrp6qv+L6/LJZrNGuNA+5W1Tccx/kVmNtAFmPMrwC+79+iqq9iGaPACWPMM9aYkwzHX2Un9q/SLyLLga9U9etGAaaFiMwyxlwhIm8AbRaRWvzKZb0PS1xHwjB8Mw6239KdU9UdqnrDyMIeDmPMdSKyiwQSqvpgo0u9pvse3/fbReRl7Jk5yUAJZYG/gQmWdiMiK8Iw3N5IuelN4+7du/fMnz//W+AOhmfQVscjhS0TCqyNoujFZsqprky7u7v3zps374CI3M7pZAzwJ2eelRrDP5ICQRRFxTQGUt/9DsnM4AW1quoLjuN4wOVp7dggIh8B+zj1FNcnImvTkoAWLx+iKCobY2aKyBIRmV0sFp81xhxtxYYNqvpHpVJZLCJLVfVxEZkbhmHqYy40vsmwIj6p/ffS5DhORfWMnwKPlsvlGjDip4YzfujJIiNA/eZyFP97/At3TzFJmoAGkQAAAABJRU5ErkJggg=="> 
        <h3>本月人氣教練</h3>
    </span>
    
    <div class="splide">
        <div class="splide__track">
            <ul class="splide__list">
                <div class="splide__slide">
                    <div class="p_t">
                        <p class="t_name">林瑪莉</p>
                        <span>
                            <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p>
                            <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p>
                        </span>
                        <span>
                            <div class="ratings">
                                <div class="empty-stars"></div>
                                <div class="full-stars" style="width:80%"></div>                            
                            </div>
                            <p>(18)</p>
                        </span>
                    </div>
                    <img src="${pageContext.request.contextPath}/images/index/1.jpg">
                </div>

                <div class="splide__slide">
                    <div class="p_t">
                        <p class="t_name">林瑪莉</p>
                        <span>
                            <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p>
                            <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p>
                        </span>
                        <span>
                            <div class="ratings">
                                <div class="empty-stars"></div>
                                <div class="full-stars" style="width:80%"></div>                            
                            </div>
                            <p>(18)</p>
                        </span>
                    </div>
                    <img src="${pageContext.request.contextPath}/images/index/2.png">
                </div>

                <div class="splide__slide">
                    <div class="p_t">
                        <p class="t_name">林瑪莉</p>
                        <span>
                            <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p>
                            <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p>
                        </span>
                        <span>
                            <div class="ratings">
                                <div class="empty-stars"></div>
                                <div class="full-stars" style="width:80%"></div>                            
                            </div>
                            <p>(18)</p>
                        </span>
                    </div>
                    <img src="${pageContext.request.contextPath}/images/index/3.jpg">
                </div>
                
                <div class="splide__slide">
                    <div class="p_t">
                        <p class="t_name">林瑪莉</p>
                        <span>
                            <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p>
                            <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p>
                        </span>
                        <span>
                            <div class="ratings">
                                <div class="empty-stars"></div>
                                <div class="full-stars" style="width:80%"></div>                            
                            </div>
                            <p>(18)</p>
                        </span>
                    </div>
                    <img src="${pageContext.request.contextPath}/images/index/1.jpg">
                </div>

                <div class="splide__slide">
                    <div class="p_t">
                        <p class="t_name">林瑪莉</p>
                        <span>
                            <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p>
                            <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p>
                        </span>
                        <span>
                            <div class="ratings">
                                <div class="empty-stars"></div>
                                <div class="full-stars" style="width:80%"></div>                            
                            </div>
                            <p>(18)</p>
                        </span>
                    </div>
                    <img src="${pageContext.request.contextPath}/images/index/2.png">
                </div>

                <div class="splide__slide">
                    <div class="p_t">
                        <p class="t_name">林瑪莉</p>
                        <span>
                            <p class="t_location"><i class="fas fa-map-marker-alt"></i>台北市</p>
                            <p class="t_ltimes"><i class="fas fa-user-friends"></i>20次課程媒合</p>
                        </span>
                        <span>
                            <div class="ratings">
                                <div class="empty-stars"></div>
                                <div class="full-stars" style="width:80%"></div>                            
                            </div>
                            <p>(18)</p>
                        </span>
                    </div>
                    <img src="${pageContext.request.contextPath}/images/index/3.jpg">
                </div>
                
            </ul>
        </div>
    </div>

<!-- 登入/註冊 -->
<jsp:include page="/fragment/login.jsp"/> 


    <div class="other">
        <div class="about">
            <h3>為什麼要找私人健身教練？</h3>
            <p>
                　　私人健身教練會客製化學員的教練課程，依學員時間、身體狀態安排課程，並視情況調整進度，彈性更高、學習更能建立信心，許多教練也會為學生客製化個人的增肌減脂飲食菜單及課後的自主訓練菜單。
許多人會想看書或看影片在家自己練，但常因此忽略細節，甚至因為出力不當造成運動傷害，以至於喪失信心與興趣。私人健身教練採「平衡訓練，以全身為訓練範圍，在過程中重量搭配、角度位置、技術，到安全措施全部包辦。</p>
        </div>
        <div class="about">
            <h3>小型健身房收費與特點</h3>
            <p>
                > 收費方式：以上課次數、課程項目計費<br>
                > 教練費用：單堂教練費用700-3000元，團體課程費用300-1000元<br>
                > 使用限制：預約制或有課程時才能使用<br>
                > 優點：使用人數較少，小班制團體課品質相對有保障，對於想嘗試健身但比較害羞的群體來說也是很好的選擇<br>
                > 缺點：營業據點較少，團體課的多樣性比較低
            </p>
        </div>       
    </div>
    <!-- footer -->

    <footer>
        <div class="container">
            <div class="footer-item">
                <h3>本站地圖</h3>
                <nav>
                    <a href="#">關於我們</a>
                    <a href="#">搜尋教練</a>
                    <a href="#">購物商城</a>
                    <a href="#">運動論壇</a>
                </nav>
            </div>

            <div class="footer-item">
                <h3>本站地圖</h3>
                <nav>
                    <a href="#">關於我們</a>
                    <a href="#">搜尋教練</a>
                    <a href="#">購物商城</a>
                    <a href="#">運動論壇</a>
                </nav>
            </div>

            <div class="footer-item">
                <h3>本站地圖</h3>
                <nav>
                    <a href="#">關於我們</a>
                    <a href="#">搜尋教練</a>
                    <a href="#">購物商城</a>
                    <a href="#">運動論壇</a>
                </nav>
            </div>
            
        </div>
        <div class="copyright">
            Copyright &copy; 2021 Train Me
        </div>
    </footer>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>			 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/js/splide.min.js"></script>
    <script>
   

// 導覽列

        var prevScrollpos = window.pageYOffset;
        window.onscroll = function() {
        var currentScrollPos = window.pageYOffset;
        if (prevScrollpos > currentScrollPos) {
            document.getElementById("navbar").style.top = "0";
        } else {
            document.getElementById("navbar").style.top = "-60px";
        }
        prevScrollpos = currentScrollPos;
        } 
        


// 教練推薦

        document.addEventListener( 'DOMContentLoaded', function () {
            new Splide( '.splide', {
            width: '1200px',
            // fixedWidth: '12rem',
            // fixedHeight: '8rem',
            padding: {
                left:20,
                right:20,
            },               
            perPage: 4,
            perMove: 1,
            gap: 40,
            rewind : true,
            pagination :false,
            // arrowPath: 'M339.7,10l-65.1,65.3L611.3,500L274.6,924.7l65.1,65.3l385.7-490.2L339.7,10z'
        } ).mount();
        } );
        

        
        // 解決有錯誤資料時跳轉頁面問題
	    <c:if test="${studentBean.getHasError()}">
			   Show();
			   register_st()	   	
	    </c:if>
	    <c:if test="${trainerBean.getHasError()}">
			   Show();
			   register_tr()
	    </c:if>
	    <c:if test="${loginBean.getHasError()}">
			   Show();
	    </c:if>
        
        
        
        
        
//         // 找到 select 標籤
//         var gymList = document.getElementById("gymList");

//        // 開始尋找健身房資料的servlet去抓資料，會返回一個promise(承諾)
//         axios.get("/trainme/Gymlist")
//         .then(function (res) {   //若有抓到資料則執行這個function
//           var gyms = res.data; // gyms 為一個物件陣列
//   		console.log(gyms);
//   		for(gym of gyms){
//  	 		console.log(gym);
//   			var option = document.createElement("option");
//   			option.value = gym.id;
//   			option.innerHTML = gym.name;
//   			gymList.appendChild(option);
//   		}
//         });

      </script>

</body>
</html>