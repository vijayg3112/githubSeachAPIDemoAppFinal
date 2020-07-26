package com.org.yantrik.githubdemo.service;

import org.springframework.stereotype.Service;

@Service
public class LoginService {
	public boolean validateUser(String username, String password) {

		if (username.equalsIgnoreCase("root") && password.equalsIgnoreCase("root")
				|| username.equalsIgnoreCase("superadmin") && password.equalsIgnoreCase("superadmin")) {
			return true;
		}

		return false;
	}
}