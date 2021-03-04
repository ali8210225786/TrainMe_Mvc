package _04_money.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _00_init.util.GlobalService;
import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberService_H;
import _01_register.validate.StudentValidator;
import _01_register.validate.TrainerValidator;
import _02_login.model.LoginBean;
import _04_money.model.CardBean;
import _04_money.model.MoneyBean_H;
import _04_money.service.MemPointService;
import _04_money.validate.CardValidator;
import mail.model.SendingEmail;
import mail.service.MailService;

@Controller
@SessionAttributes({ "LoginOK","MoneyBean" }) // 此處有LoginOK的識別字串
public class MoneyController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MemPointService memPointService;

	@Autowired
	CardValidator cardValidator;
	

	@GetMapping("/studentMoney/{id}")
	public String studentMoney(Model model, @PathVariable("id") Integer id) {
		System.out.println("pig =" +id);
		List<MoneyBean_H> money =memPointService.getMoneyDetail(id);
		model.addAttribute("MoneyBean", money);
		return "/_04_money/st_point";
	}


	@GetMapping("/studentMoney/addPoint")
	public String addPoint(Model model) {
		
		
		return "/_04_money/st_add_point";
	}
	
	@GetMapping("/studentMoney/checkout")
	public String stCheckout(Model model) {
		CardBean cardBean=new CardBean();
		model.addAttribute("CardBean", cardBean);
		return "/_04_money/st_checkout";
	}
	

	@PostMapping("/studentMoney/checkout")
	public String stRegister(@ModelAttribute("cardBean") CardBean cardBean, BindingResult result,
			Model model, HttpServletRequest request) {
		System.out.println("進入/studentMoney/checkout");
//		cardValidator.validate(cardBean, result);
		
		return "/_04_money/st_point";
	}
	
}
