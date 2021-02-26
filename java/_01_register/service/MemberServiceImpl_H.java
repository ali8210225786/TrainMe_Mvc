package _01_register.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _00_init.util.HibernateUtils;
import _01_register.dao.MemberDaoImpl_H;
import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberService_H;

@Transactional
@Service
public class MemberServiceImpl_H implements MemberService_H {
	@Autowired
	SessionFactory factory;
	@Autowired
	MemberDaoImpl_H dao;

	public MemberServiceImpl_H() {
	}


	@Override
	public int saveStudent_H(StudentBean_H sb) {
		int n = 0;		
		n = dao.saveStudent_H(sb);
		n++;
		return n;
	}
	

	@Override
	public int saveTrainer_H(TrainerBean_H tr) {
		int n = 0;
		n = dao.saveTrainer_H(tr);
		return n;
	}

	@Override
	public boolean idExists_H(String email) {
		boolean exist = false;
		exist = dao.idExists_H(email);
		return exist;

	}


	@Override
	public MemberBean_H checkIdPassword_H(String email, String password) {
		MemberBean_H mb = null;
		mb = dao.checkIdPassword_H(email, password);	
		return mb;
	}

	@Override
	public List<StudentBean_H> listAll_H() {

		return dao.listAll_H();
	}

	@Override
	public List<GymBean_H> getGymList_H() {
		List<GymBean_H> gyms = new ArrayList<GymBean_H>();
		gyms = dao.getGymList_H();
		return gyms;

	}

	@Override
	public int checkverification_H(int gymId) {
		int n;
		n = dao.checkverification_H(gymId);
		return n;
	}

	@Override
	public MemberBean_H queryStudent_H(String id) {
		MemberBean_H mb = null;
		mb = dao.queryStudent_H(id);
		return mb;
	}

	@Override
	public boolean idNumberExists_H(String idNumber) {
		boolean exist = false;
		exist = dao.idNumberExists_H(idNumber);
		return exist;
	}

//	@Override
//	public StudentBean queryMember(String id) {
//		return dao.queryMember(id);
//	}
//
//	@Override
//	public void updateUnpaidOrderAmount(OrderBean ob) {
//		dao.updateUnpaidOrderAmount(ob);
//	}
//	public StudentBean checkIdPassword(String userId, String password) {
//		StudentBean mb = dao.checkIdPassword(userId, password);
//		return mb;
//	}
}
