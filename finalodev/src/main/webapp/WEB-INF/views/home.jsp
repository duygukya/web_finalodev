<%@page import="com.edigest.finalodev.model.User"%>
<%@page import="com.edigest.finalodev.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TrendHub</title>	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style.css">
<style>
 body {
    margin: 0;
    font-family: Arial, sans-serif;
}

header {
    background-color: #FFFF;
    border-bottom: 1px solid #dee2e6;
    padding: 10px 20px;
}

.container {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo h1 {
    margin: 0;
    font-family:'Abril Fatface';
    font-size: 32px;    
    color: #3B7E07;
}

.search {
    display: flex;
    align-items: center;
    margin-left: 20px; /* 2 cm boşluk ekliyoruz */
}


.search input {
    width: 774px; /* Genişlik */
    height: 63px; /* Yükseklik */
    padding: 10px;
    border: 1px solid #5BB415;
    border-radius: 30px; /* Köşe yuvarlaklığı */
    font-size: 16px; /* Yazı boyutu */
    color: #837373;
    box-sizing: border-box; /* Padding ve border hesaplaması */

}

.search button {
   padding: 5px 100px;
    border: none;
    background-color: #2E7D32;
    color: white;
    border-radius: 0 30px 30px 0;
    cursor: pointer;
    font-size: 16px; /* Yazı boyutu */
    height: 63px; /* Yükseklik */
    margin-left: -200px; /* Arama alanına üst üste bindirmek için */
}

.menu {
    display: flex;
    align-items: center;
    margin-left: auto;
}
.categories {
    display: flex;
    align-items: center;
    font-size:20px;
    cursor: pointer;
    color: #3B7E07;
    font-family:'Abril Fatface'; 
    margin-left: 10px; /* Arama alanı ile kategori metni arasındaki boşluk */
}

.categories span {
	cursor: pointer;
    margin-right: 5px; /* Kategori metni ile simge arasındaki boşluk */
}

.categories svg {
    fill: #3B7E07; /* Ikon rengi */
    width: 20px; /* Ikon genişliği */
    height: 20px; /* Ikon yüksekliği */
}
.categories :hover {
    text-decoration: underline;
}

.menu a {
    margin-left: 30px;
    font-family:'Abril Fatface';
    font-size: 20px;    
    color: #3B7E07;
    text-decoration: none;
}

.menu a:hover {
    text-decoration: underline;
}
.rectangle {
    position: relative;
    background-color: #81C784;
    width: 1450px;
    height: 50px;
    margin-top: 20px;
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding: 10px 20px;
    border-radius: 30px;
    
}
.rectangle a {
    text-decoration: none;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    transition: color 0.3s ease; /* Renk değişimi animasyonu */
}

.rectangle a:hover {
    color: #3B7E07; /* Hover durumunda renk değiştirme */
}
.rectangle-second {
    position: relative;
    background-color: #DFFFE1;
    width: 1000px;
    height: 350px;
    margin-top: 20px;
    border-radius: 50px; /* Köşe yuvarlaklığı */
    margin-left: 200px;
    margin-right: 100px;
    padding: 20px; /* İçeriğe boşluk eklemek için */
    display: flex;  
    
    align-items: center; /* İçeriği dikey olarak ortala */
}
.rectangle-second .content {
    flex: 1; /* İçeriği genişlet */
}
.rectangle-second h2,
.rectangle-second h3
 {
    margin: 0;
    margin-left: 30px;
    font-size: 64px;
    font-family: 'Abhaya Libre SemiBold';
    color: #3B7E07;
}

.rectangle-second h4 {
    margin-top: 45px;
    margin-left: 30px;
    font-family:'Abel';
    color: #3B7E07;
}

.shop-now {
    position: absolute;
    bottom: 20px;
    left: 50px;
}

.shop-now a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #2E7D32;
    color: white;
    text-decoration: none;
    border-radius: 50px;
    transition: background-color 0.3s ease; /* Arka plan rengi için geçiş efekti */
}

.shop-now a:hover {
    background-color: #3B7E07; /* Hover durumunda arka plan rengi değiştirme */
}
.rectangle-second .image {
    flex-shrink: 0; /* Resmin boyutu değiştirilebilir */
    margin-left: -200px; /* Resmin sol boşluğu */
}

