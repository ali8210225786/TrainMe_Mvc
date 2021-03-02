package _04_money.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _04_money.dao.impl.MemPointDaoImpl;
import _04_money.model.MoneyBean_H;
import _04_money.service.MemPointService;

@Service
public class MemPointServiceImpl implements MemPointService {

	
	@Autowired
	SessionFactory factory;
	@Autowired MemPointDaoImpl dao;
	
	@Transactional
	@Override
	public List<MoneyBean_H> getMoneyDetail(int id) {
	
		return dao.getMoneyDetail(id);
	}

}
