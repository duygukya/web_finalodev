<%@page import="com.edigest.finalodev.model.User"%>
<%@include file="navbar.jsp"%>
<%@page import="com.edigest.finalodev.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TrendHub</title>	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style.css">
<style>
 body {
    margin: 0;
    font-family: Arial, sans-serif;
}

header {
    background-color: #FFFF;
    border-bottom: 1px solid #dee2e6;
    padding: 10px 20px;
}
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
}
.products-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    padding: 20px;
    background-color: #f0f0f0;
}

.product-card {
    position: relative;
    width: 250px;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s ease;
    overflow: hidden; /* Ensures image doesn't overflow */
}

.product-card .img-top {
   width: 100%; /* Resmin genişliği %100 olacak şekilde */
    height: auto; /* Yüksekliği otomatik olarak ayarlanacak */
    max-height: 300px; /* İsteğe bağlı olarak maksimum yükseklik belirleyebilirsiniz */
    object-fit: cover; /* Resmi kaplayacak şekilde uyum sağlamasını sağlar */
    border-radius: 20px; /* İsteğe bağlı olarak kenar yuvarlaklığı belirleyebilirsiniz */
}

.product-details {
    padding-top: 0px; /* Space between image and details */
    font-size: 14px;
}

.price {
    font-weight: bold;
    color: #333;
    margin-top: 5px;
    font-size: 14px;
}

.category {
    margin-top: 5px;
    color: #666;
}

.hover-details {
    display: none;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(255, 255, 255, 0.95);
    padding: 20px;
    box-sizing: border-box; /* Ensures padding is included in width */
    z-index: 100;
}

.product-card:hover .hover-details {
    display: block;
}

.hover-details .description {
    margin-bottom: 10px;
}

.add-to-cart {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 8px 15px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.add-to-cart:hover {
    background-color: #0056b3;
}





</style>
</head>
<body>
<header>
    <div class="products-container">
        <ul>
            <% List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                for (Product product : products) { %>
                    <li class="product-card">
                        <img class="img-top" src="<%=product.getImageUrl()%>" alt="<%=product.getName()%>">
                        <div class="product-details">
                            <strong><%=product.getName()%></strong>
                            <strong></strong> <%=product.getCategory()%>
                            <strong class="price"> <%=product.getPrice()%> ₺ </strong>
                            <div class="hover-details">
                                <div class="description">
                                    <strong>Description:</strong>
                                    <%=product.getDescription()%><br>
                                </div>
                                <form action="<%=request.getContextPath()%>/addToCart/<%=product.getId()%>" method="POST">
                                    <button type="submit" class="add-to-cart">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </li>
            <% }} %>
        </ul>
    </div>
</header>
</body>
</html>