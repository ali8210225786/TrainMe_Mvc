package _04_money.dao;

import java.util.List;

import _04_money.model.MoneyBean_H;

public interface MemPointDao {

	
	public List <MoneyBean_H> getMoneyDetail(int id);
}
