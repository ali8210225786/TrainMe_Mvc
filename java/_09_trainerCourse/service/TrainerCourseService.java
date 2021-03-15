package _09_trainerCourse.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _09_trainerCourse.dao.TrainerCourseDao;
import _09_trainerCourse.model.TrainerOffBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
@Transactional
@Service
public class TrainerCourseService {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	TrainerCourseDao trainerCourseDao;
	
	public void saveTimeOff(TrainerOffBean_H tob,int trId) {
		
		tob.setTrainerBean_H(trainerCourseDao.getTrainerById(trId));
		trainerCourseDao.saveTimeOff(tob);
	}
	
	public void deleteTimeOff(String dateBegin ,String dateEnd,int trId) {
		trainerCourseDao.deleteTimeOff(dateBegin, dateEnd, trId);
	}
	
	public List<String> queryTimeOffList(String dateBegin ,String dateEnd,int trId){
		return trainerCourseDao.queryTimeOffList(dateBegin, dateEnd, trId);
	}
	
	public List<String> queryBookedList(int trId) {
		List<String> list = new ArrayList<>();
		List<StudentCourseBean_H> bookedTimes = trainerCourseDao.getTrainerCourseById(trId);
		for(StudentCourseBean_H bookedTime : bookedTimes) {
			String bookedHour = bookedTime.getDate() + "_" + bookedTime.getTime();
//			System.out.println("============================="+bookedTime.getId());
			list.add(bookedHour);
		}	
		return list;
	}

	public List<StudentCourseBean_H> getTrainerCourseById(int trId){
		return trainerCourseDao.getTrainerCourseById(trId);
	}
	
		

}
