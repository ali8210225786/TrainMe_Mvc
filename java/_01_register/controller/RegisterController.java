package _01_register.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _00_init.util.GlobalService;
import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberService_H;
import _01_register.validate.StudentValidator;
import _01_register.validate.TrainerValidator;
import _02_login.model.LoginBean;
import mail.model.SendingEmail;
import mail.service.MailService;


@Controller
@SessionAttributes({"LoginOK"}) // 此處有LoginOK的識別字串
public class RegisterController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	MemberService_H memberService ;
	
	
	@Autowired
	StudentValidator st_validator;
	
	@Autowired
	TrainerValidator tr_validator;
	
	@Autowired
	MailService mailService ;
	
	
	@GetMapping("/")
	public String index(Model model) {
		StudentBean_H studentBean = new StudentBean_H();
		TrainerBean_H trainerBean = new TrainerBean_H();
		LoginBean loginBean = new LoginBean();
		model.addAttribute("studentBean",studentBean);
		model.addAttribute("trainerBean",trainerBean);
		model.addAttribute("loginBean",loginBean);
		
		return "index";
	}
	
//	// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
	// 學員註冊
	@PostMapping("/st_register")   
	public String stRegister(@ModelAttribute("studentBean") StudentBean_H studentBean
			, BindingResult result
			, Model model
			, HttpServletRequest request) {
		TrainerBean_H trainerBean = new TrainerBean_H();
		LoginBean loginBean = new LoginBean();
		
		// 呼叫Validate進行資料檢查
		st_validator.validate(studentBean, result);
		if (result.hasErrors()) {
			errorResponseSt(studentBean, model);
			
		}
		studentBean.setPassword(GlobalService.getMD5Endocing(
				GlobalService.encryptString(studentBean.getPassword())));
		
		// 檢查 email是否重複
		if (memberService.idExists_H(studentBean.getEmail())) {
			result.rejectValue("email", "", "帳號已存在，請重新輸入");
			errorResponseSt(studentBean, model);
			
		}
		
		// 檢查身分證是否已經存在
		if (memberService.idNumberExists_H(studentBean.getId_number())) {
			result.rejectValue("id_number", "", "此身分證已經使用過囉");
			errorResponseSt(studentBean, model);
			
		}
		
		try {
			// 檢查無錯誤
			
			Random theRandom = new Random();
			theRandom.nextInt(999999);
			studentBean.setHash( DigestUtils.md5Hex("" +	theRandom) );
			studentBean.setType(1);
			studentBean.setVerification(0);
			studentBean.setIs_delete(0);
			memberService.saveStudent_H(studentBean);
		} 
		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("email", "", "發生異常，請通知系統人員..." + ex.getMessage());
			errorResponseSt(studentBean, model);
			
		}
		
		// 寄驗證信
		SendingEmail se = new SendingEmail(1 ,studentBean.getEmail(), studentBean.getHash());
		se.sendMail();
		
		model.addAttribute("studentBean",new StudentBean_H());
		model.addAttribute("trainerBean",trainerBean);
		model.addAttribute("loginBean",loginBean);
		return "index";
	}
	
	// 當有錯誤時的處理 - 學員
	public String errorResponseSt(StudentBean_H studentBean, Model model) {
		TrainerBean_H trainerBean = new TrainerBean_H();
		LoginBean loginBean = new LoginBean();
		studentBean.setHasError(true);
		model.addAttribute("trainerBean",trainerBean);
		model.addAttribute("loginBean",loginBean);
		return "index";
	}
	
	
