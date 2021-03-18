package _12_message.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _12_message.model.MessageBean;

@Repository
public class MessageDao {

	@Autowired
	SessionFactory factory;
	
	public void addMessage(MessageBean messageBean) {
		Session session = factory.getCurrentSession();
		session.save(messageBean);
	}
}
