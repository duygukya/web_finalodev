<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.edigest.finalodev.model.Order" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Siparişlerim</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #DFFFE1;
    }

    .card-img-top {
        height: 200px;
        object-fit: cover;
        object-position: center;
    }

    .bthnnn {
        background-color: #ff1b6b !important;
    }
</style>
<body>
<h2>My Orders</h2>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>Sipariş ID</th>
        <th>Adres</th>
        <th>Tarih</th>
        <th>Toplam Fiyat</th>
        <th>Ödeme Yöntemi</th>
    </tr>
    </thead>
    <tbody>
    <% List<Order> orders = (List<Order>) request.getAttribute("orders");
    for (Order order : orders) { %>
        <tr>
            <td><%= order.getId() %></td>
            <td><%= order.getAddress() %></td>
            <td><%= order.getDate() %></td>
            <td><%= order.getTotalPrice() %></td>
            <td><%= order.getPayment() %></td>
        </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
