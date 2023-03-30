package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.Command.Command;
import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewDTO;

public class ReviewDeleteCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {

		int rv_idx = Integer.parseInt(request.getParameter("rv_idx"));
		String admin = request.getParameter("admin");
		ReviewDAO dao = new ReviewDAO();
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
			moveUrl = "./?rv_idx="+rv_idx;
		}

		return moveUrl;
	}

}
