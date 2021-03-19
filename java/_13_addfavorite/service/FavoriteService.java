package _13_addfavorite.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _13_addfavorite.dao.FavoriteDao;
import _13_addfavorite.model.FavoriteBean;

@Transactional
@Service
public class FavoriteService {
	
	@Autowired
	FavoriteDao favoriteDao;
	
	//收藏教練
	public void addFavorite(FavoriteBean fb) {
		favoriteDao.addFavorite(fb);
	}
	
	//查詢收藏教練列表
	public List<FavoriteBean> getFavoriteList(int stId) {
		return favoriteDao.getFavoriteList(stId);
	}
	
	//取消收藏
	public void cancelFavorite(FavoriteBean fb) {
		favoriteDao.cancelFavorite(fb);
	}

}
