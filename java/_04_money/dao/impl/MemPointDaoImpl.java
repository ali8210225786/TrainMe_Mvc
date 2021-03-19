package _04_money.dao.impl;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _00_init.util.DBService;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _04_money.dao.MemPointDao;
import _04_money.model.MoneyBean_H;
import _04_money.model.TrainerAccountBean_H;

@Repository
public class MemPointDaoImpl implements MemPointDao{
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public List <MoneyBean_H> getStudentMoneyDetail(int id) {
		
		String hql = "FROM MoneyBean_H WHERE st_id = :stid ORDER BY change_time";
		Session session = factory.getCurrentSession();
		
		@SuppressWarnings("unchecked")
		List <MoneyBean_H> mb = session.createQuery(hql).setParameter("stid", id).getResultList();
	
		System.out.println("mb.size()= "+mb.size());
		return mb;
	}
	
	@Override
	public List <MoneyBean_H> getTrainerMoneyDetail(int id) {
		
		String hql = "FROM MoneyBean_H WHERE tr_id = :trid ORDER BY change_time";
		Session session = factory.getCurrentSession();
		
		@SuppressWarnings("unchecked")
		List <MoneyBean_H> mb = session.createQuery(hql).setParameter("trid", id).getResultList();
	
		System.out.println("mb.size()= "+mb.size());
		return mb;
	}
	
	@Override
	public List <TrainerAccountBean_H> getAccountDetail(int id) {
		
		String hql = "FROM TrainerAccountBean_H WHERE tr_id = :trid ORDER BY time";
		Session session = factory.getCurrentSession();
		
		@SuppressWarnings("unchecked")
		List <TrainerAccountBean_H> ta = session.createQuery(hql).setParameter("trid", id).getResultList();
	
		System.out.println("mb.size()= "+ta.size());
		
		return ta;
	}

	//學員新增點數資料
	@Override
	public int saveMoney(MoneyBean_H moneyBean_H) {
		int n = 0;
		Session session = factory.getCurrentSession();
//		session.merge (sb);
		session.clear();
//		session.evict(session.get(StudentBean_H.class, moneyBean_H.getStudentBean_H().getId()));
//		session.merge(moneyBean_H.getStudentCourseBean_H().getStudentBean_H());
		session.save(moneyBean_H);
		n++;
		return n;
	}

	
	//學員更新點數資料
		@Override
		public int updateMoney(MoneyBean_H moneyBean_H) {
			int n = 0;
			Session session = factory.getCurrentSession();
			session.clear();
//			session.merge(session.get(StudentBean_H.class, moneyBean_H.getStudentBean_H().getId()));
			session.update(moneyBean_H);
			n++;
			return n;
		}
		
	//搜尋最新一筆的學員儲值紀錄
		@Override
		public MoneyBean_H getStudentMoneyLast(int stId) {
			Session session = factory.getCurrentSession();
			
			String hql = "SELECT MAX(id) FROM MoneyBean_H WHERE st_id =:stId";
			int lastId = (int) session.createQuery(hql).setParameter("stId", stId).getSingleResult();
			String hql2 = "FROM MoneyBean_H WHERE id =" + lastId;
			return (MoneyBean_H) session.createQuery(hql2).getSingleResult();
		}


	//教練新增點數資料
//	@Override
//	public int saveRefund(MoneyBean_H moneyBean_H) {
//		StudentBean_H sb = moneyBean_H.getStudentBean_H();
//		int n = 0;
//		Session session = factory.getCurrentSession();
//		session.clear();
//		session.save(moneyBean_H);
//		n++;
//		return n;
//	}



}
