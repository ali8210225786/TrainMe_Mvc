package _03_memberData.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;

@Repository
public class MemberDataDao {
	
	@Autowired
	SessionFactory factory;

	public void updateStudent(StudentBean_H sb) {
		Session session = factory.getCurrentSession();
		session.update(sb);
	}
	
	public StudentBean_H getStudentById(int id) {
		Session session = factory.getCurrentSession();
		return session.get(StudentBean_H.class, id);
		
	}
	
	public void updateTrainer(TrainerBean_H tb) {
		Session session = factory.getCurrentSession();
		session.update(tb);
	}
	
	public TrainerBean_H getTrainerById(int id) {
		Session session = factory.getCurrentSession();
		return session.get(TrainerBean_H.class, id);
		
	}
}
