package _04_money.service;

import java.util.List;

import _01_register.model.StudentBean_H;
import _04_money.model.MoneyBean_H;
import _04_money.model.TrainerAccountBean_H;

public interface MemPointService {

	public List<MoneyBean_H> getMoneyDetail(int id);

	public List<TrainerAccountBean_H> getAccountDetail(int id);

	int saveMoney(MoneyBean_H moneyBean_H);
}