.rectangle-second img {
    width: 400px; /* Resim genişliği */
    height: 300px; /* Resim yüksekliği otomatik olarak ayarlanır */
}
.super-price-offer {
    
    margin-left:30px;
    margin-top: 20px; /* Yukarıdan boşluk bırak */
    font-size: 40px; /* Yazı boyutunu ayarla */
    font-family:'Abhaya Libre SemiBold';
    color: #000000; /* Yazı rengini ayarla */
}


.ssss{
	margin-top: 80px;
}


.rectangle-location {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 50px auto; /* Sayfanın ortasında ve yukarıdan 50px boşluk */
    background-color: #FFFFFF; /* Arka plan beyaz */
    width: 600px; /* Genişlik arttırıldı */
    height: 80px; /* Yükseklik */
    padding: 10px 20px; /* Daha az padding */
    border-radius: 20px; /* Köşe yuvarlaklığı azaltıldı */
}

.location-content h2 {
    margin: 0;
    font-size: 18px; /* Yazı boyutu azaltıldı */
    color: #3B7E07;
}

.location-content p {
    margin: 5px 0 0 0;
    font-size: 14px; /* Yazı boyutu azaltıldı */
    color: #3B7E07;
}

.location-input input {
    width: 180px; /* Input alanı genişliği arttırıldı */
    height: 24px; /* Input alanı yüksekliği */
    padding: 8px; /* Input alanı padding'i */
    border: 1px solid #5BB415;
    border-radius: 20px; /* Köşe yuvarlaklığı */
    font-size: 14px; /* Yazı boyutu azaltıldı */
}

.location-button button {
    padding: 8px 16px; /* Daha küçük buton */
    background-color: #2E7D32;
    color: white;
    border: none;
    border-radius: 20px; /* Köşe yuvarlaklığı azaltıldı */
    cursor: pointer;
    font-size: 14px; /* Yazı boyutu azaltıldı */
}


.location .icon {
    margin-right: 20px; /* İkon ile metin arasında boşluk bırakır */
    fill: #5BB415; /* İkon rengi */
}
.location-content p {
    margin: 5px 0 0 0; /* Yukarıdan boşluk bırak */
    font-size: 14px; /* Yazı boyutunu ayarla */
    color: #3B7E07; /* Yazı rengini ayarla */
}
.icon-container {
    text-align: center; /* Elemanları yatayda ortala */
    margin: 50px auto; /* Sayfanın ortasına hizala ve yukarıdan 50px boşluk bırak */
}

.icon-with-text {
    display: inline-block;
    margin-right: 50px; /* Iconlar arasına boşluk bırak */
}

.icon {
    margin-bottom: 10px; /* İkonların altına boşluk bırak */
    vertical-align: middle; /* Metinle aynı hizaya getir */
}

.text {
    font-size: 16px; /* Metin boyutunu ayarla */
    color: #084C0B; /* Metin rengi */
    font-family:'Abhaya Libre SemiBold';
}
.custom-icon {
    width: 55px;
    height: 55px;
    color:#084C0B;
}



body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
}
.products-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    padding: 20px;
    background-color: #f0f0f0;
}

.product-card {
    position: relative;
    width: 250px;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s ease;
    overflow: hidden; /* Ensures image doesn't overflow */
}

.product-card .img-top {
   width: 100%; /* Resmin genişliği %100 olacak şekilde */
    height: auto; /* Yüksekliği otomatik olarak ayarlanacak */
    max-height: 300px; /* İsteğe bağlı olarak maksimum yükseklik belirleyebilirsiniz */
    object-fit: cover; /* Resmi kaplayacak şekilde uyum sağlamasını sağlar */
    border-radius: 20px; /* İsteğe bağlı olarak kenar yuvarlaklığı belirleyebilirsiniz */
}

.product-details {
    padding-top: 0px; /* Space between image and details */
    font-size: 14px;
}

.price {
    font-weight: bold;
    color: #333;
    margin-top: 5px;
    font-size: 14px;
}

.category {
    margin-top: 5px;
    color: #666;
}

.hover-details {
    display: none;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(255, 255, 255, 0.95);
    padding: 20px;
    box-sizing: border-box; /* Ensures padding is included in width */
    z-index: 100;
}

.product-card:hover .hover-details {
    display: block;
}

.hover-details .description {
    margin-bottom: 10px;
}

