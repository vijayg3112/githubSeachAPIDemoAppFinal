package com.org.yantrik.githubdemo.model;

public class SearchParameter {

	private String startdatetimepicker;
	private String enddatetimepicker;

	public String getStartdatetimepicker() {
		return startdatetimepicker;
	}

	public void setStartdatetimepicker(String startdatetimepicker) {
		this.startdatetimepicker = startdatetimepicker;
	}

	public String getEnddatetimepicker() {
		return enddatetimepicker;
	}

	public void setEnddatetimepicker(String enddatetimepicker) {
		this.enddatetimepicker = enddatetimepicker;
	}

	@Override
	public String toString() {
		return "SearchParameter [startdatetimepicker=" + startdatetimepicker + ", enddatetimepicker="
				+ enddatetimepicker + "]";
	}

}
