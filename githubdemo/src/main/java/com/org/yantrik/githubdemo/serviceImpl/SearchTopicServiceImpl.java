package com.org.yantrik.githubdemo.serviceImpl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.org.yantrik.githubdemo.model.Items;
import com.org.yantrik.githubdemo.model.TopicSearchResult;
import com.org.yantrik.githubdemo.model.UserSearchHistory;
import com.org.yantrik.githubdemo.repository.UserRepository;
import com.org.yantrik.githubdemo.service.SearchTopicService;

@Service
public class SearchTopicServiceImpl implements SearchTopicService {
	@Autowired
	RestTemplate restTemplate;

	@Autowired
	UserRepository repository;

	@Override
	public TopicSearchResult searchTopicFromGitHubForQuery(String query) {

		final String uri = "https://api.github.com/search/topics?q=" + query;
		HttpHeaders headers = new HttpHeaders();
		headers.set("accept", "application/vnd.github.mercy-preview+json");
		HttpEntity<String> entity = new HttpEntity<>("body", headers);
		ResponseEntity<String> exchange = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
		Gson gson = new Gson();
		final TopicSearchResult result = gson.fromJson(exchange.getBody(), TopicSearchResult.class);
		System.out.println(result);

		return result;
	}

	@Override
	public boolean saveAdminSearchHistory(String username, List<Items> result, String searchquery) {
		UserSearchHistory usersearchhistory = new UserSearchHistory();
		usersearchhistory.setUsername(username);
		usersearchhistory.setUserType("Admin");
		StringBuffer str = new StringBuffer();
		if (result.size() >= 10) {
			for (int i = 0; i < 10; i++) {
				Items items = result.get(i);
				str = str.append(items.getName() + "\n");
			}
		} else {
			for (Items item : result) {
				str = str.append(item.getName() + "\n");
			}

		}
		usersearchhistory.setResults(str.toString());
		usersearchhistory.setSearchquery(searchquery);
		usersearchhistory.setTimestamp(java.time.LocalDateTime.now());

		UserSearchHistory obj = repository.save(usersearchhistory);
		if (obj != null) {
			return true;
		}
		return false;
	}

	@Override
	public List<UserSearchHistory> getSearchHistory(LocalDateTime startdate, LocalDateTime enddate) {

		List<UserSearchHistory> result = repository.getAllBetweenDates(startdate, enddate);
		System.out.println("UserSearchHistory"+result);
		return result;
	}

}
