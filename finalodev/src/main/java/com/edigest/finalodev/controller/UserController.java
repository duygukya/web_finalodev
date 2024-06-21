package com.edigest.finalodev.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edigest.finalodev.dao.CartDao;
import com.edigest.finalodev.dao.UserDao;
import com.edigest.finalodev.model.Cart;
import com.edigest.finalodev.model.User;

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;
    @Autowired
    private CartDao cartDao;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView showLoginPage() {
        return new ModelAndView("login");
    }
    
    @PostMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
             
            User user = userDao.getUserByEmail(email);
            System.out.println(user);
            if (user != null && user.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                if (user.getRole().equals("ADMIN")){

                    ModelAndView modelAndView = new ModelAndView("admin");
                    response.sendRedirect("/finalodev/admin"); 
                    return modelAndView;
                		
            
            }
                ModelAndView modelAndView = new ModelAndView("home");
                response.sendRedirect("/finalodev/"); 
                return modelAndView;
            }
		} catch (Exception e) {
			System.out.println(e);
            ModelAndView modelAndView = new ModelAndView("login");
            modelAndView.addObject("message", "Invalid email or password.");
            return modelAndView;
		}
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public ModelAndView showSignupPage() {
        return new ModelAndView("signup");
    }
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public void registerUser(@RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("email") String email, HttpServletResponse response) {
    	
    	
    	User user = new User();
    	user.setEmail(email);
    	user.setPassword(password);
    	user.setUsername(username);
        user.setRole("customer");
        int userId= userDao.addUser(user);
        
        // Yeni kullanıcı oluşturulduğunda bir alışveriş sepeti de oluştur
        Cart newCart = new Cart();
        System.out.println(userId);
        newCart.setUserId(userId); // Yeni kullanıcının ID'sini sepetin kullanıcı ID'si olarak ayarla
        cartDao.addCart(newCart); // Yeni sepeti veritabanına ekle

        try {
            response.sendRedirect("/finalodev/login");
        } catch (IOException e) {
            e.printStackTrace();
            // Handle IOException appropriately
        }
    }
}
