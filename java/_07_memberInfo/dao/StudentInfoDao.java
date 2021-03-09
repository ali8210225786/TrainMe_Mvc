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
	
	
	
}
