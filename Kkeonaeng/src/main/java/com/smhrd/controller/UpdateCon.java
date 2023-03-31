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
		
		// 무조건 사진저장 먼저
		String path = request.getServletContext().getRealPath("file");
		int maxSize = 10 * 1024 * 1024; // 20 MB
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		MultipartRequest multi;
		int cnt = 0;
		
		String qString = "";
		String cnick="";
		try {
			
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			int user_idx = Integer.parseInt(multi.getParameter("user_idx"));
			String nick = multi.getParameter("nick");
			int rg_idx = Integer.parseInt(multi.getParameter("rg_idx"));
			cnick = nick;
			System.out.println(user_idx);
			String filename = multi.getFilesystemName("filename");
			UserDTO dto = null;
			String file_img = "";
			if(filename == null) {
				// 이미지 데이터가 없을때 닉네임만 변경
				dto = new UserDTO(user_idx, nick, rg_idx);
				cnt = new UserDAO().update(dto);
				
				
			}else {
				// 이미지데이터가 있을 때 이미지도 변경
				String filename_en = URLEncoder.encode(filename, "UTF-8");
				file_img = filename_en;
				String filesize = multi.getParameter("filesize");
				System.out.println(filesize);
				String post_idx = multi.getParameter("post_idx");
				String fileExt = multi.getParameter("fileExt");
				System.out.println(fileExt);
				
				if(post_idx.equals("")) {
					// 이미지 최초 저장
					
					System.out.println(1+post_idx);
					
					FileDTO fdto = new FileDTO(0,"profile",user_idx,filename_en,fileExt,path,filesize);
					cnt = new FileDAO().fileUpload(fdto);
					System.out.println(cnt);
					
				}else {
					// 이미지 수정
					System.out.println(2+post_idx);
					
					FileDTO fdto = new FileDTO(0,"profile",user_idx,filename_en,fileExt,path,filesize);
					cnt = new FileDAO().fileUpdate(fdto);
					System.out.println(cnt);
				}
			}
			
			if (cnt > 0) {
				System.out.println("회원정보수정성공");
				UserDTO d = (UserDTO)session.getAttribute("info");
				String profile_img = d.getFile_name();
				if(filename != null) {
					profile_img = file_img;
				}
				UserDTO updatedto = new UserDTO(d.getUser_idx(), nick, d.getGender(), d.getKakao_id(), d.getReg_date(), d.getUser_flag(), profile_img,rg_idx);
				session.setAttribute("info", updatedto); 
				qString = "200";
			} else {
				System.out.println("회원정보수정실패");
				qString = "300&nick=" + URLEncoder.encode(cnick, "UTF-8");;
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 파일먼저 등록하고 index 가져오기


		return "./?result="+qString;
	}

}
