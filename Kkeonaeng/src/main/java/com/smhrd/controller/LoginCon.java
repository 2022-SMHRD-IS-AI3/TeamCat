package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.Command.Command;
import com.smhrd.model.UserDAO;
import com.smhrd.model.UserDTO;

public class LoginCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String email = request.getParameter("email");

		System.out.println(email); // 지울예정

		UserDTO dto = new UserDTO(email);

		UserDTO info = new UserDAO().login(dto);

		if (info != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
		} else {
			System.out.println("로그인 실패");
		}
		
		return "Main.jsp";

	}

}
