package _03_memberData.service;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.dao.MemberDataDao;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;

@Transactional
@Service
public class MemberDataService {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	MemberDataDao memberDataDao;
	
	@Autowired
	AddressService addressService;
	
	public void updateStudent(StudentBean_H sb) {
		if(sb.getCity() != null && sb.getArea() != null) {
		City_H city = addressService.getCityById(sb.getCity().getId());
		Area_H area = addressService.getAreaById(sb.getArea().getId());
		sb.setCity(city);
		sb.setArea(area);
		}
		memberDataDao.updateStudent(sb);	
	}
	
	public StudentBean_H getStudentById(int id) {
		return memberDataDao.getStudentById(id);
	}
	
	public void updateTrainer(TrainerBean_H tb) {
		if(tb.getCity() != null && tb.getArea() != null) {
			City_H city = addressService.getCityById(tb.getCity().getId());
			Area_H area = addressService.getAreaById(tb.getArea().getId());
			tb.setCity(city);
			tb.setArea(area);
		}
		memberDataDao.updateTrainer(tb);	
	}
	
	public TrainerBean_H getTrainerById(int id) {
		return memberDataDao.getTrainerById(id);
	}
}
