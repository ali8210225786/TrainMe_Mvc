package _10_studentCourse.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import _01_register.model.StudentBean_H;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;
import _03_memberData.model.TrainerLicenseBean_H;
import _10_studentCourse.dao.StudentCourseDao;
import _10_studentCourse.dao.StudentDiaryDao;
import _10_studentCourse.model.CourseDiaryItemBean_H;
import _10_studentCourse.model.StudentCourseBean_H;

@Transactional
@Service
public class StudentDiaryService {
	@Autowired
	StudentDiaryDao studentDiaryDao;

	public StudentCourseBean_H getCourseMsg(int id) {
		return studentDiaryDao.getCourseMsg(id);
	}
	public List<CourseDiaryItemBean_H>  getDiaryItem(int id) {
	
		return studentDiaryDao.getDiaryItem(id);
	}
	
//	public int saveTrainerLicenseBean_H(TrainerLicenseBean_H tl) {
//		int n = 0;		
//		n = dao.saveTrainerLicenseBean_H(tl);
//		n++;
//		return n;
//	}
	public void updateStudentCourseDatDiaryContent(StudentCourseBean_H scb) {
	
		studentDiaryDao.updateStudentCourseDatDiaryContent(scb);
	}
}



