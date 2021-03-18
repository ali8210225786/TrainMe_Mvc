package _04_money.service;

import java.util.List;

import _01_register.model.StudentBean_H;
import _04_money.model.MoneyBean_H;
import _04_money.model.TrainerAccountBean_H;

public interface MemPointService {

	public List<MoneyBean_H> getStudentMoneyDetail(int id);

	public List<MoneyBean_H> getTrainerMoneyDetail(int id);

	public List<TrainerAccountBean_H> getAccountDetail(int id);

	int saveMoney(MoneyBean_H moneyBean_H);

	public int saveStudentRefund(MoneyBean_H moneyBean_H);

	public int saveTrainerRefund(MoneyBean_H moneyBean_H);
	
	public int saveStudentCourseToMoney(MoneyBean_H moneyBean_H);
}
