package _04_money.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _02_login.model.LoginBean;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;
import _03_memberData.service.AddressService;
import _03_memberData.service.MemberDataService;
import _04_money.model.CardBean;
import _04_money.model.MoneyBean_H;
import _04_money.service.MemPointService;
import _04_money.validate.CardValidator;
import _12_message.service.MessageService;


@Controller
@SessionAttributes({ "LoginOK", "MoneyBean", "cardBean", "cityList", "areaList", "st_unreadMessage","abc" }) // 此處有LoginOK的識別字串
public class MoneyController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MemPointService memPointService;

	@Autowired
	CardValidator cardValidator;

	@Autowired
	AddressService addressService;
	
	@Autowired
	MemberDataService memberDataService;
	
	@Autowired
	MessageService messageService;

	@GetMapping("/studentMoney/{id}")
	public String studentMoney(Model model, @PathVariable("id") Integer id) {
		System.out.println("pig =" + id);
		List<MoneyBean_H> money = memPointService.getStudentMoneyDetail(id);
		model.addAttribute("MoneyBean", money);
		return "/_04_money/st_point";
	}

//	public static AllInOne all;
//	@SuppressWarnings("static-access")
//	@GetMapping("/studentMoney/addPoint")
//	public String addPoint(Model model) {
//		LoginBean a = new LoginBean();
//		ExampleAllInOne e = new ExampleAllInOne();
//		ExampleAllInOne.initial();
//		String abc = e.genAioCheckOutALL();
//		a.setPassword(abc);
//		model.addAttribute("abc", a);
////		return "/_04_money/st_add_point";
//		return "/_01_register/NewFile";
//	}
	
	

	@GetMapping("/studentMoney/checkout")
	public String stCheckout(Model model) {
		CardBean cardBean = new CardBean();
//		if (cardBean.getCity() != null) {
//			List<Area_H> areas = addressService.listAreas(cardBean.getCity().getId());
//			Map<Integer, String> areaMap = new HashMap<>();
//			for (Area_H area : areas) {
//				areaMap.put(area.getId(), area.getName());
//			}
//			model.addAttribute("areaList", areaMap);
//		}
		model.addAttribute("cardBean", cardBean);
		return "/_04_money/st_checkout";
			    
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/studentMoney/checkout")
	public String stRegister(@ModelAttribute("cardBean") CardBean cardBean, BindingResult result, Model model, HttpServletRequest request) {
		System.out.println("進入/studentMoney/checkout");
		
		cardValidator.validate(cardBean, result);
		if (result.hasErrors()) {
			errorResponseSt(cardBean, model);

			return "/_04_money/st_checkout";

		}
		
		MoneyBean_H moneyBean_H = new MoneyBean_H();
		
		StudentBean_H studentBean_H =(StudentBean_H) model.getAttribute("LoginOK");
		moneyBean_H.setStudentBean_H(studentBean_H);
		Date date = new Date();
		java.sql.Date changeTime = new java.sql.Date(date.getTime());
		moneyBean_H.setChange_time(changeTime);
		System.out.println("cardBean.getMoney()="+cardBean.getMoney());
		
		moneyBean_H.setChange_amount(cardBean.getMoney());
		
		memPointService.saveMoney(moneyBean_H);
		
		//產生儲值成功通知並更新未讀訊息數量
		MoneyBean_H mb = memPointService.getStudentMoneyLast(studentBean_H.getId());
		messageService.storedValueMsg(mb);
		Long unreadMessage =  messageService.unreadMessage(studentBean_H.getId(), studentBean_H.getType());
		model.addAttribute("st_unreadMessage", unreadMessage);
		
		return "redirect:/studentMoney/"+studentBean_H.getId();
	}

	@GetMapping("/getareaList")
	public @ResponseBody List<Area_H> getAreaList(Model model, @RequestParam Integer cityId) {
		List<Area_H> areas = addressService.listAreas(cityId);

		return areas;
	}

	@ModelAttribute
	public void commonData(Model model) {
		List<City_H> cities = addressService.listCities();
		Map<Integer, String> citiesMap = new HashMap<>();
		for (City_H city : cities) {
			citiesMap.put(city.getId(), city.getName());
		}
		model.addAttribute("cityList", citiesMap);

	}

	public void errorResponseSt(CardBean cardBean, Model model) {
		TrainerBean_H trainerBean = new TrainerBean_H();
		LoginBean loginBean = new LoginBean();
//		studentBean.setHasError(true);

	}
}
