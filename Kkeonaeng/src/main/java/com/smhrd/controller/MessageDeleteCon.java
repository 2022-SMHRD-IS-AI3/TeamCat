package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.MessageDAO;

public class MessageDeleteCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[MessageDeleteCon]");
		int num = Integer.parseInt(request.getParameter("num"));
	    
	    int cnt = new MessageDAO().messageDelete(num);
	    
	    if(cnt > 0) {
	       System.out.println("삭제 완료");
	    }else {
	       System.out.println("삭제 실패");
	    }
		return "MessageList.jsp";
	}

}