//	// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
	// 教練註冊
	@PostMapping("/tr_register")
	public String trRegister(@ModelAttribute("trainerBean") TrainerBean_H trainerBean
			, BindingResult result
			, Model model
			, HttpServletRequest request) {
		StudentBean_H studentBean = new StudentBean_H();
		LoginBean loginBean = new LoginBean();
		
		// 呼叫Validate進行資料檢查
		tr_validator.validate(trainerBean, result);
		if (result.hasErrors()) {
			errorResponseTr(trainerBean, model);
			
		}
		trainerBean.setPassword(GlobalService.getMD5Endocing(
				GlobalService.encryptString(trainerBean.getPassword())));
		
		// 檢查 email是否重複
		if (memberService.idExists_H(trainerBean.getEmail())) {
			result.rejectValue("email", "", "帳號已存在，請重新輸入");
			errorResponseTr(trainerBean, model);
			
		}
		
		// 檢查身分證是否已經存在
		if (memberService.idNumberExists_H(trainerBean.getId_number())) {
			result.rejectValue("id_number", "", "此身分證已經使用過囉");
			errorResponseTr(trainerBean, model);
			
		}
		
		try {
			// 檢查無錯誤
			
			Random theRandom = new Random();
			theRandom.nextInt(999999);
			trainerBean.setHash( DigestUtils.md5Hex("" +	theRandom) );
			trainerBean.setType(2);
			trainerBean.setVerification(0);
			trainerBean.setIs_delete(0);
			memberService.saveTrainer_H(trainerBean);
		} 
		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("email", "", "發生異常，請通知系統人員..." + ex.getMessage());
			errorResponseTr(trainerBean, model);
			
		}
		
		// 寄驗證信
		SendingEmail se = new SendingEmail(2 ,trainerBean.getEmail(), trainerBean.getHash());
		se.sendMail();
		
		model.addAttribute("trainerBean",new TrainerBean_H());
		model.addAttribute("studentBean",studentBean);
		model.addAttribute("loginBean",loginBean);
		return "index";
	}
	
	// 當有錯誤時的處理 - 教練
	public String errorResponseTr(TrainerBean_H trainerBean, Model model) {
		StudentBean_H studentBean = new StudentBean_H();
		LoginBean loginBean = new LoginBean();
		trainerBean.setHasError(true);
		model.addAttribute("studentBean",studentBean);
		model.addAttribute("loginBean",loginBean);
		return "index";
	}
	
	// 驗證信
	@GetMapping("/ActivateAccount")
	public String activate(HttpServletRequest request,Model model) {
		
		String type = request.getParameter("key");
		String email = request.getParameter("key1");
		String hash = request.getParameter("key2");
		
		try {
			mailService.changeVerification(type,email, hash);			
			System.out.println("YAAAAAAAAAAAAAAAAAAAAa");
		} catch (Exception e) {
			e.printStackTrace();
			return index(model);
		}
		System.out.println("Account Successfully Verified.");
		
		return index(model);
		
	}
	
//	@PostMapping()
//	public String Login(
//			@ModelAttribute("loginBean") LoginBean loginBean,
//			BindingResult result, Model model,
//			HttpServletRequest request, HttpServletResponse response) {
//		
//		String password =loginBean.getPassword();
//		MemberBean_H mb = null;
//		try {
//			mb = memberService.checkIdPassword_H(loginBean.getUserEmail(),GlobalService.getMD5Endocing(GlobalService.encryptString(password)));
//			if (mb != null) {
//				// OK, 登入成功, 將mb物件放入Session範圍內，識別字串為"LoginOK"
//				model.addAttribute("LoginOK", mb);
//			} else {
//				// NG, 登入失敗, userid與密碼的組合錯誤，放相關的錯誤訊息到 errorMsgMap 之內
//				result.rejectValue("invalidCredentials", "", "該帳號不存在或密碼錯誤");
//				errorResponseLg( loginBean,  model);
//			}
//			
//		} catch (RuntimeException ex) {
//			result.rejectValue("invalidCredentials", "", ex.getMessage());
//			ex.printStackTrace();
//			return loginForm;
//		}
//		HttpSession session = request.getSession();
//		processCookies(bean, request, response);
//		String nextPath = (String)session.getAttribute("requestURI");
//		if (nextPath == null) {
//			nextPath = request.getContextPath();
//		}
//		
//	
//		return "";
//	}
	
	// 當有錯誤時的處理 - 登入
		public String errorResponseLg(LoginBean loginBean, Model model) {
			StudentBean_H studentBean = new StudentBean_H();
			TrainerBean_H trainerBean = new TrainerBean_H();
			loginBean.setHasError(true);
			model.addAttribute("studentBean",studentBean);
			model.addAttribute("trainerBean",trainerBean);
			return "index";
		}
	

	
	@ModelAttribute
	public void commonData (Model model) {
		
		Map<String, String> sexMap = new HashMap<>();
		Map<Integer, String> gymMap = new HashMap<>();
		List<GymBean_H> gymList = memberService.getGymList_H();
		for(GymBean_H gym : gymList) {
			gymMap.put(gym.getId(), gym.getName());
		}
		sexMap.put("M", "男");  
		sexMap.put("F", "女");
		model.addAttribute("sexMap", sexMap);
		model.addAttribute("gymList", gymMap);
	}
	

}
