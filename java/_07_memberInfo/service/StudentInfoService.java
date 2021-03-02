package _07_memberInfo.service;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Transactional
@Service
public class StudentInfoService {

	@Autowired
	SessionFactory factory;
}
