package _08_searchTrainer.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Repository
public class SearchTrainerDao {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerCourseAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H";
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<SkillTypeBean_H> getSkillTypeAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SkillTypeBean_H";
		return session.createQuery(hql).getResultList();
	}
	
}
