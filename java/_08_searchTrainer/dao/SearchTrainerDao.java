package _08_searchTrainer.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.TrainerBean_H;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Repository
public class SearchTrainerDao {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerCourseAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H group by trainerBean_H";
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerOfSkillType() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H group by trainerBean_H,skill_typeBean_H";
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<SkillTypeBean_H> getSkillTypeAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SkillTypeBean_H";
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> searchTrainerByCondition(int cityId, int skillTypeId ) {
		Session session = factory.getCurrentSession();										   
		String hql = "FROM TrainerCourseBean_H as tc WHERE tc.trainerBean_H.city.id = :cityId "
				   + "AND tc.skill_typeBean_H.id = :skillTypeId GROUP BY tc.trainerBean_H.id";
		List<TrainerCourseBean_H> a = session.createQuery(hql).setParameter("cityId", cityId)
											 .setParameter("skillTypeId", skillTypeId).getResultList();
		return a;
		
	
	}
	
}
