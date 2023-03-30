package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.WishlistDAO;
import com.smhrd.model.WishlistDTO;

public class WishlistDeleteCon implements Command {

public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		System.out.println(p_idx);
		
		WishlistDAO dao = new WishlistDAO();
		int cnt = dao.WishlistDelete(new WishlistDTO(0,user_idx, p_idx));
		
		if (cnt > 0) {
			System.out.println("삭제성공"); // 지울예정
			
		} else {
			System.out.println("삭제실패"); // 지울예정
		}
		
		return "../"; 
	}

}