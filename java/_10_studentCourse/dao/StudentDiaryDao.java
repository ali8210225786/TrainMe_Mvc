package _10_studentCourse.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _10_studentCourse.model.CourseDiaryItemBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
@Repository
public class StudentDiaryDao {
	
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public StudentCourseBean_H getCourseMsg(int id) {
		Session session = factory.getCurrentSession();
		StudentCourseBean_H courses = new StudentCourseBean_H();
		String hql = "FROM StudentCourseBean_H WHERE id = :mId";
		courses =  (StudentCourseBean_H) session.createQuery(hql).setParameter("mId", id).getSingleResult();		
		return courses;		
	}
	
	@SuppressWarnings("unchecked")
	public List<CourseDiaryItemBean_H>  getDiaryItem(int id) {
		Session session = factory.getCurrentSession();
		List<CourseDiaryItemBean_H> courses = new LinkedList<>();
		String hql = "FROM CourseDiaryItemBean_H WHERE course_id = :mId";
		courses =   session.createQuery(hql).setParameter("mId", id).getResultList();;		
		return courses;		
	}
	
}