package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewDTO;

public class ReviewUpdateCon implements Command {

public String execute(HttpServletRequest request, HttpServletResponse response) {
		
	System.out.println("[ReviewUpdateCon]");
			int user_idx = Integer.parseInt(request.getParameter("user_idx"));
			System.out.println("111");

			String thumbs_flag= request.getParameter("thumbs_flag");
			System.out.println("222");
			String rv_contents= request.getParameter("rv_contents");
			System.out.println("333");
			int rp_flag = Integer.parseInt(request.getParameter("rp_flag"));
			System.out.println(rp_flag);

			System.out.println("444");
			int rp_idx = Integer.parseInt(request.getParameter("rp_idx"));
			System.out.println("555");
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			
			System.out.println(rv_contents);
			System.out.println(rp_idx);
			System.out.println(p_idx);
			
			// DTO로 묶기
			ReviewDTO dto = new ReviewDTO(0, user_idx, thumbs_flag, rv_contents, rp_flag, rp_idx, null,null);
			int cnt = new ReviewDAO().ReviewUpdate(dto);
			
			if(cnt > 0) {
				System.out.println("리뷰 작성 성공");
			}else {
				System.out.println("리뷰 작성 실패");
			}
		
		return "/Kkeonaeng/Product/Detail/?p_idx="+p_idx;
	}
}


