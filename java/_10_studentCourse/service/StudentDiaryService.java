package _10_studentCourse.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _10_studentCourse.dao.StudentCourseDao;
import _10_studentCourse.dao.StudentDiaryDao;
import _10_studentCourse.model.CourseDiaryItemBean_H;
import _10_studentCourse.model.StudentCourseBean_H;

@Transactional
@Component
public class StudentDiaryService {
	@Autowired
	StudentDiaryDao studentDiaryDao;

	public StudentCourseBean_H getCourseMsg(int id) {
		return studentDiaryDao.getCourseMsg(id);
	}
	public List<CourseDiaryItemBean_H>  getDiaryItem(int id) {
	
		return studentDiaryDao.getDiaryItem(id);
	}
}



