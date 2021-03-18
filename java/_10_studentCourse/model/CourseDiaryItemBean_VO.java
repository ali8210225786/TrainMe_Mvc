package _10_studentCourse.model;

public class CourseDiaryItemBean_VO {

	private Integer cdi_id;
	private StudentCourseBean_H studentCourseBean_H;
	private String action;
	private String lord;
	private String reps;
	private String sets;
	private String rest;
	private String datdiary_content;
	
	
	
	public CourseDiaryItemBean_VO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CourseDiaryItemBean_VO(Integer cdi_id, StudentCourseBean_H studentCourseBean_H, String action, String lord,
			String reps, String sets, String rest, String datdiary_content) {
		super();
		this.cdi_id = cdi_id;
		this.studentCourseBean_H = studentCourseBean_H;
		this.action = action;
		this.lord = lord;
		this.reps = reps;
		this.sets = sets;
		this.rest = rest;
		this.datdiary_content = datdiary_content;
	}
	public Integer getCdi_id() {
		return cdi_id;
	}
	public void setCdi_id(Integer cdi_id) {
		this.cdi_id = cdi_id;
	}
	public StudentCourseBean_H getStudentCourseBean_H() {
		return studentCourseBean_H;
	}
	public void setStudentCourseBean_H(StudentCourseBean_H studentCourseBean_H) {
		this.studentCourseBean_H = studentCourseBean_H;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getLord() {
		return lord;
	}
	public void setLord(String lord) {
		this.lord = lord;
	}
	public String getReps() {
		return reps;
	}
	public void setReps(String reps) {
		this.reps = reps;
	}
	public String getSets() {
		return sets;
	}
	public void setSets(String sets) {
		this.sets = sets;
	}
	public String getRest() {
		return rest;
	}
	public void setRest(String rest) {
		this.rest = rest;
	}
	public String getDatdiary_content() {
		return datdiary_content;
	}
	public void setDatdiary_content(String datdiary_content) {
		this.datdiary_content = datdiary_content;
	}

	
	
}
