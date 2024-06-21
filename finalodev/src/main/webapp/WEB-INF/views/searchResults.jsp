<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.edigest.finalodev.model.Product" %>
<%@ page import="java.util.List" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Arama Sonuçları</title>
    <style>
        h2 {
            color: #2E7D32; /* istediğiniz renk kodu */
        }

        .products-container {
            display: flex;
            flex-wrap: wrap;
        }

        .product-box {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            width: 300px; /* Adjust width as needed */
            position: relative; /* Ensure absolute positioning is relative to this container */
            border-radius: 20px;
            background-color: #DFFFE1;
            border: 4px solid #2E7D32;
        }

        .product-actions {
            position: relative;
            text-align: center;
            display: none; /* Initially hide actions */
            margin-top: 10px; /* Optional: Adds space between product info and actions */
        }

        .product-box:hover .product-actions {
            display: block; /* Show actions on hover */
        }

        .product-actions a {
            margin-left: 10px;
            text-decoration: none;
            color: #ffff;
            background-color: #81C784;
            border-radius: 20px;
            padding: 5px 15px; /* Adjust padding as needed */
        }

        .product-actions a:hover {
            text-decoration: underline;
        }

        .add-product-button {
            display: inline-block;
            padding: 10px 50px;
            background-color: #81C784;
            color: #ffffff;
            text-decoration: none;
            border-radius: 20px;
            transition: background-color 0.3s ease;
            margin-left: 550px; /* Adjust margin as needed */
        }

        .add-product-button:hover {
            background-color: #4CAF50; /* Darker shade of green on hover */
        }
        
    </style>
</head>
<body>
    <h2>Search Results</h2>
    <div class="products-container">
        <% 
        List<Product> products = (List<Product>) request.getAttribute("products");
        for (Product product : products) { %>
            <div class="product-box">
                <img src="<%= product.getImageUrl() %>" alt="Product Image" style="width: 50%; border-radius: 20px 20px 0 0;">
                <div class="product-info">
                    <p><strong>ID:</strong> <%= product.getId() %></p>
                    <p><strong>Name:</strong> <%= product.getName() %></p>
                    <p><strong>Price:</strong> $<%= product.getPrice() %></p>
                    <!-- Diğer ürün bilgilerini buraya ekleyebilirsiniz -->
                </div>
                <div class="product-actions">
                    <a href="<%= request.getContextPath() %>/admin/products/pEdit?id=<%= product.getId() %>">Edit</a>
                    <a href="<%= request.getContextPath() %>/admin/products/delete?id=<%= product.getId() %>">Delete</a>
                </div>
            </div>
        <% } %>
    </div>
    <br>
</body>
</html>
