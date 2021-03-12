package _10_studentCourse.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _10_studentCourse.dao.StudentCourseDao;
import _10_studentCourse.model.StudentCourseBean_H;

@Transactional
@Service
public class StudentCourseService {
	
	@Autowired
	StudentCourseDao studentCourseDao;

	
	public List<StudentCourseBean_H> getComingSoonCourse(int id , Date nowDate){
		
		   Calendar cal = Calendar.getInstance();
		   cal.setTime(nowDate);
		   cal.add(Calendar.DATE, 7);		   
		   java.sql.Date endDate = new java.sql.Date(cal.getTimeInMillis());
		   
		return studentCourseDao.getComingSoonCourse(id, nowDate, endDate);
	}
	
	public List<StudentCourseBean_H> getComingSoonCourseAll(int id , Date nowDate) {
		return studentCourseDao.getComingSoonCourseAll(id, nowDate);
	}
	
	public List<StudentCourseBean_H> getWaitCourse(int id, Date nowDate){
		return studentCourseDao.getWaitCourse(id, nowDate);
	}
	
	public List<StudentCourseBean_H> getBeforeCourse(int id, Date nowDate) {
		return studentCourseDao.getBeforeCourse(id, nowDate);
	}
	
	public void cancelCourse(int courseId) {
		studentCourseDao.cancelCourse(courseId);
	}
	
	public void allowCourse(int courseId) {
		studentCourseDao.allowCourse(courseId);
	}
	
}
