<%@include file="navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YÖNETİCİ PANELİ</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<style>
    body {
        font-family: Arial, sans-serif !important;
        background-color: #DFFFE1 !important;
    }

    .boxadmin {
        height: 250px;
        width: 250px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4);
        border-radius: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        color: black;
        overflow: hidden;
        background-color: white;
        position: relative;
        margin-top: 25px;
        border: 4px solid #2E7D32; /* New border color */
    }

    .boxadmin img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 0.40;
        transition: opacity 0.3s ease;
    }

    .boxadmin:hover img {
        opacity: 1;
    }

    .boxadmin span {
        position: absolute;
        font-weight: bold;
        font-size: 1rem;
        text-align: center;
        bottom: 10px; /* Adjust the distance from the bottom */
        width: 90%; /* Ensures span stretches across */
        box-sizing: border-box; /* Include padding and border in width */
        padding: 10px; /* Padding around text */
        background-color: rgba(255, 255, 255, 0.7); /* Background color for text */
        background-color: #2E7D32;
        color: #ffff;
        border-radius: 30px;
    }
</style>

</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4 d-flex justify-content-center">
                <a class="boxadmin" href="/finalodev/admin/users">
                    <img src="https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_640.png" alt="">
                    <span>Kayıtlı kullanıcılar</span>
                </a>
            </div>
            <div class="col-md-4 d-flex justify-content-center">
                <a class="boxadmin" href="/finalodev/admin/adminOrder">
                    <img src="https://cdn-icons-png.flaticon.com/512/4866/4866645.png" alt="">
                    <span>Kayıtlı Siparişler</span>
                </a>
            </div>
            <div class="col-md-4 d-flex justify-content-center">
                <a class="boxadmin" href="/finalodev/admin/productsAdmin">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwORVDKQ_r4VHeL5Ldi1DciQoY9UXeU39S3g&s" alt="">
                    <span>Kayıtlı Ürünler</span>
                </a>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-4 d-flex justify-content-center">
                <a class="boxadmin"  href="/finalodev/admin/addProduct">
                    <img src="https://img.freepik.com/premium-vector/online-shopping-icon-using-mobile-phone_235461-137.jpg" alt="">
                    <span>Ürün Oluştur</span>
                </a>
            </div>
        </div>
    </div>
</body>
</html>
