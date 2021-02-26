package _10_studentCourse.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import _01_register.model.StudentBean_H;
import _04_money.model.MoneyBean_H;
import _09_trainerCourse.model.RatingsBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Entity
@Table(name="Student_course_H")
public class StudentCourseBean_H implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Date date;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	private Integer time;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_executed;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_delete;
	private String datdiary_content;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_allowed;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="trainer_course_id")
	private TrainerCourseBean_H trainerCourseBean_H;
	
	@OneToMany(mappedBy = "studentCourseBean_H")
	private Set<CourseDiaryItemBean_H> courseDiaryItemBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "studentCourseBean_H")
	private Set<MoneyBean_H> moneyBean_H = new LinkedHashSet<>();
	
	@OneToOne(mappedBy = "studentCourseBean_H")
	RatingsBean_H ratingsBean_H;

	public StudentCourseBean_H(StudentBean_H studentBean_H, Integer tr_id, Date date, Integer time
			, Integer is_executed, Integer is_delete, String datdiary_content,
			Integer is_allowed, TrainerCourseBean_H trainerCourseBean_H) {
		super();
		this.studentBean_H = studentBean_H;
		this.id = tr_id;
		this.date = date;
		this.time = time;
		this.is_executed = is_executed;
		this.is_delete = is_delete;
		this.datdiary_content = datdiary_content;
		this.is_allowed = is_allowed;
		this.trainerCourseBean_H = trainerCourseBean_H;
	}

	public StudentCourseBean_H() {
		super();
		
	}

	public StudentBean_H getStudentBean_H() {
		return studentBean_H;
	}

	public void setStudentBean_H(StudentBean_H studentBean_H) {
		this.studentBean_H = studentBean_H;
	}

	public Integer getTr_id() {
		return id;
	}

	public void setTr_id(Integer id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getTime() {
		return time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}


	public Integer getIs_executed() {
		return is_executed;
	}

	public void setIs_executed(Integer is_executed) {
		this.is_executed = is_executed;
	}

	public Integer getIs_delete() {
		return is_delete;
	}

	public void setIs_delete(Integer is_delete) {
		this.is_delete = is_delete;
	}

	public String getDatdiary_content() {
		return datdiary_content;
	}

	public void setDatdiary_content(String datdiary_content) {
		this.datdiary_content = datdiary_content;
	}

	public Integer getIs_allowed() {
		return is_allowed;
	}

	public void setIs_allowed(Integer is_allowed) {
		this.is_allowed = is_allowed;
	}

	public TrainerCourseBean_H getTrainerCourseBean_H() {
		return trainerCourseBean_H;
	}

	public void setTrainerCourseBean_H(TrainerCourseBean_H trainerCourseBean_H) {
		this.trainerCourseBean_H = trainerCourseBean_H;
	}
	
}
