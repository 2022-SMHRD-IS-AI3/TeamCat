package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.RepleDAO;
import com.smhrd.model.WishlistDAO;


public class RepleUpdateCon implements Command {

public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		System.out.println(p_idx);
		
		RepleDAO dao = new RepleDAO();
		int cnt =  dao.RepleDAO().RepleUpdate(dto);
		
		if (cnt > 0) {
			System.out.println("댓글 달기 성공"); // 지울예정
			
		} else {
			System.out.println("댓글 달기 실패"); // 지울예정
		}
		
		return "../"; 
	}

}


