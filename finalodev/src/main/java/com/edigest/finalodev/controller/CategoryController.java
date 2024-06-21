package com.edigest.finalodev.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edigest.finalodev.dao.ProductDao;
import com.edigest.finalodev.model.Product;

@Controller
public class CategoryController {

    @Autowired
    private ProductDao productDao;

    @RequestMapping(value = "/fashion", method = RequestMethod.GET)
    public String getFashionProducts(Model model) {
        List<Product> fashionProducts = productDao.getProductsByCategory("fashion");
        model.addAttribute("products", fashionProducts);
        return "category"; // This should map to fashion.jsp
    }
    
    @RequestMapping(value = "/cosmetics", method = RequestMethod.GET)
    public String getCosmeticsProducts(Model model) {
        List<Product> cosmeticsProducts = productDao.getProductsByCategory("Cosmetics");
        model.addAttribute("products", cosmeticsProducts);
        return "category"; // This should map to fashion.jsp
    } 
    
    @RequestMapping(value = "/electronics", method = RequestMethod.GET)
    public String getElectronicProducts(Model model) {
        List<Product> electronicProducts = productDao.getProductsByCategory("electronics");
        model.addAttribute("products", electronicProducts);
        return "category"; // This should map to fashion.jsp
    }
    
    @RequestMapping(value = "/supermarket", method = RequestMethod.GET)
    public String getSupermarketProducts(Model model) {
        List<Product> supermarketProducts = productDao.getProductsByCategory("supermarket");
        model.addAttribute("products",supermarketProducts);
        return "category"; // This should map to fashion.jsp
    }
    
    @RequestMapping(value = "/baby", method = RequestMethod.GET)
    public String getBabyProducts(Model model) {
        List<Product> babyProducts = productDao.getProductsByCategory("bebek ve oyuncak");
        model.addAttribute("products",babyProducts);
        return "category"; // This should map to fashion.jsp
    }
    
    @RequestMapping(value = "/sport", method = RequestMethod.GET)
    public String getSportProducts(Model model) {
        List<Product> sportProducts = productDao.getProductsByCategory("spor");
        model.addAttribute("products",sportProducts);
        return "category"; // This should map to fashion.jsp
    }
    
    
    
}
