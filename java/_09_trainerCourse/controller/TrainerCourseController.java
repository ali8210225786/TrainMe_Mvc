package _09_trainerCourse.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import java.util.List;
import java.util.Set;

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

import _01_register.model.StudentBean_H;
import _01_register.service.MemberServiceImpl_H;
import _01_register.service.MemberService_H;
import _09_trainerCourse.model.CloseHour;
import _09_trainerCourse.model.TrainerOffBean_H;
import _09_trainerCourse.service.TrainerCourseService;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;

@Controller
@SessionAttributes({ "LoginOK", "StudentCourse", "Now", "type"})
public class TrainerCourseController {

	@Autowired
	TrainerCourseService trainerCourseService;
	
	@Autowired
	StudentCourseService studentCourseService;
	

	@GetMapping("/TimeOff/{id}")
	public String timeOff(Model model) {
		return "/_09_trainerCourse/timeOff";
	}

	@GetMapping("/TimeOff/get/{id}")
	public @ResponseBody List<String> getTimeOff(@PathVariable("id") Integer id, @RequestParam String dateBegin,
			@RequestParam String dateEnd) {
		List<String> timeOff = trainerCourseService.queryTimeOffList(dateBegin, dateEnd, id);
		return timeOff;
	}

	@PostMapping("/TimeOff/update/{id}")
	public String updateTimeOff(@PathVariable("id") Integer id, @RequestParam String data) {
//		System.out.println(data);
		CloseHour closeHour = (new Gson()).fromJson(data, CloseHour.class);
//		System.out.println(closeHour);

		trainerCourseService.deleteTimeOff(closeHour.getDateBegin(), closeHour.getDateEnd(), id);

		for (String hour : closeHour.getCloseHour()) {
			String[] closeHourArr = hour.split("_");
			System.out.println(closeHourArr[0] + "===>" + closeHourArr[1]);
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

	@GetMapping("/trainerCourse/{id}")
	public String getTrainerCourse(Model model, @PathVariable("id") Integer id) {
		java.util.Date now = new java.util.Date();
		Date nowDate = new Date(now.getTime());
		List<StudentCourseBean_H> scSet = trainerCourseService.getTrainerCourseById(id);
		model.addAttribute("StudentCourse", scSet);
		model.addAttribute("Now", nowDate);
		return "/_09_trainerCourse/tr_course";
	}

	@GetMapping("/CancelStudentCourse/{id}")
	public String cancelCourse(Model model, @PathVariable("id") Integer id,
			@RequestParam("courseId") String courseIdStr, 
			@RequestParam("type") String type) {

		int courseId = Integer.parseInt(courseIdStr);
		studentCourseService.cancelCourse(courseId);
		System.out.println("type="+type);
		model.addAttribute("type",type);
		return "redirect:/trainerCourse/"+id;
	}
	
	@GetMapping("/CheckStudent/{id}")
	public @ResponseBody String checkMyStudent(@PathVariable("id") Integer stId) {
		System.out.println("================================!!!!!!!!!!!!!!!1");
		return trainerCourseService.getStudentById(stId);
	}
	
	
	@GetMapping("/AllowStudentCourse/{id}")
	public String allowCourse(Model model, @PathVariable("id") Integer id,
			@RequestParam("courseId") String courseIdStr, 
			@RequestParam("type") String type) {

		int courseId = Integer.parseInt(courseIdStr);
		studentCourseService.allowCourse(courseId); ;
		System.out.println("type="+type);
		model.addAttribute("type",type);
		return "redirect:/trainerCourse/"+id;
	}

}
