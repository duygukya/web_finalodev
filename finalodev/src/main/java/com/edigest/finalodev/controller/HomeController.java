package com.edigest.finalodev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Patch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edigest.finalodev.dao.CartDao;
import com.edigest.finalodev.dao.ProductDao;
import com.edigest.finalodev.dao.UserDao;
import com.edigest.finalodev.model.Cart;
import com.edigest.finalodev.model.Product;
import com.edigest.finalodev.model.User;

@Controller
public class HomeController {

    @Autowired
    private ProductDao productDao;
    @Autowired
    private CartDao cartDao;
    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/ara", method = RequestMethod.GET)
    public ModelAndView ara(@RequestParam("aranan") String aranan) {
    	
    	
        List<Product> products = productDao.getProductsByName(aranan);
        ModelAndView mav = new ModelAndView("searchResults");
        mav.addObject("products", products);
        return mav;
    }
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView showHomePage() {
    	
    	
        List<Product> products = productDao.getAllProducts();
        ModelAndView mav = new ModelAndView("home");
        mav.addObject("products", products);
        return mav;
    }

    

   
  
}




    
