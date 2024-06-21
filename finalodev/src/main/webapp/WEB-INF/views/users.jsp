<%@page import="com.edigest.finalodev.model.User"%>
<%@page import="java.util.List"%>
<%@include file="navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kullanıcı Listesi</title>
<style>
h2 {
    color: #2E7D32 ; /* istediğiniz renk kodu */
}

    .users-container {
        display: flex;
        flex-wrap: wrap;
    }
    .user-box {
    border: 1px solid #ccc;
    padding: 10px;
    margin: 10px;
    width: 300px; /* Adjust width as needed */
    position: relative; /* Ensure absolute positioning is relative to this container */
    border-radius: 20px; 
    background-color: #DFFFE1;
    border: 4px solid #2E7D32;
    
}

.user-actions {
    position: relative;
    text-align: center;
    display: none; /* Initially hide actions */
    margin-top: 10px; /* Optional: Adds space between user info and actions */
}

.user-box:hover .user-actions {
    display: block; /* Show actions on hover */
}

.user-actions a {
    margin-left: 10px;
    text-decoration: none;
    color: #ffff;
    background-color: #81C784;
    border-radius: 20px;
    padding: 5px 15px; /* Adjust padding as needed */
}

.user-actions a:hover {
    text-decoration: underline;
}
.add-user-button {
    display: inline-block;
    padding: 10px 50px;
    background-color: #81C784;
    color: #ffffff;
    text-decoration: none;
    border-radius: 20px;
    transition: background-color 0.3s ease;
    margin-left: 550px;
}

.add-user-button:hover {
    background-color: #4CAF50; /* Darker shade of green on hover */
}

</style>
</head>
<body>
    <h2>Kullanıcı Listesi</h2>
    <div class="users-container">
        <% 
        List<User> users = (List<User>) request.getAttribute("users");
        for (User user : users) { %>
            <div class="user-box">
            <img src="https://www.freeiconspng.com/thumbs/computer-user-icon/computer-user-icon-21.png" alt="Profile Image" style="width: 50%; border-radius: 20px 20px 0 0;">
                <div class="user-info">
                    <p><strong>ID:</strong> <%= user.getId() %></p>
                    <p><strong>Username:</strong> <%= user.getUsername() %></p>
                    <p><strong>Email:</strong> <%= user.getEmail() %></p>
                </div>
                <div class="user-actions">
                    <a href="<%= request.getContextPath() %>/admin/users/edit?id=<%= user.getId() %>">Edit</a>
					<a href="<%= request.getContextPath() %>/admin/users/delete?id=<%= user.getId() %>">Delete</a>

                </div>
            </div>
        <% } %>
    </div>
    <br>
  <a href="<%= request.getContextPath() %>/admin/users/adduser" class="add-user-button">Add New User</a>
</body>
</html>