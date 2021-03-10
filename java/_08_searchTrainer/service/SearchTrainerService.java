package _08_searchTrainer.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _08_searchTrainer.dao.SearchTrainerDao;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Transactional
@Service
public class SearchTrainerService {
	
	@Autowired
	SearchTrainerDao searchTrainerDao;

	public List<TrainerCourseBean_H> getTrainerCourseAll() {
		return searchTrainerDao.getTrainerCourseAll();
	}
	public List<SkillTypeBean_H> getSkillTypeAll() {
		return searchTrainerDao.getSkillTypeAll();
	}
	
	public List<TrainerCourseBean_H> getTrainerOfSkillType() {
		return searchTrainerDao.getTrainerOfSkillType();
	}
	
	
}
