package _12_message.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _12_message.dao.MessageDao;
import _12_message.model.MessageBean;

@Transactional
@Service
public class MessageService {
	
	@Autowired
	MessageDao messageDao;
	
	//通過驗證後通知
	public void passVerification(MemberBean_H mb) {
		MessageBean msg = new MessageBean();
		msg.setTitle("【TrainMe通知】 歡迎加入TrainMe!");
		msg.setContent("親愛的會員你好，TrainMe 希望帶你認識更多好教練，趕快填好個人資料，一起運動吧!");
		msg.setIs_read(0);
		if (mb instanceof TrainerBean_H) {
			TrainerBean_H tb = (TrainerBean_H) mb;
			msg.setTrainerBean_H(tb);
			msg.setToType(2);
		}
		if (mb instanceof StudentBean_H) {
			StudentBean_H sb = (StudentBean_H) mb;
			msg.setStudentBean_H(sb);
			msg.setToType(1);
		}
		
		messageDao.addMessage(msg);		
	}
	
	//學員預約課程通知(給教練)
	//學員預約課程通知(給學員)
	
	
	//學員取消課程通知(給教練)
	//教練同意課程通知(給學員)
	//教練不同意課程通知(給學員)
	
	//學員儲值成功通知(給學員)
	
	//收藏教練通知(給教練)-再說
	
	
	

}
