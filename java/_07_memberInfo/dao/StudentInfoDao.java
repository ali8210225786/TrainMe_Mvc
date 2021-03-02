package _07_memberInfo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.StudentBean_H;

@Repository
public class StudentInfoDao {

	@Autowired
	SessionFactory factory;
	
	public void updateBody(StudentBean_H sb) {
		Session session = factory.getCurrentSession();
		session.update(sb);
	}
	
	
}