.add-to-cart {
    background-color: #3B7E07;
    color: #fff;
    border: none;
    padding: 8px 15px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.add-to-cart:hover {
    background-color: #2E7D32;
}





</style>
</head>
<body>
	<header>
		<div class="container">
			<div class="logo">
				<h1>TrendHub</h1>
			</div>
			<form action="/finalodev/ara" method="get" class="search">
				<input name="aranan" type="text" placeholder="Ürün aramak için...">
				<button type="submit">Ara</button>
			</form>
			<div class="menu">
				<div class="categories" onclick="toggleCategories()">
					<span>Tüm Kategoriler</span>
					<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
						viewBox="0 0 24 24">
                        <path fill="currentColor"
							d="M17 5h-3v14h3zm-5 0L1 12l11 7zm10 0h-3v14h3z" />
                    </svg>
				</div>
				<%
				HttpSession sess = request.getSession();
				User usersess = (User) sess.getAttribute("user");
				if(usersess == null){
					%>
				<a href="/finalodev/login">Giriş Yap/Üye Ol</a> 
				<%
				}else{
					%>
					<a href="/finalodev/cart"> Sepet </a> 
					<a href="/finalodev/siparislerim">Siparişlerim</a> 
					<a href="/finalodev/login">Çıkış Yap</a>
					
					<%
				}
				
				%>
					
			</div>
		</div>
		<div class="rectangle">
    
    <a href="/finalodev/fashion">Moda</a> 
    <a href="/finalodev/cosmetics">Kozmetik</a>
    <a href="/finalodev/electronics">Elektronik</a>
    <a href="/finalodev/supermarket">Süpermarket</a>
    <a href="/finalodev/baby">Bebek & Oyuncak</a>
    <a href="/finalodev/sport">Spor & Outdoor</a>
</div>
<div class="rectangle-second">
    <div class="content">
        <h2>Daha ince daha hızlı</h2>
        <h3>seri ile tanış</h3>
        <h4>İlk alımlara özel fırsatlar</h4>
    </div>
    <div class="image">
        <img src="https://m.media-amazon.com/images/I/81q7uBe6GEL._AC_SX679_.jpg" alt="Resim Açıklaması">
    </div>
    <div class="shop-now">
        <a href="<%=request.getContextPath()%>/shop-now">Şimdi Sipariş Ver</a>
    </div>
</div>
<div class="super-price-offer">
    <p>Süper Fiyat , Süper İndirim</p>
</div>

    <div class="products-container">
    <ul>
        <!-- Product Listing Loop -->
        <% List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null) {
            for (Product product : products) { %>
                <li class="product-card">
                    <!-- Product Image -->
                    <img class="img-top" src="<%=product.getImageUrl()%>" alt="<%=product.getName()%>">
                    
                    <!-- Product Details -->
                    <div class="product-details">
                        <!-- Product Name -->
                        <strong><%=product.getName()%></strong>
                        
                        <!-- Category -->
                        <strong></strong> <%=product.getCategory()%>
                        
                        <!-- Price -->
                        <strong class="price"> <%=product.getPrice()%> ₺ </strong>
                        
                        <!-- Hover Details (Description + Add to Cart) -->
                        <div class="hover-details">
                            <!-- Description -->
                            <div class="description">
                                <strong>Description:</strong>
                                <%=product.getDescription()%><br>
                            </div>
                            
                            <!-- Add to Cart Form -->
                            <form action="<%=request.getContextPath()%>/addToCart/<%=product.getId()%>" method="POST">
                                <button type="submit" class="add-to-cart">Sepete Ekle</button>
                            </form>
                        </div>
                    </div>
                </li>
        <% }} %>
    </ul>
