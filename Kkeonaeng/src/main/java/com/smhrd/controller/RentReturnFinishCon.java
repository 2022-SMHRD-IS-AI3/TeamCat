package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.FileDTO;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.RentDAO;
import com.smhrd.model.RentDTO;

public class RentReturnFinishCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[RentReturnFinishCon]");
		
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		int rp_idx = Integer.parseInt(request.getParameter("rp_idx"));
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		
		int cnt = new RentDAO().rentReturnFinish(p_idx);
		
		String moveUrl = "./?result=300";
		if(cnt > 0) {
			System.out.println("반납완료 성공");
			new ProductDAO().ProductFlagChange(new FileDTO(p_idx,"1",0));
			new RentDAO().rentReservationDelete(new RentDTO(p_idx,user_idx));
			moveUrl = "./Review/?p_idx="+p_idx+"&user_idx="+user_idx+"&rp_idx="+rp_idx;
		}else {
			System.out.println("반납완료 실패");
		}
		return moveUrl;
	}

}
