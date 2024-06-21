<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
    <h2>Orders</h2>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Address</th>
            <th>Date</th>
            <th>User ID</th>
            <th>Total Price</th>
            <th>Payment</th>
        </tr>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.id}</td>
                <td>${order.address}</td>
                <td>${order.date}</td>
                <td>${order.userId}</td>
                <td>${order.totalPrice}</td>
                <td>${order.payment}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
