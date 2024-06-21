<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kullanıcı Ekle</title>
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
        .form-container input[type="email"],
        .form-container input[type="password"] {
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
        <h2>Yeni Kullanıcı Ekle</h2>
        
        <form action="${pageContext.request.contextPath}/admin/users/adduser" method="post">
            <label for="username">İsim:</label>
            <input type="text" id="username" name="username" required /><br/><br/>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required /><br/><br/>
            
            <label for="password">Şifre:</label>
            <input type="password" id="password" name="password" required /><br/><br/>
            
            <input type="submit" value="Add User" />
        </form>
    </div>
</body>
</html>
