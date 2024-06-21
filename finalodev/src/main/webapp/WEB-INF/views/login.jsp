<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giriş Yap</title>
<style>
    /* Dıştaki dikdörtgenin stilleri */
    .outer-rectangle {
        width: 500px;
        height: 450px;
        background-color: rgba(255, 255, 255, 0.7);
        /* Orta ortaya yerleştirme */
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        margin-left:100px;
    }

    /* İçteki dikdörtgenin stilleri */
    .inner-rectangle {
        width: 200px;
        height: 350px; /* E-posta ve şifre girişi için yer ayırmak */
        background-color: rgba(138, 200, 141, 0.7);
        /* İçteki dikdörtgeni dıştaki dikdörtgenin soluna hizalama */
        position: relative; /* Değişiklik: 'relative' olarak güncellendi */
        left: -200px; /* Dıştaki dikdörtgenin solundan 250 piksel uzaklıkta */
        top: 0; /* Dıştaki dikdörtgenin üstünden başlat */
        padding-top: 100px; /* Metin alanlarını aşağıya kaydır */
    }
    
    /* TrendHub başlığının stilleri */
    .trendhub-text {
        position: absolute;
        top: 1cm; 
        left: 0;
        color: #084C0B ;
        font-size: 24px; 
        font-family: "Abril Fatface";
        font-weight: bold;
        width: 100%; 
        text-align: center; 
    }
    
    .giris-text {
        position: absolute;
        top: 1cm; 
        left: -10px;
        color: #084C0B ;
        font-size: 24px; 
        font-family: "Abril Fatface";
        font-weight: bold;
        width: 100%;
        text-align: center;
    }
    
    
    .input-container {
        width: 100%;
        margin-top: 20px;
        margin-left: 300px;
        text-align: center;
    }
    
    .input-container input {
        width: 150%;
        background-color:rgba(138, 200, 141, 0.7);
        padding: 10px;
        margin-top: 10px;
        margin-bottom: 20px;
        border: 5px solid #084C0B;
        border-radius: 5px;
        font-size: 16px;
    }
    .login-button {
        width: 80%;
        height: 40px;
        background-color: #6FB072  ;
        border: none;
        border-radius: 10px;
        color: #084C0B ;
        font-size: 16px;
        cursor: pointer;
        margin-top: 20px;
        margin-left: 200px;
    }
     .signup-text {
        margin-left:300px;
        position: absolute;
        bottom: 30px; /* Alttan 10 piksel boşluk */
        left: 0;
        color: #084C0B;
        font-size: 16px;
        font-family: "Arial", sans-serif;
        width: 150%;
        text-align: center;
        text-decoration: underline;
       
    }

    .signup-text:hover {
        color: #374BB7;
        cursor: pointer; /* Mouse ikonu değiştirme */
    }


body {
    background-image: url('https://www.logzerotechnologies.com/wp-content/uploads/2023/10/iStock-1249219777-1.jpg');
    background-size: cover; /* Resmi ekran boyutuna uygun olarak yay */
    background-position: center; /* Resmi ortala */
    margin: 580px;
    padding: 0;
}

</style>
</head>
<body>


<div class="outer-rectangle">

<div class="giris-text">Giris Yapiniz</div>
    
    <div class="inner-rectangle">        
        <div class="trendhub-text">TrendHub</div>
        
        <!-- Formun action özelliği ile doğrudan sunucuya yönlendirme yapılıyor -->
        <form action="/finalodev/login" method="POST" class="input-container">
            <input type="email" name="email" placeholder="E-posta" required>
            <input type="password" name="password" placeholder="Sifre" required>
            <button type="submit" class="login-button">Giris Yap</button>
        </form>
        
        <div class="signup-text">
            <a href="/finalodev/signup"> Hesabiniz yok mu? Uye olun</a>.
        </div>
    </div>
</div>



</body>
</html>
