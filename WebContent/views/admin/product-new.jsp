<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Product</title>
<link rel="icon" href="<%=request.getContextPath()%>/asset/img/favicon.png">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/grid.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/admin.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/add.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/cart.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/detail.csss">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/contact.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/home.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/order.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/product.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/products.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/user.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/responsive.css">


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
                    Thêm sản phẩm
                </h3>
            </div>
        </div>
    </div>
</div>
    
<div class="manage__page">
    <div class="container">
        <div class="add-product-form">
            <form action="product-insert">
				<label style="display: block; width: 100px;" >Product Name</label>
				<input type="text"
					class="form-control"
					name="name" required="required">
				<br/>
						
				<label  style="display: block; width: 100px;" >Price</label> <input type="text"
					class="form-control"
					name="price">
				<br/>
				<label  style="display: block; width: 100px;" >Quantity</label> <input type="text"
					class="form-control"
					name="quantity">
				<br/>
				<label  style="display: block; width: 100px;" >Image :</label> 				
				
				<label  style="display: block; width: 100px;"  for="image">Select a file:</label> 
				
				<input type="file" style="display: block; width: 150px;"
					id="image" name="image"><br>

				<label  style="display: block; width: 100px;" >Description</label> <input type="text"
					class="form-control"
					name="description">
				<br/>
				<label  style="display: block; width: 100px;" >Material</label> <input type="text"
					class="form-control"
					name="material">
				<br/>
				<input type="submit" value="Submit" />
			</form>
            
            
            <!-- <div class="form-group">
                <label for="add-productFormAuthor" class="">Tên sản phẩm</label>
                <input required="" type="text" id="add-productFormAuthor" class="form-control input-lg" name="name"
                    placeholder="Name" autocapitalize="words" value="">
            </div>
            <div class="form-group">
                <label for="add-productFormName" class="">SKU</label>
                <input required="" type="text" id="add-productFormName" class="form-control input-lg" name="sku"
                    placeholder="SKU" autocapitalize="words" value="">
            </div>
            <div class="form-group">
                <label for="add-productForm1" class="">Category</label>
                <select id="inputState" class="form-control" name="category">
                    <option value="ao">Áo</option>
                    <option value="ao-khoac">Áo khoác</option>
                    <option value="quan">Quần</option>
                    <option value="giay">Giày</option>
                    <option value="vay-dam">Váy đầm</option>
                    <option value="bo-mac-nha">Bộ mặc nhà</option>
                    <option value="tui-xach">Túi xách</option>
                </select>
            </div>
            <div class="form-group">
                <label for="add-productForm2" class="">Price</label>
                <input required="" type="text" id="add-productForm2" class="form-control input-lg" name="price"
                    placeholder="Price" autocapitalize="words" value="0">
            </div>
            <div class="form-group">
                <label for="add-productForm3" class="">Material</label>
                <input required="" type="text" id="add-productForm3" class="form-control input-lg" name="material"
                    placeholder="Material" autocapitalize="words" value="">
            </div>
            <button class="btn-edit">Thêm hình ảnh</button>
            <div class="form-group">
                <button class="btn-view">Thêm sản phẩm</button>
                <a class="btn-delete" href="./products.html">Huỷ</a>
            </div> -->
        </div>
    </div>
</div> 
    
<!-- 
<form action="product-insert">
	<label>Product Name</label>
	<input type="text"
		class="form-control"
		name="name" required="required">
	<br/>
	<label>Price</label> <input type="text"
		class="form-control"
		name="price">
	<br/>
	<label>Quantity</label> <input type="text"
		class="form-control"
		name="quantity">
	<br/>
	<label>Image :</label> 				
	
	<label for="myfile">Select a file:</label> <input type="file"
		id="myfile" name="image"><br>
	<br/>
	<label>Description</label> <input type="text"
		class="form-control"
		name="description">
	<br/>
	<label>Material</label> <input type="text"
		class="form-control"
		name="material">
	<br/>
	<input type="submit" value="Submit" />
</form>

 -->
	<script src="<%=request.getContextPath()%>/asset/js/jquery-3.5.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/asset/js/all.min.js"></script>
    <script src="<%=request.getContextPath()%>/asset/js//main.js"></script>
</body>
</html>