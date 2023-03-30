package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.Command.Command;
import com.smhrd.model.UserDAO;

public class DeleteCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		String admin = request.getParameter("admin");
		System.out.println(user_idx);
		UserDAO dao = new UserDAO();
		int cnt = dao.delete(user_idx);

		if (cnt > 0) {
			System.out.println("삭제성공"); // 지울예정
			HttpSession session = request.getSession();
			session.removeAttribute("info");
			
		} else {
			System.out.println("삭제실패"); // 지울예정
		}
		String moveUrl = "../../Main.jsp";
		if(admin != null && admin.equals("y")) {
			moveUrl = "/Kkeonaeng/Admin/UserList/";
		}
		return moveUrl;// 주연 - 이동페이지 삭제가 완료되었습니다. alert로 알려주고 확인 클릭 시 메인? 아니면 페이지 따로 파고 확인 버튼 누르면 메인?
	}

}
