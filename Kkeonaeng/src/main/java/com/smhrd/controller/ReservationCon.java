package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.Command.Command;
import com.smhrd.model.ReservationDAO;
import com.smhrd.model.ReservationDAO;
import com.smhrd.model.ReservationDTO;

public class ReservationCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("[ReservationCon]");

		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		int p_idx = Integer.parseInt(request.getParameter("user_idx"));
		String rv_start_date = request.getParameter("rv_start_date");
		String rv_end_date = request.getParameter("rv_end_date");

		ReservationDTO dto = new ReservationDTO(0, user_idx, p_idx, rv_start_date, rv_end_date);
		System.out.println(user_idx + " - " + p_idx + " - " + rv_start_date + " - " + rv_end_date); // 지울예정

		ReservationDAO dao = new ReservationDAO();
		int cnt = dao.reservation(dto);

		String moveURL = null;

		if (cnt > 0) {
			System.out.println("예약성공");
			moveURL = "../Detail/?result=s&p_idx=" + p_idx;

		} else {
			System.out.println("예약실패");
			moveURL = "../Detail/?result=f&p_idx=" + p_idx;
		}

		return moveURL;

	}
}
