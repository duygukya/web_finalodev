<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Yeni Ürün Ekle</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .form-container {
            width: 50%;
            max-width: 500px;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 10px;
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
        <h2>Yeni Ürün Ekle</h2>
        
        <form action="${pageContext.request.contextPath}/admin/addProduct" method="post">
            <label for="name">Ürün Adı:</label>
            <input type="text" id="name" name="name" required /><br/><br/>
            
            <label for="price">Fiyat:</label>
            <input type="number" step="0.01" id="price" name="price" required /><br/><br/>
            
            <label for="description">Açıklama:</label>
            <textarea id="description" name="description" rows="4" required></textarea><br/><br/>
            
            <label for="imageUrl">ImageURL:</label>
            <input type="text" id="imageUrl" name="imageUrl" /><br/><br/>
            
            <label for="category">Kategori:</label>
            <input type="text" id="category" name="category" required /><br/><br/>
            
            <input type="submit" value="Ürün Ekle" />
        </form>
    </div>
</body>
</html>
