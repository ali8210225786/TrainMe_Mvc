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
import _01_register.service.MemberService_H;
import _03_memberData.service.MemberDataService;
import _04_money.service.MemPointService;
import _08_searchTrainer.service.SearchTrainerService;
import _09_trainerCourse.model.CloseHour;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _09_trainerCourse.model.TrainerOffBean_H;
import _09_trainerCourse.service.TrainerCourseService;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;
import mail.model.SendingAcceptEmail;
import mail.model.SendingRejectedEmail;

@Controller
@SessionAttributes({ "LoginOK", "StudentCourse", "Now", "type" })
public class TrainerCourseController {

	@Autowired
	TrainerCourseService trainerCourseService;

	@Autowired
	StudentCourseService studentCourseService;

	@Autowired
	SearchTrainerService searchTrainerService;

	@Autowired
	MemberDataService memberDataService;

	@GetMapping("/TimeOff/{id}")
	public String timeOff(Model model) {
		return "/_09_trainerCourse/timeOff";
	}

	@GetMapping("/courseSet/{id}")
	public String courseSet(Model model) {
		List<SkillTypeBean_H> skillTypeAll = searchTrainerService.getSkillTypeAll();
		model.addAttribute("skillTypeAll", skillTypeAll);
		return "/_09_trainerCourse/tr_lesson_set";
	}

	@GetMapping("/TimeOff/getClosed/{id}")
	public @ResponseBody List<String> getTimeOff(@PathVariable("id") Integer id, @RequestParam String dateBegin,
			@RequestParam String dateEnd) {
		List<String> timeOff = trainerCourseService.queryTimeOffList(dateBegin, dateEnd, id);
		return timeOff;
	}

	@GetMapping("/TimeOff/getBooked/{id}")
	public @ResponseBody List<String> getBooked(@PathVariable("id") Integer id) {
		List<String> BookedTimes = trainerCourseService.queryBookedList(id);
		return BookedTimes;
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

	@GetMapping("/CancelStudentCourse/{trid}/{stid}")
	public String cancelCourse(Model model, @PathVariable("trid") Integer trid, @PathVariable("stid") Integer stid,
			@RequestParam("courseId") String courseIdStr, 
			@RequestParam("type") String type) {
		int courseId = Integer.parseInt(courseIdStr);
		String stId = String.valueOf(stid);
		StudentBean_H sb = memberDataService.getStudentById(stid);
		
		//寄拒絕預約的信
		StudentCourseBean_H sc=studentCourseService.getStudentCourse(courseId);
		SendingRejectedEmail rejectedEmail=new SendingRejectedEmail(sb.getEmail(), sb.getName(), stId ,sc);
		rejectedEmail.sendingRejectedEmail();
		
		studentCourseService.cancelCourse(courseId);
		System.out.println("type=" + type);
		model.addAttribute("type", type);
		return "redirect:/trainerCourse/" + trid;
	}

	@GetMapping("/AllowStudentCourse/{trid}/{stid}")
	public String allowCourse(Model model, @PathVariable("trid") Integer trid, @PathVariable("stid") Integer stid,
			@RequestParam("courseId") String courseIdStr,
			@RequestParam("type") String type) {
		StudentBean_H sb = memberDataService.getStudentById(stid);
		String id = String.valueOf(stid);
		int courseId = Integer.parseInt(courseIdStr);
		
		//寄同意信
		StudentCourseBean_H sc=studentCourseService.getStudentCourse(courseId);
		SendingAcceptEmail acceptEmail = new SendingAcceptEmail(sb.getEmail(), sb.getName(), id ,sc);
		acceptEmail.sendAcceptMail();
		
		studentCourseService.allowCourse(courseId);
		System.out.println("type=" + type);
		model.addAttribute("type", type);
		return "redirect:/trainerCourse/" + trid;
	}

}
