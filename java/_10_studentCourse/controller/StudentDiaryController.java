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
import _10_studentCourse.model.CourseDiaryItemBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;
import _10_studentCourse.service.StudentDiaryService;

@Controller
@SessionAttributes({ "LoginOK", "beforeCourse","CourseMsg", "StudentCourse","CourseDiaryItem" })
public class StudentDiaryController {

	
	@Autowired
	StudentDiaryService studentDiaryService;

	@GetMapping("/st_Course_diary/{id}")
	public String stDiary(Model model, @PathVariable("id") Integer id) {
//		System.out.println("==================okkkkkkkkkkkkkkkkk");
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		
		StudentCourseBean_H CourseMsg = studentDiaryService.getCourseMsg(id);
		List<CourseDiaryItemBean_H> diaryItem = studentDiaryService.getDiaryItem(id);
		model.addAttribute("CourseMsg", CourseMsg);
		model.addAttribute("CourseDiaryItem", diaryItem);
		
//		CourseMsg.getDatdiary_content()
		return "/_10_studentCourse/st_Course_diary";
	}
	
	
	}


