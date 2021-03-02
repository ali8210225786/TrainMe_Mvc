package _07_memberInfo.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Transactional
@Service
public class StudentInfoService {

	@Autowired
	SessionFactory factory;

	public Integer calAge(Date birth) {


		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Taipei"));
		int nowYear = cal.get(Calendar.YEAR);
		cal.setTime(birth);
		int birthYear = cal.get(Calendar.YEAR);
		int age = nowYear - birthYear;
		
		return age;
	}
}
