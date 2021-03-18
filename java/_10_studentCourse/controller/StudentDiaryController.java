package _10_studentCourse.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.model.TrainerLicenseBean_H;
import _07_memberInfo.service.StudentInfoService;
import _10_studentCourse.model.CourseDiaryItemBean_H;
import _10_studentCourse.model.CourseDiaryItemBean_VO;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;
import _10_studentCourse.service.StudentDiaryService;

@Controller
@SessionAttributes({ "LoginOK", "beforeCourse","CourseMsg", "StudentCourse","CourseDiaryItem" })
public class StudentDiaryController {

	
	@Autowired
	StudentDiaryService studentDiaryService;

	@GetMapping("/trainer_Course_diary/{id}")
	public String trDiary(@ModelAttribute("courseDiaryItemBean_VO")CourseDiaryItemBean_VO courseDiaryItemBean_VO, Model model, @PathVariable("id") Integer id) {
//		System.out.println("==================okkkkkkkkkkkkkkkkk");
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		
		StudentCourseBean_H CourseMsg = studentDiaryService.getCourseMsg(id);
		List<CourseDiaryItemBean_H> diaryItem = studentDiaryService.getDiaryItem(id);
		model.addAttribute("CourseMsg", CourseMsg);
		model.addAttribute("CourseDiaryItem", diaryItem);
		model.addAttribute("CourseDiaryItemBean_VO",new CourseDiaryItemBean_VO());
//		CourseMsg.getDatdiary_content()
		return "/_10_studentCourse/trainer_Course_diary";
	}
	
	@GetMapping("/student_Course_diary/{id}")
	public String stDiary(Model model, @PathVariable("id") Integer id) {
//		System.out.println("==================okkkkkkkkkkkkkkkkk");
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		
		StudentCourseBean_H CourseMsg = studentDiaryService.getCourseMsg(id);
		List<CourseDiaryItemBean_H> diaryItem = studentDiaryService.getDiaryItem(id);
		model.addAttribute("CourseMsg", CourseMsg);
		model.addAttribute("CourseDiaryItem", diaryItem);
		
//		CourseMsg.getDatdiary_content()
		return "/_10_studentCourse/student_Course_diary";
	}
	
	@PostMapping("/updateStudentCourseDatDiaryContent/{id}")
	public String updateStudentCourseDatDiaryContent(@ModelAttribute("courseDiaryItemBean_VO") CourseDiaryItemBean_VO newBean, Model model,
			@PathVariable("id") Integer id, HttpServletRequest request) throws IOException, ServletException {
		
		newBean.getAction();
		StudentCourseBean_H CourseMsg = studentDiaryService.getCourseMsg(id);

//		System.out.println("=========================>" + newBean.getCity().getId());
		CourseMsg.setDatdiary_content(newBean.getDatdiary_content());

		studentDiaryService.updateStudentCourseDatDiaryContent(CourseMsg);
		
		return "redirect:/trainer_Course_diary/" + id;
	}
	
//	 @PostMapping("/addCourseDiaryItem")
//	 public String addCourseDiaryItem(@RequestParam("lsname") String lsname, @RequestParam("trainerBeanId") int trainerBeanId) {
//	 CourseDiaryItemBean_H courseDiaryItemBean_H = new CourseDiaryItemBean_H();
//	 StudentCourseBean_H CourseMsg = studentDiaryService.getCourseMsg(trainerBeanId);
//	 courseDiaryItemBean_H.setAction(lsname);
//	 courseDiaryItemBean_H.setLord(lsname);
//	 courseDiaryItemBean_H.setReps(lsname);
//	 courseDiaryItemBean_H.setRest(lsname);
//	 courseDiaryItemBean_H.setSets(lsname);
//	 courseDiaryItemBean_H.setStudentCourseBean_H(CourseMsg);
//	 memberService.saveTrainerLicenseBean_H(trainerLicenseBean_H);
//	 return "redirect:/tr_info_account/" + trainerBeanId;
//	 }
	}


