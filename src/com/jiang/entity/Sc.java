package com.jiang.entity;

public class Sc {
	private Integer scId;
	private Integer stuId;
	private Integer cId;
	private Double score;
	private String cName;
	private String cTime;
	private String cPlace;
	private String week;

	public Integer getScId() {
		return scId;
	}

	public void setScId(Integer scId) {
		this.scId = scId;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}
	
	public String getcTime() {
		return cTime;
	}

	public void setcTime(String cTime) {
		this.cTime = cTime;
	}

	public String getcPlace() {
		return cPlace;
	}

	public void setcPlace(String cPlace) {
		this.cPlace = cPlace;
	}
	

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	@Override
	public String toString() {
		return "Sc [scId=" + scId + ", stuId=" + stuId + ", cId=" + cId + ", score=" + score + ", cName=" + cName
				+ ", cTime=" + cTime + ", cPlace=" + cPlace + ", week=" + week + "]";
	}

	
	

}

