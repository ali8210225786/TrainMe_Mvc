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
	
		RatingsBean_H ratingsBean = new RatingsBean_H(null, studentCourseBean.getStudentBean_H(), studentCourseBean.getTrainerCourseBean_H().getTrainerBean_H(), starsVal, feedback, studentCourseBean);
		
		studentCourseService.addFeedback(ratingsBean);
		
		// 頁面跳轉改用jquery的post方法跳轉,這邊return的其實不會有反應,但反正要寫就對ㄌ
		
		return "redirect:/st_info_lesson/" + id;
	}

}
