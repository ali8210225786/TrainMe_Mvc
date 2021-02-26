package _01_register.service;

import java.util.List;

import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;



public interface MemberService_H {
	boolean idExists_H(String email);
	boolean idNumberExists_H(String idNumber);
	int checkverification_H(int gymId);
	int saveStudent_H(StudentBean_H sb);
	int saveTrainer_H(TrainerBean_H tr);
	boolean checkPass(int type , String email );

	MemberBean_H queryStudent_H(String id);
	MemberBean_H checkIdPassword_H(String email, String password) ;
	
	List<StudentBean_H> listAll_H();
	List<GymBean_H> getGymList_H();

	
}
