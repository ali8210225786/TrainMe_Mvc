package _07_memberInfo.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.Query;

import _01_register.model.StudentBean_H;
import _07_memberInfo.model.StudentDataBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _10_studentCourse.model.StudentCourseBean_H;

@Repository
public class StudentInfoDao {

	@Autowired
	SessionFactory factory;

	public void saveWeightData(StudentDataBean_H sdb) {
		Session session = factory.getCurrentSession();
		session.save(sdb);
	}

	public void updateWeightData(StudentDataBean_H sdb) {
		Session session = factory.getCurrentSession();
		session.update(sdb);
	}

	@SuppressWarnings("rawtypes")
	public StudentDataBean_H getStudentWeightDataByDateAndId(int id, Date date) {
		Session session = factory.getCurrentSession();
		String hql = "FROM StudentDataBean_H WHERE st_id = :mId AND data_date = :date";
			List sdb = session.createQuery(hql).setParameter("mId", id)
				.setParameter("date", date).getResultList();
		try {
			if (sdb.size() > 0) {
				return (StudentDataBean_H) sdb.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("StudentInfoDao類別getStudentWeightDataByDateAndId()發生例外: " + e.getMessage());
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<StudentDataBean_H> getStudentWeightData(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM StudentDataBean_H WHERE st_id = :mId ORDER BY data_date";
		return session.createQuery(hql).setParameter("mId", id).getResultList();
	}

}
