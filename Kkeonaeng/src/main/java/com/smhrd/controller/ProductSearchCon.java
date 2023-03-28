package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductDTO;

public class ProductSearchCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String search = request.getParameter("search");
		
		ProductDAO dao = new ProductDAO();
		List<ProductDTO> search_list = dao.ProductSearch(search);
		
		return "../?result"; 
	}
}
