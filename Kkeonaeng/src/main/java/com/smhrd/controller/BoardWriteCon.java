package com.smhrd.controller;

import java.io.IOException;
import java.rmi.activation.ActivationGroupDesc.CommandEnvironment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.binding.MapperMethod.SqlCommand;
import org.apache.ibatis.reflection.SystemMetaObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;


public class BoardWriteCon extends SqlCommand {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("넘어옴");
		// post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// MultipartRequeset 매개변수 정리
		// 1. request 객체
		// 2. 업로드 된 파일 저장경로
		String path = request.getServletContext().getRealPath("file");
		System.out.println(path);
		
		// 3. Max사이즈
		int maxSize = 10*1024*1024;
		
		// 4. 인코딩방식
		String encoding ="UTF-8";
		
		// 5. 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
		
		// 사용자가 입력한 정보 가져오기
		int c_idx = Integer.parseInt(multi.getParameter("c_idx"));
		int user_idx = Integer.parseInt(multi.getParameter("user_idx"));
		String p_name = multi.getParameter("p_name");
		String contact_addr = multi.getParameter("contact_addr");
		String contact_gps = multi.getParameter("contact_gps");
		int price = Integer.parseInt(multi.getParameter("price"));
		String p_content = multi.getParameter("p_content");
		String p_status = multi.getFilesystemName("p_status");	
		
		System.out.println("writer : " + user_idx);
		System.out.println("title : " + p_name);
		System.out.println("addr : " + contact_addr);
		System.out.println("content : " + p_content);
		
		// DTO로 묶기
		BoardDTO dto = new BoardDTO(0, user_idx, p_name, c_idx, contact_addr, contact_gps, price, p_content, p_content, p_status);
		int cnt = new BoardDAO().upload(dto);
		
		if(cnt>0) {
			System.out.println("업로드 성공");
			
		}else {
			System.out.println("업로드 실패");
		}
		response.sendRedirect("BoardMain.jsp");
	}

}