</div>


    <!-- Diğer kısımlar buraya eklenecek -->



		<div class="rectangle-location">
			<div class="location-content">
				<span class="icon"> <svg xmlns="http://www.w3.org/2000/svg"
						width="1em" height="1em" viewBox="0 0 20 20">
                    <path fill="currentColor"
							d="M10 20S3 10.87 3 7a7 7 0 1 1 14 0c0 3.87-7 13-7 13m0-11a2 2 0 1 0 0-4a2 2 0 0 0 0 4" />
                </svg>
					<div>
						<h2>Location</h2>
						<p>Sana yakın mağzayı bul</p>
					</div>
				</span>
			</div>
			<div class="location-input">
				<input type="text" placeholder="Enter location">
			</div>
			<div class="location-button">
				<button>Search</button>
			</div>
		</div>
		<div class="icon-container">
			<div class="icon-with-text">
				<div class="icon">
					<svg class="custom-icon" xmlns="http://www.w3.org/2000/svg"
						width="1em" height="1em" viewBox="0 0 512 512">
                        <path fill="currentColor"
							d="M459.15 269.75a133.197 133.197 0 0 1-55.862 179.975l-42.782 22.541l-10.52 5.533a71.28 71.28 0 0 1-62.966 1.685l-167.077-71.38l15.733-46.676l99.363 19.194l-51.458-97.78l-82.843-157.411l40.357-21.232l82.844 157.457l19.934-10.485l-36.521-69.445l40.335-21.22l36.52 69.445l19.935-10.485l-28.2-53.598l40.358-21.232l28.2 53.598l19.945-10.576l-19.354-36.886l40.346-21.174l19.354 36.885l54.348 103.301zM73.268 146.674a60.03 60.03 0 0 1 42.361-102.459a60.098 60.098 0 0 1 56.58 80.169l10.588 20.013A78.29 78.29 0 0 0 115.708 26a78.233 78.233 0 0 0-5.635 156.262L99.428 162.02a59.7 59.7 0 0 1-26.16-15.346" /></svg>
				</div>
				<div class="text">
					<p>One click secure shopping</p>
				</div>
			</div>
			<div class="icon-with-text">
				<div class="icon">
					<svg class="custom-icon" xmlns="http://www.w3.org/2000/svg"
						width="1em" height="1em" viewBox="0 0 24 24">
                        <path fill="currentColor"
							d="M3 13.5L2.25 12H7.5l-.6-1.5H2L1.25 9h7.8l-.6-1.5H1.11L.25 6H4a2 2 0 0 1 2-2h12v4h3l3 4v5h-2a3 3 0 0 1-3 3a3 3 0 0 1-3-3h-4a3 3 0 0 1-3 3a3 3 0 0 1-3-3H4v-3.5zm16 5a1.5 1.5 0 0 0 1.5-1.5a1.5 1.5 0 0 0-1.5-1.5a1.5 1.5 0 0 0-1.5 1.5a1.5 1.5 0 0 0 1.5 1.5m1.5-9H18V12h4.46zM9 18.5a1.5 1.5 0 0 0 1.5-1.5A1.5 1.5 0 0 0 9 15.5A1.5 1.5 0 0 0 7.5 17A1.5 1.5 0 0 0 9 18.5" /></svg>
				</div>
				<div class="text">
					<p>Fast shipping</p>
				</div>
			</div>
			<div class="icon-with-text">
				<div class="icon">
					<svg class="custom-icon" xmlns="http://www.w3.org/2000/svg"
						width="1em" height="1em" viewBox="0 0 16 16">
                        <path fill="currentColor"
							d="M7.752.066a.5.5 0 0 1 .496 0l3.75 2.143a.5.5 0 0 1 .252.434v3.995l3.498 2A.5.5 0 0 1 16 9.07v4.286a.5.5 0 0 1-.252.434l-3.75 2.143a.5.5 0 0 1-.496 0l-3.502-2l-3.502 2.001a.5.5 0 0 1-.496 0l-3.75-2.143A.5.5 0 0 1 0 13.357V9.071a.5.5 0 0 1 .252-.434L3.75 6.638V2.643a.5.5 0 0 1 .252-.434zM4.25 7.504L1.508 9.071l2.742 1.567l2.742-1.567zM7.5 9.933l-2.75 1.571v3.134l2.75-1.571zm1 3.134l2.75 1.571v-3.134L8.5 9.933zm.508-3.996l2.742 1.567l2.742-1.567l-2.742-1.567zm2.242-2.433V3.504L8.5 5.076V8.21zM7.5 8.21V5.076L4.75 3.504v3.134zM5.258 2.643L8 4.21l2.742-1.567L8 1.076zM15 9.933l-2.75 1.571v3.134L15 13.067zM3.75 14.638v-3.134L1 9.933v3.134z" /></svg>
				</div>
				<div class="text">
					<p>Easy returns</p>
				</div>
			</div>
			<div class="icon-with-text">
				<div class="icon">
					<svg class="custom-icon" xmlns="http://www.w3.org/2000/svg"
						width="1em" height="1em" viewBox="0 0 24 24">
                        <path fill="currentColor"
							d="M20 16v-6h2v6a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2V4c0-1.11.89-2 2-2h8v2H8v12zm-9.09-8.92L14 10.17l6.59-6.59L22 5l-8 8l-4.5-4.5zM16 20v2H4a2 2 0 0 1-2-2V7h2v13z" /></svg>
				</div>
				<div class="text">
					<p>Rate us</p>
				</div>
			</div>
		</div>
	</header>
	
	
	
</body>
</html>

