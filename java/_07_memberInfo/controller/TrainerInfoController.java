package _07_memberInfo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.GymBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.model.TrainerLicenseBean_H;
import _03_memberData.service.GymService;
import _03_memberData.service.MemberDataService;
import _07_memberInfo.service.TrainerInfoService;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _09_trainerCourse.service.TrainerCourseService;

@SessionAttributes({"LoginOK"})
@Controller
public class TrainerInfoController {
	
	@Autowired
	MemberDataService memberDataService;
	@Autowired
	GymService gymService;
	@Autowired
	TrainerInfoService trainerInfoService;
	

	@GetMapping("/trainer_info/{id}")
	public String TrainerInfo(Model model,
			@PathVariable("id") Integer id) {
		TrainerBean_H trainerBean = memberDataService.getTrainerById(id);		
		GymBean_H gym =  gymService.getGym(trainerBean.getGym().getId());
		List<TrainerCourseBean_H> trainerCourses = trainerInfoService.getTrainerCourse(id);
		List<TrainerCourseBean_H> trainerCoursesSkillType = trainerInfoService.getTrainerCourseSkillType(id);
		List<TrainerLicenseBean_H> trainerLicenseBean = memberDataService.getTrainerLicenseAll(id);
		
		model.addAttribute("trainerLicenseBean", trainerLicenseBean);
		model.addAttribute("trainerCoursesSkillType", trainerCoursesSkillType);
		model.addAttribute("trainerCourses", trainerCourses);
		model.addAttribute("gym", gym);
		model.addAttribute("trainerBean", trainerBean);
		return "/_07_memberInfo/trainer_info";
	}
	
}
