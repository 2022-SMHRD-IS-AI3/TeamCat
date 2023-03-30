package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.Command.Command;
import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewDTO;

public class ReviewDeleteCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("111");
		int rv_idx = Integer.parseInt(request.getParameter("rv_idx"));
		System.out.println("222");
		String admin = request.getParameter("admin");
		System.out.println("333");
		ReviewDAO dao = new ReviewDAO();
		System.out.println("444");
		int cnt = dao.ReviewDelete(rv_idx);
		String moveUrl = "";
		if (cnt > 0) {
			System.out.println("삭제 성공"); // 지울예정
			moveUrl = "../";
			if (admin != null) {
				moveUrl = "/Kkeonaeng/Admin/Review/";
			}

		} else {
			System.out.println("삭제 실패"); // 지울예정

		}

		return "../";
	}

}
