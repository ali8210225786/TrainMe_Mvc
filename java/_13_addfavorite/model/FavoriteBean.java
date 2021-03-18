package _13_addfavorite.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;

@Entity
@Table(name="favorite")
public class FavoriteBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean;

}
