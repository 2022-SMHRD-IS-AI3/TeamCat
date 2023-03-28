package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.Command.Command;
import com.smhrd.model.ProductDAO;

public class ProductDeleteCon implements Command {
	
public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		System.out.println(p_idx);
		ProductDAO dao = new ProductDAO();
		int cnt = dao.ProductDelete(p_idx);
		
		String moveUrl = "";
		if (cnt > 0) {
			System.out.println("삭제성공"); // 지울예정
			moveUrl = "/Kkeonaeng/Product/";
			
		} else {
			System.out.println("삭제실패"); // 지울예정
			moveUrl = "/Kkeonaeng/Product/Detail/?p_idx="+p_idx;
		}
		
		return moveUrl; 
	}

}
