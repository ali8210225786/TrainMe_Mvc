<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>教練-課程管理</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<link rel="stylesheet" href="./css/style_st_info.css">
<link rel="stylesheet" href="./css/style_st_account.css">
<link rel="stylesheet" href="./css/style_timeset.css">
<link rel="stylesheet" href="./css/style_nav.css">
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
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
	defer></script>
</head>
<body>

	<jsp:include page="/fragment/nav_tr.jsp" />



	<div class="container">

		<jsp:include page="/fragment/sidebar_tr.jsp" />



		<div class="content" x-data="courseData()" x-init="init()">
			<div class="back">
				<a href="./tr_lesson.html"><i class="fas fa-chevron-left"></i>
					返回課程管理</a>
			</div>
			<div class="title">
				<h3>課程管理 > 管理預約時段</h3>
			</div>

			<div id="datebox" class="datebox">
				<p>請在此設定您不開放預約的時段。</p>

				<div>
					<label>選擇起始日期：</label> <input type="date" id="date_begin"
						name="date_begin" class="input_date" x-model="dateBegin"
						@change="updateBeginDate()" />
				</div>
			</div>



			<!-- ============預約時間設定======================================================= -->

			<div class="info_wrap t lesson">

				<div class="sc">
					<!-- 一進來就會顯示當天起始那一周的時間表 -->
					<table class="table tschedule">
						<thead class="thead">
							<tr>
								<th scope="col"></th>
								<th scope="col">(一)<br> 3/8
								</th>
								<th scope="col">(二)<br> 3/9
								</th>
								<th scope="col">(三)<br> 3/10
								</th>
								<th scope="col">(四)<br> 3/11
								</th>
								<th scope="col">(五)<br> 3/12
								</th>
								<th scope="col">(六)<br> 3/13
								</th>
								<th scope="col">(日)<br> 3/14
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">8:00 - 9:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">9:00 - 10:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">10:00 - 11:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">11:00 - 12:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">12:00 - 13:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">13:00 - 14:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">14:00 - 15:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">15:00 - 16:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">16:00 - 17:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">17:00 - 18:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">18:00 - 19:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">19:00 - 20:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">20:00 - 21:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
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

  

//   function convertToISO(timebit) {
//     // remove GMT offset
//     timebit.setHours(0, -timebit.getTimezoneOffset(), 0, 0);
//     // format convert and take first 10 characters of result
//     var isodate = timebit.toISOString().slice(0,10);
//     return isodate;
//   }

//   var bookdate = document.getElementById('date_begin');
//   var currentdate = new Date();
//   bookdate.min = convertToISO(currentdate);
//   bookdate.placeholder = bookdate.min;
//   var futuredate = new Date();
  // 限制只能選2周內的日期
  // futuredate.setDate(futuredate.getDate() + 14);
  // bookdate.max = convertToISO(futuredate);
  
   let today = dayjs().format('YYYY-MM-DD');
  
  function data() {
	  
	  return{
		  beginDate : today,
	      dates:[],
	      hours[],
	      init(){
	        this.updateBeginDate();
	        produceHourData();
	      },
	      updateBeginDate(){
	          this.dates = this.generateDates(this.beginDate);
	      },
	      generateDates(beginDate){
	          let  result = [];
	          for (let i = 0; i < 7; i++) {
	            let date = dayjs(beginDate).add(i,'day');
	            result.push(date);
	      }
	          // console.log(result);
	          return result;
	     },
	     parseDayOfWeek(day){
	          let week = ['日','一','二','三','四','五','六']
	          return `(${week[day]})`
	     },
	     produceHourData() {   //產生小時列表
	            let firstTime = 8;
	            let lastTime = 21;
	            const firstDay = today;
	            this.dateEnd = firstDay.add(7, "day").format("YYYY-MM-DD");
	            
	            for (firstTime; firstTime <= lastTime; firstTime++) {           
	              this.hours.push(firstTime);
	            }
	            const data = {dateBegin:this.dateBegin , dateEnd:this.dateEnd}
	            
	            const self = this;
	            $.get("/TrainMe/TimeOff/get/" + ${LoginOK.id}, data,
	              function (data) {
//	             	 console.log("aaaaaa");
//	             	 console.log(data);
	            	self.closeHours = data;
	              },
	              "json"
	            );
	     }
	     
	     
	     
	     
	     
	  }
	
}



</script>
</html>