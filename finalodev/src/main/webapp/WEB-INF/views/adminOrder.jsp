<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.edigest.finalodev.model.Order" %>
<%@ page import="com.edigest.finalodev.dao.OrderDao" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kayıtlı Siparişler</title>
    <style>
        h2 {
            color: #2E7D32;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <h2>Admin Orders</h2>
    <table>
        <thead>
            <tr>
                <th>Sipariş ID</th>
                <th>Kullanıcı ID</th>
                <th>Adres</th>
                <th>Tarih</th>
                <th>Toplam Fiyat</th>
                <th>Ödeme Yöntemi</th>
                <!-- Add more columns as needed -->
            </tr>
        </thead>
         <tbody>
            <%-- orders attribute'ünü request.getAttribute ile alıyoruz --%>
            <% List<Order> orders = (List<Order>) request.getAttribute("orders"); %>
            <% for (Order order : orders) { %>
                <tr>
                    <td><%= order.getId() %></td>
                    <td><%= order.getUserId() %></td>
                    <td><%= order.getAddress() %></td>
                    <td><%= order.getDate() %></td>
                    <td><%= order.getTotalPrice() %></td>
                    <td><%= order.getPayment() %></td>
                    <!-- Add more columns as needed -->
                </tr>
            <% } %>
        </tbody>

    </table>
</body>
</html>
