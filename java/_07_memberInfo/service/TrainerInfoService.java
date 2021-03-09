package _07_memberInfo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _07_memberInfo.dao.TrainerInfoDao;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Transactional
@Service
public class TrainerInfoService {
	
	@Autowired
	TrainerInfoDao trainerInfoDao;
	
	public List<TrainerCourseBean_H> getTrainerCourse(int trId) {
		return trainerInfoDao.getTrainerCourse(trId);
	}
	
	public List<TrainerCourseBean_H> getTrainerCourseSkillType(int trId) {
		return trainerInfoDao.getTrainerCourseSkillType(trId);
	}
	
}
