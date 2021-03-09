package _10_studentCourse.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _07_memberInfo.service.StudentInfoService;
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
		model.addAttribute("comingSoonCourse", comingSoonCourse);
		model.addAttribute("waitCourse", waitCourse);
		model.addAttribute("beforeCourse", beforeCourse);
		
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

}
