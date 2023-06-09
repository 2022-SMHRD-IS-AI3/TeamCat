package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.UserDAO;
import com.smhrd.model.UserDTO;

public class JoinCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[JoinCon]");

		String nick = request.getParameter("nick");
		String gender = request.getParameter("gender");
		String kakao_id = request.getParameter("kakao_id");
		int rg_idx = Integer.parseInt(request.getParameter("rg_idx"));

		UserDTO dto = new UserDTO(0, nick, gender, kakao_id, null, null, null,rg_idx);
		System.out.println(nick + " - " + gender + " - " + kakao_id); // 지울예정

		UserDAO dao = new UserDAO();
		int cnt = dao.join(dto);

		String moveURL = null;

		if (cnt > 0) {
			System.out.println("회원가입성공"); // 지울예정
			moveURL = "../LoginCon.do?kakao_id="+kakao_id;
		
		} else {
			System.out.println("회원가입실패"); // 지울예정
			moveURL = "./index.jsp?result=300&g="+gender+"&k="+kakao_id+"&rg_idx="+rg_idx; // 실패시 어떻게 할 것인지
		}

		return moveURL;
	}

}
