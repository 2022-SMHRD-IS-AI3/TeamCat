package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.MessageDAO;
import com.smhrd.model.MessageDTO;

public class MessageSendCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[SendMessageCon]");

		  int ms_idx = Integer.parseInt(request.getParameter("ms_idx"));
	      int user_idx = Integer.parseInt(request.getParameter("user_idx"));
	      int send_idx = Integer.parseInt(request.getParameter("send_idx"));
	      String message_con = request.getParameter("message_con");
	      String ms_reg_date = request.getParameter("ms_reg_date");
		  
	      
	      MessageDTO dto = new MessageDTO(ms_idx,user_idx, send_idx, message_con,ms_reg_date);
	      MessageDAO dao = new MessageDAO();
	      
	      int cnt = dao.sendMessage(dto);
	      
	      if(cnt > 0) {
	         System.out.println("전송성공");
	         
	      }else {
	         System.out.println("전송실패");
	      }
		return "MessageList.jsp";
	}

}