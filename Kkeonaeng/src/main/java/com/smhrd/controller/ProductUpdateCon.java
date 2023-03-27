package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.Command.Command;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductDTO;


public class ProductUpdateCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getServletContext().getRealPath("file");
		System.out.println(path);

		// 3. Max사이즈
		int maxSize = 10 * 1024 * 1024;

		// 4. 인코딩방식
		String encoding = "UTF-8";

		// 5. 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		MultipartRequest multi;
		try {
			// 사용자가 입력한 정보 가져오기
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			int p_idx = Integer.parseInt(multi.getParameter("p_idx"));
			int user_idx = Integer.parseInt(multi.getParameter("user_idx"));
			String p_name = multi.getParameter("p_name");
			int c_idx = Integer.parseInt(multi.getParameter("c_idx"));
			String contact_addr = multi.getParameter("contact_addr");
			String contact_gps = multi.getParameter("contact_gps");
			int price = Integer.parseInt(multi.getParameter("price"));
			String p_contents = multi.getParameter("p_contents");

			// DTO로 묶기
			ProductDTO dto = new ProductDTO(p_idx, user_idx, p_name, c_idx, contact_addr, contact_gps, price, p_contents,
					null, null, null);
			int cnt = new ProductDAO().ProductUpdate(dto);
			
			if(cnt > 0) {
				System.out.println("수정성공");
			}else {
				System.out.println("수정실패");
			}
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/Kkeonaeng/Product/";
	}
}
