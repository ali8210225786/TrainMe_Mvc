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
	public List <MoneyBean_H> getMoneyDetail(int id) {
		
		String hql = "FROM MoneyBean_H WHERE st_id = :stid ORDER BY change_time";
		Session session = factory.getCurrentSession();
		
		@SuppressWarnings("unchecked")
		List <MoneyBean_H> mb = session.createQuery(hql).setParameter("stid", id).getResultList();
	
		System.out.println("mb.size()= "+mb.size());
//		System.out.println("MoneyBean.get(0).student_course_id ="+mb.get(0).getStudentCourseBean_H().getTrainerCourseBean_H().getSkillBean_H().getName() );
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

	@Override
	public int saveMoney(MoneyBean_H moneyBean_H) {
		StudentBean_H sb = new StudentBean_H();
		int n = 0;
		Session session = factory.getCurrentSession();
//		session.merge (sb);
		session.clear();
		session.save(moneyBean_H);
		n++;
		return n;
	}
	
	
//	public List <CourseBean> getCourseDetail(int id) {
//		CourseBean coursebean=null;
////		String sql="SELECT  FROM student_course WHERE st_id= ? ";
////		String sql1="SELECT  FROM student_course sc JOIN trainer_course tc ON sc.trainer_course_id=tc.id  WHERE st_id=?";
//		String sql2="SELECT t.name, s.name, sc.date, sc.is_allowed, tc.price, sc.is_executed FROM student_course sc JOIN trainer_course tc ON sc.trainer_course_id=tc.id JOIN trainer t ON tc.tr_id=t.id JOIN skill s ON tc.sk_id=s.id WHERE st_id=?";
////		String sql3="SELECT m.*, t.name, s.name, sc.date, sc.is_allowed, tc.price, sc.is_executed FROM money m JOIN student_course sc ON m.student_course_id =sc.id JOIN trainer_course tc ON sc.trainer_course_id=tc.id JOIN trainer t ON tc.tr_id=t.id JOIN skill s ON tc.sk_id=s.id  WHERE st_id=? ORDER BY change_time";
//		List <CourseBean> items=new ArrayList<>();
//		try (Connection con = ds.getConnection(); 
//				PreparedStatement ps = con.prepareStatement(sql2);
//				
//				) {
//			ps.setInt(1, id);
//			try (ResultSet rs = ps.executeQuery();
//					) {
//				while (rs.next()) {
//					coursebean = new CourseBean();
//					coursebean.setDate(rs.getDate("date"));
//					coursebean.setTainerName(rs.getString("t.name"));
//					coursebean.setSkill(rs.getString("s.name"));
//					coursebean.setIsAllowed(rs.getInt("sc.is_allowed"));
//					coursebean.setPrice(rs.getInt("tc.price"));
//					coursebean.setIsExecuted(rs.getInt("sc.is_executed"));
//					
//					items.add(coursebean);
//				}
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("MemDataDao���O#cityList()�o��SQL�ҥ~: " + ex.getMessage());
//		}
//		return items;
//	}
	
//	public int saveMoney(MoneyBean mb) {
//		String sql = "insert into Money " + " (id, target_id, change_time, "
//				+ " change_amount,  total_amount, student_course_id)" + " values (null, ?, ?, ?, ?, ?)";
//		int n = 0;
//		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
//
//			ps.setInt(1, mb.getTargetId());
////			ps.setInt(2, mb.getType());
//			ps.setDate(2, (Date) mb.getChangeTime());
//			ps.setInt(3, mb.getChangeAmount());
//			ps.setInt(4, mb.getTotal());
//			ps.setInt(5, mb.getStudebtCourseId());
//
//			n = ps.executeUpdate();
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("StudentDaoImpl_Jdbc類別#saveMember()發生例外: " + ex.getMessage());
//		}
//		return n;
//	}
}
