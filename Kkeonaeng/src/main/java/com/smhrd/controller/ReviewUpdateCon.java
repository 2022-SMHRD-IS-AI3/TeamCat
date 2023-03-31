package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewDTO;

public class ReviewUpdateCon implements Command {

public String execute(HttpServletRequest request, HttpServletResponse response) {
		
			int rv_idx = Integer.parseInt(request.getParameter("rv_idx"));
			int user_idx = Integer.parseInt(request.getParameter("user_idx"));
			String thumbs_flag= request.getParameter("thumbs_flag");
			String rv_contents= request.getParameter("rv_contents");
			int rp_flag = Integer.parseInt(request.getParameter("rp_flag"));
			int rp_idx = Integer.parseInt(request.getParameter("rp_idx"));
			
			// DTO로 묶기
			ReviewDTO dto = new ReviewDTO();
			int cnt = new ReviewDAO().ReviewUpdate(dto);
			
			if(cnt > 0) {
				System.out.println("리뷰 작성 성공");
			}else {
				System.out.println("리뷰 작성 실패");
			}
		
		return "/Kkeonaeng/Product/Reservation/UserList/";
	}
}


