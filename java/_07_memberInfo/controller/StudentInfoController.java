package _07_memberInfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.StudentBean_H;
import _03_memberData.service.MemberDataService;
import _07_memberInfo.service.StudentInfoService;

@Controller
@SessionAttributes({ "LoginOK" }) // 此處有LoginOK的識別字串
public class StudentInfoController {
	
	@Autowired
	StudentInfoService studentInfoService;
	
	@Autowired
	MemberDataService memberDataService;
	
	@GetMapping("/student_info/{id}")
	public String StudentInfo(Model model,
			@PathVariable("id") Integer id) {
		
		StudentBean_H studentBean = memberDataService.getStudentById(id);
		int age = studentInfoService.calAge(studentBean.getBirthday());
		model.addAttribute("age", age);
		
		return "/_07_student_info/student_info";
	}
	
	@GetMapping("/student_info_edit/{id}")
	public String studentInfoEdit(Model model, 
			@PathVariable("id") Integer id) {
		StudentBean_H studentBean = memberDataService.getStudentById(id);
		model.addAttribute("studentBean", studentBean);
		System.out.println("aaaaa");
		return "/_07_student_info/student_info_edit";
	}
	
	@PostMapping("/student_bodyData_update/{id}")
	public String studentBodyDataUpdate(
			Model model, 
			@PathVariable("id") Integer id,
			@RequestParam String heigth,
			@RequestParam String weight,
			@RequestParam String activity
			) {
		
		System.out.println("okkkkkkk");
		System.out.println("==============" +heigth+"==============" +weight+"=============="+activity);
		return "/_07_student_info/student_info";
	}
	
//	@ModelAttribute
//	public void getStudent(Model model, @PathVariable("id") Integer id) {
//		StudentBean_H studentBean = memberDataService.getStudentById(id);
//	}
	
}
