<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kayıt Ol</title>
<style>
    body {
        background-image: url('https://img.pikbest.com/wp/202345/shopping-cart-ecommerce-website-with-the-on-a-laptop-screen_9604584.jpg!w700wp'); /* Arka plan resmini buraya ekleyin */
        background-size: cover;
        background-position: center;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .overlay {
        background-color: rgba(0, 0, 0, 0.5); /* Arka plan resminin üzerine yarı saydam bir katman ekleyerek metinlerin daha okunabilir olmasını sağlarız */
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    .rectangle {
    width: 400px;
    height: 480px;
    background-color: transparent;
    border: 4px solid #ffff;
    border-radius: 10px;
    padding: 20px;
    box-sizing: border-box;
    margin: 100px auto 0; /* Üstten 50px, alt ve yanlardan otomatik ayarlanacak */
    text-align: center;
    position: relative;
    z-index: 1;
}


    .rectangle h2 {
        margin-top: 0;
        font-size: 24px;
        color: #ffff;
        ont-family: 'Roboto', sans-serif;
    }

    .input-group {
        margin-bottom: 20px;
        
    }

    .input-group label {
        display: block;
        margin-bottom: 5px;
        color: #ffff;
    }

    .input-group input {
        width: 60%;
        padding: 10px;
        border: 4px solid #ffff;
        border-radius: 5px;
    }
</style>
</head>
<body>
    <div class="overlay"></div> <!-- Arka plan resminin üzerine yarı saydam katman ekleriz -->
    <div class="rectangle">
        <h2>Kayit Olun</h2>
        <form action="/finalodev/signup" method="post">
            <div class="input-group">
                <label for="ad">Ad:</label>
                <input type="text" id="ad" name="username" required>
            </div>
            <div class="input-group">
                <label for="email">E-posta:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="sifre">Sifre:</label>
                <input type="password" id="sifre" name="password" required>
            </div>
            <button type="submit">Kayit Ol</button>
        </form>
    </div>
</body>
</html>
