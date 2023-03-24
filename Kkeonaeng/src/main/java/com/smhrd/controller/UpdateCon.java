package com.smhrd.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.Command.Command;
import com.smhrd.model.FileDAO;
import com.smhrd.model.FileDTO;
import com.smhrd.model.UserDAO;
import com.smhrd.model.UserDTO;

public class UpdateCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[Update]");
		HttpSession session = request.getSession();

		// 파일, user_idx, 닉네임 
		
		// 사진저장 먼저
		String path = request.getServletContext().getRealPath("file");
		int maxSize = 10 * 1024 * 1024; // 20 MB
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		MultipartRequest multi;
		
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			String title = multi.getParameter("title");
			String writer = multi.getParameter("writer");
			String filename = multi.getFilesystemName("filename");
			String filename_en = URLEncoder.encode(filename, "UTF-8");
			String content = multi.getParameter("content");
			File file = multi.getFile(filename);
			String filesize = "" +(int) file.length();
	        
			String[] extension = filename_en.split(".");
			FileDTO fdto = new FileDTO(0,"profile",user_idx,filename_en,extension[1],path,filesize);
			FileDTO fdao = new FileDAO().fileUpload(fdto);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String nick  = request.getParameter("nick");
		
		System.out.println(nick);
		
		// 파일먼저 등록하고 index 가져오기
		UserDTO dto = new UserDTO(user_idx, nick);
		int cnt = new UserDAO().update(dto);

		if (cnt > 0) {
			System.out.println("회원정보수정성공");
			session.setAttribute("info", dto); 
		} else {
			System.out.println("회원정보수정실패");
		}

		return "./";
	}

}
