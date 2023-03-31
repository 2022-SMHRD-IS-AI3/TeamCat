package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.FileDTO;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductDTO;
import com.smhrd.model.RentDAO;
import com.smhrd.model.ReservationDAO;
import com.smhrd.model.ReservationDTO;

public class RentStartCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[RentStartCon]");

		int rv_idx = Integer.parseInt(request.getParameter("rv_idx"));
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));

		int cnt = new RentDAO().rentStart(rv_idx);

		if (cnt > 0) {
			System.out.println("대여시작성공");
			// 물건 대여중으로 변경
			new ProductDAO().ProductFlagChange(new FileDTO(p_idx,"2",0));

		} else {
			System.out.println("대여시작실패");
		}
		return "./?p_idx="+p_idx;
	}

}
