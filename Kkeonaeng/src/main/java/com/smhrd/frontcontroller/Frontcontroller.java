package com.smhrd.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.Command.Command;
import com.smhrd.controller.JoinCon;
import com.smhrd.controller.LoginCon;
import com.smhrd.controller.LogoutCon;
import com.smhrd.controller.ProductDeleteCon;
import com.smhrd.controller.ProductSearchCon;
import com.smhrd.controller.ProductUpdateCon;
import com.smhrd.controller.ProductWriteCon;
import com.smhrd.controller.RecoveryCon;
import com.smhrd.controller.RentStartCon;
import com.smhrd.controller.RentStartStatusCon;
import com.smhrd.controller.ReservationCon;
import com.smhrd.controller.ReservationDeleteCon;
import com.smhrd.controller.ReviewDeleteCon;
import com.smhrd.controller.ReviewUpdateCon;
import com.smhrd.controller.UpdateCon;
import com.smhrd.controller.WishlistDeleteCon;
import com.smhrd.controller.WishlistUpdateCon;
import com.smhrd.controller.DeleteCon;

public class Frontcontroller extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[Frontcontroller]");
		
		request.setCharacterEncoding("UTF-8");

		String reqURI = request.getRequestURI();
		System.out.println("어디서 왔는지! " + reqURI);

		String contextPath = request.getContextPath();
		System.out.println("Context Path : " + contextPath);
		
		String result = reqURI.substring(contextPath.length() + 1);
		
		String[] array = result.split("/");
		result = array[array.length-1];
		System.out.println("최종 요청값 : " + result);

		
		Command con = null;

		if (result.equals("LoginCon.do")) {
			
			con = new LoginCon();

		} else if (result.equals("JoinCon.do")) {
			
			con = new JoinCon();

		} else if (result.equals("LogoutCon.do")) {
			
			con = new LogoutCon();

		} else if (result.equals("DeleteCon.do")) {

			con = new DeleteCon();

		} else if (result.equals("UpdateCon.do")) {

			con = new UpdateCon();

		} else if (result.equals("ProductWriteCon.do")) {

			con = new ProductWriteCon();
			
		} else if (result.equals("ProductUpdateCon.do")) {
			
			con = new ProductUpdateCon();
			
		} else if (result.equals("ProductDeleteCon.do")) {
			
			con = new ProductDeleteCon();
			
		}else if (result.equals("ProductSearchCon.do")) {
			
			con = new ProductSearchCon();
			
		} else if (result.equals("ReservationCon.do")) {
			
			con = new ReservationCon();
		
		}else if (result.equals("WishlistUpdateCon.do")) {
			
			con = new WishlistUpdateCon();
		
		}else if (result.equals("WishlistDeleteCon.do")) {
			
			con = new WishlistDeleteCon();
		
		}else if (result.equals("ReviewUpdateCon.do")) {
			
			con = new ReviewUpdateCon();
		
		}else if (result.equals("ReviewDeleteCon.do")) {
			
			con = new ReviewDeleteCon();
		
		}else if (result.equals("RecoveryCon.do")) {
			
			con = new RecoveryCon();
		}else if (result.equals("ReservationDeleteCon.do")) {
			
			con = new ReservationDeleteCon();
		}else if (result.equals("RentStartCon.do")) {
			
			con = new RentStartCon();
		}else if (result.equals("RentStartStatusCon.do")) {
			
			con = new RentStartStatusCon();
		
		}
		response.sendRedirect(con.execute(request,response));

	}

}
