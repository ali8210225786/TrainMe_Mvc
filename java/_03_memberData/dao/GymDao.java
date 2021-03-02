package _03_memberData.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GymDao {

	@Autowired
	SessionFactory sessionFactory;

	public GymDao() {
	}
	
	public String getGymName(int gymId) {
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT name from GymBean_H WHERE id = :gymId";
		
		return (String) session.createQuery(hql)
					           .setParameter("gymId", gymId)
				               .getSingleResult();
	}

}
