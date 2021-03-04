package _07_memberInfo.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.StudentBean_H;
import _07_memberInfo.model.StudentDataBean_H;
import _10_studentCourse.model.StudentCourseBean_H;

@Repository
public class StudentInfoDao {

	@Autowired
	SessionFactory factory;
	
	
	public void saveWeightData(StudentDataBean_H sdb) {
		Session session = factory.getCurrentSession();
		session.save(sdb);
	}
	
	@SuppressWarnings("unchecked")
	public List<StudentCourseBean_H> getComingSoonCourse(int id , Date nowDate, Date endDate) {
		Session session = factory.getCurrentSession();
		List<StudentCourseBean_H> courses = new ArrayList<>();
		String hql = "FROM StudentCourseBean_H WHERE is_allowed = 1 and date BETWEEN '" 
				   + nowDate + "' and '" + endDate + "' and st_id = :mId ORDER BY date";
		courses = session.createQuery(hql).setParameter("mId", id).getResultList();
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<StudentCourseBean_H> getWaitCourse(int id, Date nowDate) {
		Session session = factory.getCurrentSession();
		List<StudentCourseBean_H> courses = new ArrayList<>();
		String hql = "FROM StudentCourseBean_H WHERE is_allowed = 0 and date > :nowDate and st_id = :mId ORDER BY date";
		courses = session.createQuery(hql).setParameter("nowDate", nowDate).setParameter("mId", id).getResultList();
		return courses;
	}
	
}
