package com.jiang.entity;

/**
 * course: N-->teacher ：1
 */
public class Course {

	private Integer cId;
	private String cName;
	private Teacher teacher;
	private String week;
	private String cTime;//课程时间
	private String cPlace;//课程地点

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	public String getcTime() {
		return cTime;
	}
	
	public void setcTime(String cTime) {
		this.cTime=cTime;
	}
	
	public String getcPlace() {
		return cPlace;
	}
	
	public void setcPlace(String cPlace) {
		this.cPlace=cPlace;
	}
	

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	@Override
	public String toString() {
		return "Course [cId=" + cId + ", cName=" + cName + ", teacher=" + teacher + ", week=" + week + ", cTime="
				+ cTime + ", cPlace=" + cPlace + "]";
	}
}
