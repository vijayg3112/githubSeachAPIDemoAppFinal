package com.org.yantrik.githubdemo;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.org.yantrik.githubdemo.model.Items;
import com.org.yantrik.githubdemo.model.TopicSearchResult;
import com.org.yantrik.githubdemo.model.UserSearchHistory;
import com.org.yantrik.githubdemo.service.SearchTopicService;

@SpringBootTest
@TestMethodOrder(OrderAnnotation.class)

class GithubdemoapiApplicationTests {

	@Test
	void contextLoads() {
	}

	@Autowired
	SearchTopicService service;

	@Test
	@Order(1)
	public void testSearchAPI() {
		TopicSearchResult searchTopicFromGitHubForQuery = service.searchTopicFromGitHubForQuery("JAVA");
		assertTrue(searchTopicFromGitHubForQuery != null);
	}

	@Test
	@Order(2)
	public void testSaveHistoryToDB() {

		Items item = new Items("java", "Java",
				"Java is an object-oriented programming language used mainly for web, desktop, embedded devices and mobile applications",
				"James Gosling", "May 23, 1995", "2016-12-14T21:15:34Z", "2020-07-26T13:37:28Z", true, true, 1);
		List<Items> result = new ArrayList<Items>();
		result.add(item);
		boolean isSaved = service.saveAdminSearchHistory("admin", result, "JAVA");
		assertTrue(isSaved);
	}

	@Test

	@Order(3)
	public void getAdminHistoryFromDB() {
		LocalDateTime now = java.time.LocalDateTime.now();
		LocalDateTime startdatetime = now.minusSeconds(60);
		LocalDateTime endtime = now.plusMinutes(60);
		List<UserSearchHistory> searchHistory = service.getSearchHistory(startdatetime, endtime);
		assertTrue(!searchHistory.isEmpty());
	}

}
