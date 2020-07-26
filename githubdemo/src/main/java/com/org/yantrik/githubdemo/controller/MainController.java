package com.org.yantrik.githubdemo.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.org.yantrik.githubdemo.model.Items;
import com.org.yantrik.githubdemo.model.TopicSearchResult;
import com.org.yantrik.githubdemo.model.UserSearchHistory;
import com.org.yantrik.githubdemo.service.SearchTopicService;
import com.org.yantrik.githubdemo.serviceImpl.ExcelGenerator;

@Controller
@RequestMapping("result")
public class MainController {

	@Autowired
	SearchTopicService service;

	@RequestMapping(value = { "", "/{page}" }, method = RequestMethod.GET)
	public ModelAndView showUser(@PathVariable(required = false, name = "page") String page, HttpServletRequest request,
			HttpServletResponse response) {
		String searchQuery = request.getParameter("searchQuery");
		ModelAndView mv = new ModelAndView();
		PagedListHolder<Items> itemList;
		if (page == null) {
			itemList = new PagedListHolder<Items>();
			TopicSearchResult result = service.searchTopicFromGitHubForQuery(searchQuery);
			itemList.setSource(result.getItems());
			itemList.setPageSize(10);
			itemList.setPage(5);
			if ((Boolean) request.getSession().getAttribute("isAdmin")) {
				service.saveAdminSearchHistory("admin", result.getItems(), searchQuery);

			}
			request.getSession().setAttribute("itemList", itemList);
		} else if (page.equals("prev")) {
			// get the user list from session
			itemList = (PagedListHolder<Items>) request.getSession().getAttribute("itemList");
			// switch to previous page
			itemList.previousPage();
		} else if (page.equals("next")) {
			itemList = (PagedListHolder<Items>) request.getSession().getAttribute("itemList");
			// switch to next page
			itemList.nextPage();
		} else {
			int pageNum = Integer.parseInt(page);
			itemList = (PagedListHolder<Items>) request.getSession().getAttribute("itemList");
			itemList.setPage(pageNum - 1);
		}
		mv.setViewName("searchresult");
		return mv;
	}

	@GetMapping(value = "/downloadExcel")
	public void downloadCsv(HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=history.xlsx");
		List<UserSearchHistory> searchHistory = (List<UserSearchHistory>) session.getAttribute("historydata");
		ByteArrayInputStream stream = ExcelGenerator.dataToExcel(searchHistory);
		IOUtils.copy(stream, response.getOutputStream());

	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handleEmployeeNotFoundException(HttpServletRequest request, Exception ex) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception", ex);
		modelAndView.addObject("url", request.getRequestURL());
		modelAndView.setViewName("generic_error");
		return modelAndView;
	}

}
