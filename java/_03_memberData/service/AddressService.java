package _03_memberData.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _03_memberData.dao.AddressDao;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;

@Transactional
@Service
public class AddressService {
	
	@Autowired
	AddressDao addressDao;
	
	public List<City_H> listCities() {
		return addressDao.listCities();
	}
	
	public List<Area_H> listAreas(int cityId) {
		return addressDao.listAreas(cityId);
	}
}
