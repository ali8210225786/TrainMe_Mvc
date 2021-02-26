package _01_register.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import _01_register.model.GymBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberService_H;
import _02_login.model.LoginBean;


@Controller
public class RegisterController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	MemberService_H service;
	
	
	@GetMapping("/")
	public String index(Model model) {
		StudentBean_H studentBean = new StudentBean_H();
		TrainerBean_H trainerBean = new TrainerBean_H();
		LoginBean loginBean = new LoginBean();
							
		model.addAttribute("studentBean", studentBean);
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("loginBean", loginBean);
		
		return "index";
	}
	
	@ModelAttribute("sexMap")
	public void commonData (Model model) {
		Map<String, String> sexMap = new HashMap<>();
		List<GymBean_H> gymList = service.getGymList_H();
		sexMap.put("M", "男");  
		sexMap.put("F", "女");
		model.addAttribute("sexMap", sexMap);
		model.addAttribute("gymList", gymList);
	}
	

}
