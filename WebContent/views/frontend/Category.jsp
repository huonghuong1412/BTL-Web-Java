<%@page import="models.Category"%>
<%@page import="DAO.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<ul class="sidebar__inner--menu">
	<li><a class="sidebar__inner--link"
		href="<%=request.getContextPath()%>/ListProductServlet?category=all">Tất
			cả sản phẩm</a></li>

	<%
		CategoryDAO categoryDAO = new CategoryDAO();
	%>

	<%
		for (Category category : categoryDAO.getAllCategory()) {
	%>
	<li><a class="sidebar__inner--link"
		href="<%=request.getContextPath()%>/ListProductServlet?category=<%=category.getCategoryName()%>">
			<%=category.getCategoryName()%>
	</a></li>
	<%
		}
	%>
</ul>

