package _13_addfavorite.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _13_addfavorite.model.FavoriteBean;

@Repository
public class FavoriteDao {
	
	@Autowired
	SessionFactory factory;
	
	//收藏教練
	public void addFavorite(FavoriteBean fb) {
		Session session = factory.getCurrentSession();
		session.save(fb);
	}
	
	//查詢收藏教練列表
	@SuppressWarnings("unchecked")
	public List<FavoriteBean> getFavoriteList(int stId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FavoriteBean WHERE st_id = :stId";
		return session.createQuery(hql).setParameter("stId", stId).getResultList();
	}
	
	//取消收藏
	public void cancelFavorite(FavoriteBean fb) {
		Session session = factory.getCurrentSession();
		session.delete(fb);
	}

}
