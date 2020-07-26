package com.org.yantrik.githubdemo.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.org.yantrik.githubdemo.model.ClientCredentials;
import com.org.yantrik.githubdemo.model.SearchParameter;
import com.org.yantrik.githubdemo.model.UserSearchHistory;
import com.org.yantrik.githubdemo.service.LoginService;
import com.org.yantrik.githubdemo.service.SearchTopicService;

@Controller
@RequestMapping("/api")
public class LoginController {
	@Autowired
	LoginService service;

	@Autowired
	SearchTopicService searchservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView showLoginPage(ModelMap model) {
		model.put("credentials", new ClientCredentials());
		return new ModelAndView("login", "credentials", new ClientCredentials());
	}

	@RequestMapping(value = "/login/validate", method = RequestMethod.POST)
	public ModelAndView showWelcomePage(@ModelAttribute("credentials") ClientCredentials credentials,
			HttpSession session) {
		boolean isValidUser = service.validateUser(credentials.getUsername(), credentials.getPassword());
		if (!isValidUser) {
			ModelAndView model = new ModelAndView("login", "credentials", new ClientCredentials());
			model.addObject("status", "Enter Correct Username And Password");
			return model;
		}
		if (credentials.getUsername().equals("root")) {

			session.setAttribute("isAdmin", true);
		} else {
			session.setAttribute("isAdmin", false);
		}

		return new ModelAndView("dashboard");
	}

	@RequestMapping(value = "/getsearchHistory", method = RequestMethod.POST)
	public ModelAndView getAdminUserSearchHistory(@ModelAttribute("searchparameter") SearchParameter searchparameter,
			HttpSession session) {

		System.out.println("searchparameter" + searchparameter);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
		LocalDateTime sdate = LocalDateTime.parse(searchparameter.getStartdatetimepicker(), formatter);
		LocalDateTime edate = LocalDateTime.parse(searchparameter.getEnddatetimepicker(), formatter);
		List<UserSearchHistory> searchHistory = searchservice.getSearchHistory(sdate, edate);
		session.setAttribute("historydata", searchHistory);

		return new ModelAndView("download");
	}

	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session) throws IOException {
		session.invalidate();
		return "login";
	}

	@RequestMapping("/search")
	public String search() throws IOException {
		return "topicsearch";
	}

	@RequestMapping("/reports")
	public ModelAndView GetAdminSearchReports(ModelMap model) throws IOException {

		model.put("searchparameter", new SearchParameter());
		return new ModelAndView("report", "searchparameter", new SearchParameter());
	}

	@RequestMapping("/home")
	public String showHomePage() throws IOException {
		return "dashboard";
	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handleEmployeeNotFoundException(HttpServletRequest request, Exception ex) {
		System.out.println("handleEmployeeNotFoundException called:");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception", ex);
		modelAndView.addObject("url", request.getRequestURL());

		modelAndView.setViewName("generic_error");
		return modelAndView;
	}
}
