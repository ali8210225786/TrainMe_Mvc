package _04_money.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.StudentBean_H;
import _04_money.dao.impl.MemPointDaoImpl;
import _04_money.model.CardBean;
import _04_money.model.MoneyBean_H;
import _04_money.model.TrainerAccountBean_H;
import _04_money.service.MemPointService;

@Service
public class MemPointServiceImpl implements MemPointService {

	@Autowired
	SessionFactory factory;
	@Autowired
	MemPointDaoImpl dao;

	@Transactional
	@Override
	public List<MoneyBean_H> getMoneyDetail(int id) {

		return dao.getMoneyDetail(id);
	}

	@Transactional
	@Override
	public List<TrainerAccountBean_H> getAccountDetail(int id) {
		return dao.getAccountDetail(id);
	}

	@Transactional
	@Override
	public int saveMoney(MoneyBean_H moneyBean_H) {

//		System.out.println(LoginOK.id);
		if(moneyBean_H.getChange_amount()==3000) {
			moneyBean_H.setChange_amount(3030);
		}
		if(moneyBean_H.getChange_amount()==5000) {
			moneyBean_H.setChange_amount(5050);
		}
		if(moneyBean_H.getChange_amount()==7000) {
			moneyBean_H.setChange_amount(7100);
		}
		if(moneyBean_H.getChange_amount()==10000) {
			moneyBean_H.setChange_amount(10200);
		}
		int size = dao.getMoneyDetail(moneyBean_H.getStudentBean_H().getId()).size();
		int total = dao.getMoneyDetail(moneyBean_H.getStudentBean_H().getId()).get(size-1).getTotal_amount()
				+ moneyBean_H.getChange_amount();
		moneyBean_H.setTotal_amount(total);
		
		
		return dao.saveMoney(moneyBean_H);
//		return 1;
	}

}
