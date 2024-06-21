<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ürün Güncelle</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #DFFFE1;
        }
        h2 {
            text-align: center;
            color: #2E7D32; /* Adjust the color as needed */
            margin-top: 0px;
            padding: 10px;
        }
        .form-container {
            width: 50%;
            max-width: 500px;
            margin: auto;
            border: 4px solid #084C0B ;
            border-radius: 10px;
            padding: 20px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container label {
            display: block;
            margin-bottom: 5px;
        }
        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #81C784;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #4CAF50; /* Darker shade of green on hover */
        }
    </style>
</head>
<body>
     
    
    <div class="form-container">
   		 <h2>Ürün Güncelle</h2>
        <form action="<%= request.getContextPath() %>/admin/products/pEdit" method="post">
            <input type="hidden" name="id" value="${product.id}" />
            
            <label for="name">Ürün Adı:</label>
            <input type="text" id="name" name="name" value="${product.name}" required />
            
            <label for="price">Fiyat:</label>
            <input type="number" id="price" name="price" value="${product.price}" required />
            
            <label for="imgurl">Image URL:</label>
            <input type="text" id="imgurl" name="imgurl" value="${product.imageUrl}" required />
            
            <label for="descr">Açıklama:</label>
			<textarea id="descr" name="descr" rows="4" required>${product.description}</textarea>

            
            <label for="categori">Kategori:</label>
            <input type="text" id="categori" name="categori" value="${product.category}" required />
            
            <input type="submit" value="Ürünü Güncelle" />
        </form>
    </div>
</body>
</html>
