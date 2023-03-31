<%@page import="com.smhrd.model.WishlistDTO"%>
<%@page import="com.smhrd.model.WishlistDAO"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@ page import="org.json.JSONObject" %>

	<%
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		
		WishlistDAO dao = new WishlistDAO();
		WishlistDTO dto = new WishlistDTO(0,user_idx,p_idx);
		String result = "200";
		String url = "";
		if(cnt > 0){
			int cnt2 = dao.WishlistDelete(dto);
			System.out.println(cnt2);
			url = "noheart.png";
		}else{
			int cnt2 = dao.WishlistUpdate(dto);
			System.out.println(cnt2);
			url = "heart.png";
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "200");
		jsonObject.put("url", url);
		String json = "[{'result':'200','url':'"+url+"'}]";
		
	%>
	
	<%-- <%=json %> --%>
	<%=jsonObject.toString() %>
