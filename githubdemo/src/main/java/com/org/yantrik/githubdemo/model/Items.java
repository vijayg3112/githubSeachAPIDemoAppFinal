package com.org.yantrik.githubdemo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Items {

	String name;
	String display_name;
	String short_description;
	String created_by;
	String released;
	String created_at;
	String updated_at;
	boolean featured;
	boolean curated;
	int score;
	
	

	public Items(String name, String display_name, String short_description, String created_by, String released,
			String created_at, String updated_at, boolean featured, boolean curated, int score) {
		super();
		this.name = name;
		this.display_name = display_name;
		this.short_description = short_description;
		this.created_by = created_by;
		this.released = released;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.featured = featured;
		this.curated = curated;
		this.score = score;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDisplay_name() {
		return display_name;
	}

	public void setDisplay_name(String display_name) {
		this.display_name = display_name;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	public String getReleased() {
		return released;
	}

	public void setReleased(String released) {
		this.released = released;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

	public boolean isFeatured() {
		return featured;
	}

	public void setFeatured(boolean featured) {
		this.featured = featured;
	}

	public boolean isCurated() {
		return curated;
	}

	public void setCurated(boolean curated) {
		this.curated = curated;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Items [name=" + name + ", display_name=" + display_name + ", short_description=" + short_description
				+ ", created_by=" + created_by + ", released=" + released + ", created_at=" + created_at
				+ ", updated_at=" + updated_at + ", featured=" + featured + ", curated=" + curated + ", score=" + score
				+ "]";
	}

}
