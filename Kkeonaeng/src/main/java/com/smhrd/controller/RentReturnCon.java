package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.RentDAO;

public class RentReturnCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[RentReturnCon]");
		
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		String user_idx = request.getParameter("user_idx");
		String rp_idx = request.getParameter("rp_idx");
		
		int cnt = new RentDAO().rentReturn(p_idx);
		
		String moveUrl = "./";
		if(cnt > 0) {
			System.out.println("반납신청완료");
			moveUrl = "/Kkeonaeng/Rent_finish/Review/?user_idx="+user_idx+"&rp_idx="+rp_idx;
		}else {
			System.out.println("반납신청실패");
		}
		return moveUrl;
	}

}
