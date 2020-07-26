package com.org.yantrik.githubdemo.model;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserSearchHistory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String username;
	private String userType;
	private String searchquery;
	private String results;
	private LocalDateTime date;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getSearchquery() {
		return searchquery;
	}

	public void setSearchquery(String searchquery) {
		this.searchquery = searchquery;
	}

	public String getResults() {
		return results;
	}

	public void setResults(String results) {
		this.results = results;
	}

	public LocalDateTime getTimestamp() {
		return date;
	}

	public void setTimestamp(LocalDateTime timestamp) {
		this.date = timestamp;
	}

	@Override
	public String toString() {
		return "UserSearchHistory [id=" + id + ", username=" + username + ", userType=" + userType + ", searchquery="
				+ searchquery + ", results=" + results + ", date=" + date + "]";
	}

}
