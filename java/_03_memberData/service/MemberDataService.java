package _03_memberData.service;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _01_register.model.StudentBean_H;
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
		City_H city = addressService.getCityById(sb.getCity().getId());
		Area_H area = addressService.getAreaById(sb.getArea().getId());
		sb.setCity(city);
		sb.setArea(area);
		memberDataDao.updateStudent(sb);	
	}
	
	public StudentBean_H getStudentById(int id) {
		return memberDataDao.getStudentById(id);
	}
}