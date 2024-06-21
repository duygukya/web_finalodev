package com.edigest.finalodev.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edigest.finalodev.dao.CartProductDao;
import com.edigest.finalodev.dao.OrderDao;
import com.edigest.finalodev.dao.OrderProductDao;
import com.edigest.finalodev.dao.ProductDao;
import com.edigest.finalodev.model.CartProduct;
import com.edigest.finalodev.model.CartProductListing;
import com.edigest.finalodev.model.Order;
import com.edigest.finalodev.model.OrderProduct;
import com.edigest.finalodev.model.Product;
import com.edigest.finalodev.model.User;

@Controller
public class OrderController {


    
    
    @Autowired
    private ProductDao productDao;
    @Autowired
    private CartProductDao cartProductDao;
    
    
    @Autowired
    private OrderDao orderDao;
    
    @Autowired
    private OrderProductDao orderProductDao;
    

    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public String listOrders(Model model) {
        List<Order> orders = orderDao.getAllOrders();
        model.addAttribute("orders", orders);
        return "orders";
    }
    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public String showPaymentPage() {
        return "payment";
    }



    @RequestMapping(value = "/order/new", method = RequestMethod.GET)
    public String showAddOrderForm(Model model) {
        model.addAttribute("order", new Order());
        return "addOrder";
    }

    @RequestMapping(value = "/order/new", method = RequestMethod.POST)
    public String addOrder(@ModelAttribute("order") Order order) {
        orderDao.addOrder(order);
        return "redirect:/orders";
    }
    
    
    @RequestMapping(value = "/siparisver", method = RequestMethod.POST)
    public String siparisver(
    		@RequestParam("address") String address,
            @RequestParam("totalPrice") String totalPrice,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("payment") String payment,
            HttpSession session) {

    	// Get the user id from the session
    	int userId = ((User) session.getAttribute("user")).getId();

    	// Create a new order instance
    	Order order = new Order();
    	order.setAddress(address);
    	order.setDate(new Date()); // Set the current date/time
    	order.setUserId(userId);
    	order.setTotalPrice(Double.parseDouble(totalPrice.replace(",", ".")));
    	order.setPayment(payment);

    	// Add the order to the database
    	orderDao.addOrder(order);

    	// Redirect to a confirmation page
    	return "redirect:/siparislerim";
}
    @RequestMapping(value = "/siparislerim", method = RequestMethod.GET)
    public String showUserOrders(Model model, HttpSession session) {
        // Get the user id from the session
        int userId = ((User) session.getAttribute("user")).getId();
        
        // Get orders for the user
        List<Order> userOrders = orderDao.getOrdersByUserId(userId);
      
        model.addAttribute("orders", userOrders);
        return "siparislerim";
    }

}
