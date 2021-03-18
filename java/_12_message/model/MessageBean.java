package _12_message.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
@Table(name="message")
public class MessageBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	private Date date;
	private String title;
	private String content;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_read;
	
	public MessageBean(Integer id, Date date, String title, String content, StudentBean_H studentBean,
			TrainerBean_H trainerBean, Integer is_read) {
		super();
		this.id = id;
		this.date = date;
		this.title = title;
		this.content = content;
		this.studentBean_H = studentBean;
		this.trainerBean_H = trainerBean;
		this.is_read = is_read;
	}
	
	public MessageBean() {
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public StudentBean_H getStudentBean() {
		return studentBean_H;
	}

	public void setStudentBean(StudentBean_H studentBean) {
		this.studentBean_H = studentBean;
	}

	public TrainerBean_H getTrainerBean() {
		return trainerBean_H;
	}

	public void setTrainerBean(TrainerBean_H trainerBean) {
		this.trainerBean_H = trainerBean;
	}

	public Integer getIs_read() {
		return is_read;
	}

	public void setIs_read(Integer is_read) {
		this.is_read = is_read;
	}
	
	
	
	
	

}
