package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.Command.Command;
import com.smhrd.model.ReservationDAO;

public class ReservationDeleteCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[reservationDeleteCon]"); // 지울예정
		int rv_idx = Integer.parseInt(request.getParameter("rv_idx"));
		String p_idx = request.getParameter("p_idx");
		
		
		int cnt = new ReservationDAO().reservationDelete(rv_idx);

		if (cnt > 0) {
			System.out.println("삭제성공"); // 지울예정
			HttpSession session = request.getSession();
			
			
		} else {
			System.out.println("삭제실패"); // 지울예정
			
		}
		String moveUrl = "./?p_idx="+p_idx;
		
		return moveUrl;
	}

}
