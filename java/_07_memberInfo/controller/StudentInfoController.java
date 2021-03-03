package _07_memberInfo.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.StudentBean_H;
import _03_memberData.service.MemberDataService;
import _07_memberInfo.model.StudentDataBean_H;
import _07_memberInfo.service.StudentInfoService;

@Controller
@SessionAttributes({ "LoginOK","MoneyBean" }) // 此處有LoginOK的識別字串
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
		if(studentBean.getHeigth() != null && studentBean.getWeight() != null) {
			
			double BMI = studentInfoService.calBMI(studentBean);
			double BMR = studentInfoService.calBMR(studentBean);
			double TDEE = studentInfoService.calTDEE(studentBean);
			model.addAttribute("BMI", BMI);
			model.addAttribute("BMR", BMR);
			model.addAttribute("TDEE", TDEE);
		}
		
		model.addAttribute("LoginOK", studentBean);
		return "/_07_student_info/student_info";
	}
	
	@GetMapping("/student_info_edit/{id}")
	public String studentInfoEdit(Model model, 
			@PathVariable("id") Integer id) {
		StudentBean_H studentBean = memberDataService.getStudentById(id);
		model.addAttribute("studentBean", studentBean);
		return "/_07_student_info/student_info_edit";
	}
	
	@PostMapping("/student_bodyData_update/{id}")
	public String studentBodyDataUpdate(
			@ModelAttribute("studentBean") StudentBean_H newBean,
			Model model, 
			@PathVariable("id") Integer id
			) {
		StudentBean_H oldBean = memberDataService.getStudentById(id);
		oldBean.setHeigth(newBean.getHeigth());
		oldBean.setWeight(newBean.getWeight());
		oldBean.setActivity(newBean.getActivity());	
		oldBean.setIntroduction(newBean.getIntroduction());		
		studentInfoService.updateBodyData(oldBean);
		
		Date now = new Date( );
		java.sql.Date Date = new java.sql.Date(now.getTime());
		StudentDataBean_H studentDataBean = new StudentDataBean_H(id, oldBean, Date, newBean.getWeight());
		studentInfoService.saveWeightData(studentDataBean);
		
		return "redirect:/student_info/"+id;
	}
	
//	@ModelAttribute
//	public void commonData(Model model) {
//	
//	}
	
}
