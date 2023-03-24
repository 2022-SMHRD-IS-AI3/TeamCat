package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;


public class WriteBoardCon<BoardDTO> extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		int user_idx = Integer.parseInt(multi.getParameter("user_idx"));
		String b_title = multi.getParameter("b_title");
		String b_content = multi.getParameter("b_content");
		String filename = multi.getFilesystemName("filename");	
		String filename_en = URLEncoder.encode(filename, "UTF-8");
		
		System.out.println("writer : " + user_idx);
		System.out.println("title : " + b_title);
		System.out.println("filename : " + filename);
		System.out.println("content : " + b_content);
		
		// DTO로 묶기
		BoardDTO dto = new BoardDTO(0, b_idx, user_idx, b_title, b_content, null);
		int cnt = new BoardDAO().upload(dto);
		
		if(cnt>0) {
			System.out.println("업로드 성공");
			
		}else {
			System.out.println("업로드 실패");
		}
		response.sendRedirect("BoardMain.jsp");
	}

}
