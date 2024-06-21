
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kullanıcı Düzenle</title>
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
        <h2>Kullanıcı Bilgileri</h2>
        
        <c:if test="${not empty user}">
            <form action="updateUser" method="post">
                <input type="hidden" name="id" value="${user.id}" />
                
                <label for="username">İsim:</label>
                <input type="text" id="username" name="username" value="${user.username}" required />
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${user.email}" required />
                
                <label for="password">Şifre:</label>
                <input type="password" id="password" name="password" value="${user.password}" required />
                
                <input type="submit" value="Update User" />
            </form>
        </c:if>
        
        <c:if test="${empty user}">
            <p>Kullanıcı Bulunamadı.</p>
        </c:if>
    </div>
</body>
</html>
