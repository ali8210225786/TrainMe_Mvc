package _10_studentCourse.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberServiceImpl_H;
import _01_register.service.MemberService_H;
import _03_memberData.service.MemberDataService;
import _04_money.model.MoneyBean_H;
import _04_money.service.MemPointService;
import _07_memberInfo.service.StudentInfoService;
import _09_trainerCourse.model.RatingsBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;

@SessionAttributes({ "LoginOK", "comingSoonCourse", "waitCourse", "beforeCourse", "type" })
@Controller
public class StudentCourseController {

	@Autowired
	StudentInfoService studentInfoService;
	
	@Autowired
	StudentCourseService studentCourseService;	
	
	@Autowired
	MemPointService memPointService;
	
	@Autowired
	MemberService_H memberService;
	
	@Autowired
	MemberDataService memberDataService;

	@GetMapping("/st_info_lesson/{id}")
	public String stLesson(Model model, @PathVariable("id") Integer id) {
//		System.out.println("==================okkkkkkkkkkkkkkkkk");
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		List<StudentCourseBean_H> comingSoonCourse = studentCourseService.getComingSoonCourseAll(id, nowDate);
		List<StudentCourseBean_H> waitCourse = studentCourseService.getWaitCourse(id, nowDate);
		List<StudentCourseBean_H> beforeCourse = studentCourseService.getBeforeCourse(id, nowDate);
		List<RatingsBean_H> ratings = studentCourseService.getRatings();
		
		
		
		
		model.addAttribute("comingSoonCourse", comingSoonCourse);
		model.addAttribute("waitCourse", waitCourse);
		model.addAttribute("beforeCourse", beforeCourse);
		model.addAttribute("ratings", ratings);
		
		
		
		return "_10_studentCourse/st_info_lesson";
	}
	
	@GetMapping("/CancelCourseLesson/{id}")
	public String cancelCourse(
			@PathVariable("id") Integer id, 
			@RequestParam("courseId") String courseIdStr, 
			@RequestParam("type") String type, 
			Model model) {
		int courseId = Integer.parseInt(courseIdStr);
		studentCourseService.cancelCourse(courseId);
		MoneyBean_H moneyBean_H=new MoneyBean_H();
		StudentCourseBean_H sc=studentCourseService.getStudentCourse(courseId);
		if(type.equals("comingSoon")) {

			StudentBean_H studentBean_H =(StudentBean_H) model.getAttribute("LoginOK");
			moneyBean_H.setStudentBean_H(studentBean_H);
			Date date = new Date();
			java.sql.Date changeTime = new java.sql.Date(date.getTime());
			moneyBean_H.setChange_time(changeTime);
			moneyBean_H.setChange_amount(sc.getTrainerCourseBean_H().getPrice());
//			moneyBean_H.setStudentCourseBean_H(sc);
			memPointService.saveRefund(moneyBean_H);
		}
		System.out.println(type);
		model.addAttribute("type",type);
		return "redirect:/st_info_lesson/"+id;
	}
	
	@GetMapping("/st_feedback/{courseId}")
	public String feedback(
			@PathVariable("courseId") Integer courseId,
			Model model
			) {
		StudentCourseBean_H studentCourseBean_H = studentCourseService.getStudentCourse(courseId);
		model.addAttribute("studentCourseBean_H",studentCourseBean_H);
		return "_10_studentCourse/st_feedback";
	}
	
	@PostMapping("/addfeedback/{id}")
	public String addfeedback(
			@PathVariable("id") Integer id, 
			@RequestParam("starsVal") Integer starsVal,
			@RequestParam("feedback") String feedback,
			@RequestParam("studentCourseId") Integer studentCourseId
			) {
		StudentCourseBean_H studentCourseBean = studentCourseService.getStudentCourse(studentCourseId);
		TrainerBean_H trainerBean_H = memberDataService.getTrainerById(studentCourseBean.getTrainerCourseBean_H().getTrainerBean_H().getId());
		
		studentCourseBean.setIs_rated(1);
		
		RatingsBean_H ratingsBean = new RatingsBean_H(null, studentCourseBean.getStudentBean_H(), studentCourseBean.getTrainerCourseBean_H().getTrainerBean_H(), starsVal, feedback, studentCourseBean);
		
		studentCourseService.addFeedback(ratingsBean);
		
		List<RatingsBean_H> ratinglist = memberDataService.getTrainerRatings(studentCourseBean.getTrainerCourseBean_H().getTrainerBean_H().getId());	
		
		Double total=0.0;
		for (int i = 0; i < ratinglist.size(); i++) {
			total+= ratinglist.get(i).getPoint();
		}
	
		if(ratinglist.size() == 0) {
		Double avg = ((total) / 1.0);
		trainerBean_H.setRatings(avg);
		trainerBean_H.setRatings_size(ratinglist.size());;
		}else {
		Double avg = ((total) / (double)(ratinglist.size()));
		trainerBean_H.setRatings(avg);
		trainerBean_H.setRatings_size(ratinglist.size());;
		}
		
		memberDataService.updateTrainer(trainerBean_H);
		
		// 頁面跳轉改用jquery的post方法跳轉,這邊return的其實不會有反應,但反正要寫就對ㄌ
		
		return "redirect:/st_info_lesson/" + id;
	}
}


