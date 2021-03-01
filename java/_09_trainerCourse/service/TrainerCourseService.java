package _09_trainerCourse.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _09_trainerCourse.dao.TrainerCourseDao;
import _09_trainerCourse.model.TrainerOffBean_H;

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

	
	
		

}
