package _08_searchTrainer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import _03_memberData.model.City_H;
import _03_memberData.service.AddressService;
import _08_searchTrainer.service.SearchTrainerService;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Controller
public class SearchTrainerController {
	
	@Autowired
	SearchTrainerService searchTrainerService;
	@Autowired
	AddressService addressService;
	@Autowired
	MemberService_H memberService;

	
	
	

	@GetMapping("/searchTrainer")
	public String SearchTrainer(Model model) {
		List<TrainerCourseBean_H> trainerCourseAll = searchTrainerService.getTrainerCourseAll();
		List<City_H> cities = addressService.listCities();
		Map<Integer, String> citiesMap = new HashMap<>();
		for (City_H city : cities) {
			citiesMap.put(city.getId(), city.getName());
		}
		List<SkillTypeBean_H> skillTypeAll = searchTrainerService.getSkillTypeAll();
		Map<Integer, String> skillTypeMap = new HashMap<>();
		for (SkillTypeBean_H skillType : skillTypeAll) {
			skillTypeMap.put(skillType.getId(), skillType.getName());
		}
		
//		StudentBean_H studentBean = new StudentBean_H();
//		TrainerBean_H trainerBean = new TrainerBean_H();
//		LoginBean loginBean = new LoginBean();
//		model.addAttribute("studentBean", studentBean);
//		model.addAttribute("trainerBean", trainerBean);
//		model.addAttribute("loginBean", loginBean);
		
		
		model.addAttribute("skillTypeMap", skillTypeMap);	
		model.addAttribute("cityList", citiesMap);	
		model.addAttribute("trainerCourseAll", trainerCourseAll);
		return "/_08_searchTrainer/search_trainer";
	}
	
	
//	@ModelAttribute
//	public void commonData(Model model) {
//		
//	}
	
//	@ModelAttribute
//	public void commonData(Model model) {
//
//		Map<String, String> sexMap = new HashMap<>();
//		Map<Integer, String> gymMap = new HashMap<>();
//		List<GymBean_H> gymList = memberService.getGymList_H();
//		for (GymBean_H gym : gymList) {
//			gymMap.put(gym.getId(), gym.getName());
//		}
//		sexMap.put("M", "男");
//		sexMap.put("F", "女");
//		model.addAttribute("sexMap", sexMap);
//		model.addAttribute("gymList", gymMap);
//	}
	
}
