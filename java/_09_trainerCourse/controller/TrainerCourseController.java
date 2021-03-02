package _09_trainerCourse.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.protobuf.TextFormat.ParseException;

import _09_trainerCourse.model.TrainerOffBean_H;
import _09_trainerCourse.service.TrainerCourseService;

@Controller
@SessionAttributes({"LoginOK"})
public class TrainerCourseController {
	
	@Autowired
	TrainerCourseService trainerCourseService;
	
	@GetMapping("/TimeOff/{id}")
	public String timeOff(Model model) {
		return "/_09_trainerCourse/timeOff";
	}
	
	@GetMapping("/TimeOff/get/{id}")
	public @ResponseBody List<String> getTimeOff(
			@PathVariable("id") Integer id,
			@RequestParam String dateBegin,
			@RequestParam String dateEnd) {
		List<String> timeOff = trainerCourseService.queryTimeOffList(dateBegin, dateEnd, id);
		return timeOff;
	}
	
	@PostMapping("/TimeOff/update/{id}")
	public String updateTimeOff(
			@PathVariable("id") Integer id,
			@RequestParam String data) {
//		System.out.println(data);
		CloseHour closeHour = (new Gson()).fromJson(data, CloseHour.class);
//		System.out.println(closeHour);
		
		trainerCourseService.deleteTimeOff(closeHour.getDateBegin(), closeHour.getDateEnd(), id);
		
		for(String hour : closeHour.getCloseHour()) {
			String[] closeHourArr = hour.split("_");
			System.out.println(closeHourArr[0]+"===>"+closeHourArr[1]);
			Date date = null;
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dateX = sdf.parse(closeHourArr[0]);
				date = new Date(dateX.getTime());
			
			} catch (Exception e) {
				e.getMessage();
			}
			
			TrainerOffBean_H tob = new TrainerOffBean_H(null, null, date, Integer.parseInt(closeHourArr[1]));
			trainerCourseService.saveTimeOff(tob, id);
			
		}
		
		
		
		return "redirect:/TimeOff/" + id;
	}

}
