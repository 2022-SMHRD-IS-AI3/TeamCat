package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.Command.Command;
import com.smhrd.model.UserDAO;
import com.smhrd.model.UserDTO;

public class UpdateCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[Update]");
		HttpSession session = request.getSession();

		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		int kimg_idx = Integer.parseInt(request.getParameter("kimg_idx"));
		String nick  = request.getParameter("nick");

		UserDTO dto = new UserDTO(user_idx, nick, kimg_idx);
		int cnt = new UserDAO().update(dto);

		if (cnt > 0) {
			System.out.println("회원정보수정성공");
			session.setAttribute("info", dto); 
		} else {
			System.out.println("회원정보수정실패");
		}

		return "My_page.jsp";
	}

}
