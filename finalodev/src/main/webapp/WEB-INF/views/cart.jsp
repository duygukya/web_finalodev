<%@page import="com.edigest.finalodev.model.CartProductListing"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sepetim</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    body {
        font-family: Arial, sans-serif !important;
        background-color: #DFFFE1 !important;
    }

    .card {
        border: none; /* Remove default card border */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow for a lifted effect */
    }

    .card-img-top {
        height: auto; /* Allow images to resize based on their aspect ratio */
        max-height: 100px; /* Limit maximum image height */
        width: 20%; /* Ensure image fills its container */
        object-fit: cover; /* Maintain aspect ratio and cover container */
    }

    .btn-primary-custom {
        background-color: #FF1B6B !important;
        border-color: #FF1B6B !important;
    }

    /* Stil tanımları */
    .total-price-container {
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        border-radius: .25rem;
        padding: 10px;
        margin-top: 20px;
    }

    .total-price-text {
        font-weight: bold;
        font-size: 18px;
    }
</style>




</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Sepetim</h1>
        
        <%-- Check if there are any items in the cart --%>
        <% List<CartProductListing> cartProductListings = (List<CartProductListing>) request.getAttribute("cartProductListings");
        if (cartProductListings != null && !cartProductListings.isEmpty()) { %>
            <%-- Display cart items --%>
            <div class="row">
                <% for (CartProductListing item : cartProductListings) { %>
                   <div class="col-lg-4 mb-4">
    <div class="card h-100">
        <img src="<%= item.getProduct().getImageUrl() %>" class="card-img-top" alt="Product Image">
        <div class="card-body">
            <h5 class="card-title"><%= item.getProduct().getName() %></h5>
            <p class="card-text"><%= item.getProduct().getDescription() %></p>
            <p class="card-text">Price: <%= item.getProduct().getPrice() %> TL</p>
            <div class="input-group mb-3">
                <button class="btn btn-primary btn-sm" type="button" onclick="decreaseQuantity(<%= item.getProduct().getId() %>)">-</button>
                <input type="text" class="form-control text-center" value="<%= item.getQuantity() %>" readonly>
                <button class="btn btn-primary btn-sm" type="button" onclick="increaseQuantity(<%= item.getProduct().getId() %>)">+</button>
            </div>
           <form action="/finalodev/deleteFromCart/<%=item.getProduct().getId() %>" method="post" style="display:inline;">
    <button type="submit" class="fas fa-solid fa-trash btn btn-link">SİL</button>
</form>

        </div>
    </div>
</div>



                <% } %>
            </div>
        <% } else { %>
            <%-- If cart is empty, display a message --%>
            <div class="row">
                <div class="col-lg-6">
                    <div class="alert alert-info" role="alert">
                        Sepetiniz Boş.
                    </div>
                </div>
            </div>
        <% } %>
        
        <%-- Display total price --%>
        <div class="row mt-5">
            <div class="col-lg-6 offset-lg-6">
                <div class="total-price-container">
                    <h5 class="total-price-text">Toplam Fiyat</h5>
                    <% if (cartProductListings != null && !cartProductListings.isEmpty()) { %>
                        <p id="totalPrice" class="card-text">Total: <%= request.getAttribute("totalPrice") %> TL</p>
                        <a href="/finalodev/payment?totalPrice=<%= request.getAttribute("totalPrice") %>" class="btn btn-primary-custom">Sipariş Ver</a>

                    <% } else { %>
                        <p id="totalPrice" class="card-text">Total: 0 TL</p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        function increaseQuantity(productId) {
            fetch("/finalodev/increaseCartQuantityInCart/" + productId)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(data => {
                    // Güncellenmiş toplam fiyatı alın
                    updateTotalPrice(data);
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
        }

        function decreaseQuantity(productId) {
            fetch("/finalodev/decreaseCartQuantityInCart/" + productId)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(data => {
                    // Güncellenmiş toplam fiyatı alın
                    updateTotalPrice(data);
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
        }

        function updateTotalPrice(newTotalPrice) {
            var totalPriceElement = document.getElementById("totalPrice");
            totalPriceElement.innerText = "Total: " + newTotalPrice + " TL";
        }
    </script>
</body>
</html>
