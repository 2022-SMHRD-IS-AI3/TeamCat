package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.UserDAO;

public class DeleteCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String user_idx = request.getParameter("user_idx");
		UserDAO dao = new UserDAO();
		int cnt = dao.delete(user_idx);

		if (cnt > 0) {
			System.out.println("삭제성공"); // 지울예정
		} else {
			System.out.println("삭제실패"); // 지울예정
		}
		
		return "Main.jsp"; // 주연 - 이동페이지 삭제가 완료되었습니다. alert로 알려주고 확인 클릭 시 메인? 아니면 페이지 따로 파고 확인 버튼 누르면 메인?
	}

}
