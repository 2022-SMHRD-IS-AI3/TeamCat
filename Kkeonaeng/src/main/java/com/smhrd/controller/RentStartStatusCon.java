package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.RentDAO;

public class RentStartStatusCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("[RentStartStatusCon]");
		
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		
		int cnt = new RentDAO().rentStartStatus(p_idx);
		
		if(cnt > 0) {
			System.out.println("대여시작상태변경성공");
		}else{
			System.out.println("대여시작상태변경성공");
		}
		return "./?p_idx="+p_idx;
	}

}
