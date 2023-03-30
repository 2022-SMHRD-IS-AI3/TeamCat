package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.Command.Command;
import com.smhrd.model.UserDAO;
import com.smhrd.model.UserDTO;

public class RecoveryCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {

		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		String admin = request.getParameter("admin");
		
		UserDAO dao = new UserDAO();
		int cnt = dao.recovery(user_idx);

		if (cnt > 0) {
			System.out.println("회원 복구 성공"); // 지울예정
			HttpSession session = request.getSession();
			session.removeAttribute("info");
			
		} else {
			System.out.println("회원 복구 실패"); // 지울예정
		}
		String moveUrl = "../../Main.jsp";
		if(admin != null && admin.equals("y")) {
			moveUrl = "/Kkeonaeng/Admin/UserList/";
		}
		return moveUrl;
	}
}
