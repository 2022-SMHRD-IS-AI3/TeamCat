package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.Command.Command;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductDTO;

public class ProductWriteCon implements Command {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("넘어옴");
	
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
		
		MultipartRequest multi;
	      try {
	    	// 사용자가 입력한 정보 가져오기
	    	multi = new MultipartRequest(request, path, maxSize, encoding, rename);
	    	int c_idx = Integer.parseInt(multi.getParameter("c_idx"));
	  		int user_idx = Integer.parseInt(multi.getParameter("user_idx"));
	  		String p_name = multi.getParameter("p_name");
	  		String contact_addr = multi.getParameter("contact_addr");
	  		String contact_gps = multi.getParameter("contact_gps");
	  		int price = Integer.parseInt(multi.getParameter("price"));
	  		String p_content = multi.getParameter("p_content");
	  		String p_status = multi.getFilesystemName("p_status");
	         

	         
	         // DTO로 묶기
	  		ProductDTO dto = new ProductDTO(0, user_idx, p_name, c_idx, contact_addr, contact_gps, price, p_content, p_content, p_status);
	         int cnt = new ProductDAO().upload(dto);

	         if (cnt > 0) {
	            System.out.println("업로드 성공");
	         } else {
	            System.out.println("업로드 실패");
	         }
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }

	      return "ProductMain.jsp";
	   }
		
	
			
		
		
		
		
	}


