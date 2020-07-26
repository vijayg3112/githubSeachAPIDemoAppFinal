package com.org.yantrik.githubdemo.service;

import java.time.LocalDateTime;
import java.util.List;

import com.org.yantrik.githubdemo.model.Items;
import com.org.yantrik.githubdemo.model.TopicSearchResult;
import com.org.yantrik.githubdemo.model.UserSearchHistory;

public interface SearchTopicService {

	public TopicSearchResult searchTopicFromGitHubForQuery(String query);

	public boolean saveAdminSearchHistory(String username, List<Items> result, String searchquery);
	
	public List<UserSearchHistory> getSearchHistory(LocalDateTime startdate,LocalDateTime enddate);

}
