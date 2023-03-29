package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewDTO;

public class ReviewDeleteCon implements Command {

public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		int rv_idx = Integer.parseInt(request.getParameter("rv_idx"));
		//System.out.println(rv_idx);
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.ReviewDelete(rv_idx);
		
		if (cnt > 0) {
			System.out.println("삭제성공"); // 지울예정
			
		} else {
			System.out.println("삭제실패"); // 지울예정
		}
		
		return "../"; 
	}

}


