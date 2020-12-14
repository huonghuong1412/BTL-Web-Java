<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<%=request.getContextPath()%>/asset/img/favicon.png">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/all.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/grid.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/admin.css">
<title>Order List</title>
</head>
<body>
<header class="header">
    <div class="header-inner">
      <div class="logo">
          <a aria-current="page" class="active" href="/">
              <img src="https://theme.hstatic.net/1000239816/1000467243/14/logo.png?v=186" alt="">
          </a>
      </div>
      <ul class="menu">
          <li class="menu-item">
              <a class="menu-link" href="./products.html">Products</a>
          </li>
          <li class="menu-item">
              <a class="menu-link" href="./orders.html">Orders</a>
          </li>
          <li class="menu-item">
              <a class="menu-link" href="./blogs.html">Blog</a>
          </li>
      </ul>
    </div>
  </header>
    
  <div class="bg-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h3 class="bg-banner-title">
                        Quản lý đơn hàng
                    </h3>
                </div>
            </div>
        </div>
    </div>
    
    <div class="products__page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 products__list">
                    <div class="search__form">
                        <input type="text" placeholder="Search" class="form-control" name="textSearch" value=""
                            style="width: 300px;">
                        <button class="btn-search">Search</button>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>OrderID</th>
                                <th>Total</th>
                                <th style="width: 100px;">TotalProduct</th>
                                <th style="width: 100px;">CustomerID</th>
                                <th style="width: 100px;">Address</th>
                                <th style="width: 100px;">Date</th>
                                <th style="width: 15%;">Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}">
								<tr>
									<td></td>
									<td><c:out value="${order.idOrder}" /></td>
									<td><c:out value="${order.total}" /></td>
									<td><c:out value="${order.totalProduct}" /></td>
									<td><c:out value="${order.idCustomer}" /></td>
									<td></td>
									<td></td>
									<td><c:out value="${order.status}" /></td>
									<td>
										<a class="btn-view" href="detail-order?id=<c:out value='${order.idOrder}'/>">Detail</a>
										&nbsp;&nbsp;&nbsp;
										<a class="btn-edit" href="update-order?id=<c:out value='${order.idOrder}'/>">Chot don</a>
										
									</td>
								</tr>
							</c:forEach>
                        </tbody>
                    </table>
                    <div>
                        <ul class="pagination-numbers">
                            <li class="pagination-btn active">1</li>
                            <li class="pagination-btn ">2</li>
                            <li class="pagination-btn ">3</li>
                            <li class="pagination-btn ">4</li>
                            <li class="pagination-btn ">5</li>
                            <li class="pagination-btn ">6</li>
                            <li class="pagination-btn ">7</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
</body>
</html>