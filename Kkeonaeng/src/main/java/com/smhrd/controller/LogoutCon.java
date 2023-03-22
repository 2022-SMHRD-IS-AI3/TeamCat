package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.Command.Command;

public class LogoutCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("[Logout]");

		HttpSession session = request.getSession();

		session.removeAttribute("info");

		return "Main.jsp";
	}

}
