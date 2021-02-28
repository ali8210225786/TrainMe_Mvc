package _03_memberData.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.StudentBean_H;
import _03_memberData.model.City_H;
import _03_memberData.service.AddressService;

@Controller
@SessionAttributes({ "LoginOK" }) // 此處有LoginOK的識別字串
public class StudentDataContoller {
	
	@Autowired
	ServletContext servletContext;

	@Autowired
	AddressService addressService;
	
	@GetMapping("/studentData")
	public String studentData(Model model) {
//		StudentBean_H studentBean = new StudentBean_H();
//		model.addAttribute("studentBean", studentBean);
		return "/_03_memberData/studentData";
	}
	
//	@GetMapping("/areaList")
//	public void getAreaList(Model model, HttpServletRequest request) {
//		int cityId = Integer.parseInt(request.getParameter("cityId"));
//		List<Area_H> areas = addressService.listAreas(cityId);
//		Map<Integer, String> areaMap = new HashMap<>();
//		for(Area_H area : areas) {
//			areaMap.put(area.getId(), area.getName());
//		}
//		model.addAttribute("areaList", areaMap);
//	}
	
	@ModelAttribute
	public void commonData(Model model){
		List<City_H> cities = addressService.listCities();
		Map<Integer, String> citiesMap = new HashMap<>();
		for (City_H city : cities) {
			citiesMap.put(city.getId(), city.getName());
		}
		model.addAttribute("cityList", citiesMap);
	}
}
