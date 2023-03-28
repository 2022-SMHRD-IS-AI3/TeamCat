package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.Command.Command;
import com.smhrd.model.WishlistDAO;
import com.smhrd.model.WishlistDTO;


public class WishlistUpdateCon implements Command {

public String execute(HttpServletRequest request, HttpServletResponse response) {
		
			int user_idx = Integer.parseInt(request.getParameter("user_idx"));
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			
			// DTO로 묶기
			WishlistDTO dto = new WishlistDTO(0, user_idx, p_idx);
			int cnt = new WishlistDAO().WishlistUpdate(dto);
			
			if(cnt > 0) {
				System.out.println("찜 성공");
			}else {
				System.out.println("찜 실패");
			}
		
		return "../";
	}
}


