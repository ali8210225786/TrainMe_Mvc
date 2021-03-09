package _07_memberInfo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _09_trainerCourse.model.TrainerCourseBean_H;

@Repository
public class TrainerInfoDao {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerCourse(int trId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H WHERE tr_id = :mtrId";
		
		return session.createQuery(hql).setParameter("mtrId", trId).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerCourseSkillType(int trId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT DISTINCT skill_typeBean_H FROM TrainerCourseBean_H WHERE tr_id = :mtrId";
		
		return session.createQuery(hql).setParameter("mtrId", trId).getResultList();
	}
	
	
}
