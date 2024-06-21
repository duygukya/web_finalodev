<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html> 

<html lang="en">   
<head> 
    <meta charset="UTF-8"> 
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0"> 
    <title>Online Ödeme Sayfası</title>     
</head> 
 <style>

 * { 
    margin: 0; 
    padding: 0; 
    box-sizing: border-box; 
    border: none; 
    outline: none; 
    font-family: 'Poppins', sans-serif; 
    text-transform: capitalize; 
    transition: all 0.2s linear; 
} 
  
.container { 
    display: flex; 
    justify-content: center; 
    align-items: center; 
    min-height: 100vh; 
    padding: 25px; 
    background: #DFFFE1; 
} 
  
.container form { 
    width: 700px; 
    padding: 20px; 
    background: #fff; 
    box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.2); 
} 
  
.container form .row { 
    display: flex; 
    flex-wrap: wrap; 
    gap: 15px; 
} 
  
.container form .row .col { 
    flex: 1 1 250px; 
} 
  
.col .title { 
    font-size: 20px; 
    color: rgb(237, 55, 23); 
    padding-bottom: 5px; 
} 
  
.col .inputBox { 
    margin: 15px 0; 
} 
  
.col .inputBox label { 
    margin-bottom: 10px; 
    display: block; 
} 
  
.col .inputBox input, 
.col .inputBox select { 
    width: 100%; 
    border: 1px solid #ccc; 
    padding: 10px 15px; 
    font-size: 15px; 
} 
  
.col .inputBox input:focus, 
.col .inputBox select:focus { 
    border: 1px solid #000; 
} 
  
.col .flex { 
    display: flex; 
    gap: 15px; 
} 
  
.col .flex .inputBox { 
    flex: 1 1; 
    margin-top: 5px; 
} 
  
.col .inputBox img { 
    height: 34px; 
    margin-top: 5px; 
    filter: drop-shadow(0 0 1px #000); 
} 
  
.container form .submit_btn { 
    width: 100%; 
    padding: 12px; 
    font-size: 17px; 
    background: rgb(1, 143, 34); 
    color: #fff; 
    margin-top: 5px; 
    cursor: pointer; 
    letter-spacing: 1px; 
} 
  
.container form .submit_btn:hover { 
    background: #3d17fb; 
} 
  
input::-webkit-inner-spin-button, 
input::-webkit-outer-spin-button { 
    display: none; 
}
/* Styling for total price */
        .total-price {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-top: 20px;
        }
.btn-custom {
   background-color: #2E7D32;
    padding: 8px 16px;
    color: white;
    border-radius: 30px;
    
}
.btn-custom:hover {
    background-color: #3B7E07;
}
.text-center{
        font-size: 40px;
        font-weight: bold;
}
 </style> 
<body> 
    <div class="container"> 
  
        <form action="/finalodev/siparisver" method="post">
  
            <div class="row"> 
  
                <div class="col"> 
                    <h3 class="title"> 
                        Sipariş Bilgileri: 
                    </h3> 
  
                    <div class="inputBox"> 
                        <label for="name"> 
                              İsim: 
                          </label> 
                        <input type="text" name="name" id="name" 
                               placeholder="Enter your full name" 
                               required> 
                    </div> 
  
                    <div class="inputBox"> 
                        <label for="email"> 
                              Email: 
                          </label> 
                        <input type="text" name="email" id="email" 
                               placeholder="Enter email address" 
                               required> 
                    </div> 
  
                    <div class="inputBox"> 
                        <label for="address"> 
                              Adres: 
                          </label> 
                        <input type="text" name="address" id="address" 
                               placeholder="Enter address" 
                               required> 
                    </div> 
  
                    
  
                </div> 
                </div> 
                
                <div class="col"> 
                    <h3 class="title">Ödeme</h3> 
  
                    <div class="inputBox"> 
                    	
                        <label for="paymentMethod">Ödeme Yönetmi:</label> 
                        <select id="paymentMethod" name= "payment">                         
                            <option value="cash">Kapıda Ödeme</option> 
                            <option value="online">Online Ödeme</option> 
                        </select> 
                        <!-- Display total price here -->
                        <% 
                            String totalPrice = request.getParameter("totalPrice");
                        %>
                        <div class="total-price">
                            Total Price: <%= totalPrice %> TL
                        </div>
                        <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
                    </div>
            </div> 
  
            <button type="submit" class="btn btn-custom w-100">Sipariş Oluştur</button> 
        </form> 
  
    </div> 
    
  
</body> 
  
</html>