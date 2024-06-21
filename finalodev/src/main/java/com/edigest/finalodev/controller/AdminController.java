package com.edigest.finalodev.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edigest.finalodev.dao.OrderDao;
import com.edigest.finalodev.dao.OrderProductDao;
import com.edigest.finalodev.dao.ProductDao;
import com.edigest.finalodev.dao.UserDao;
import com.edigest.finalodev.model.Order;
import com.edigest.finalodev.model.OrderProduct;
import com.edigest.finalodev.model.Product;
import com.edigest.finalodev.model.User;

@Controller

public class AdminController {

	 @Autowired
	    private OrderDao orderDao;
	 @Autowired
	    private ProductDao productDao;
    @Autowired
    private UserDao userDao;
  	@GetMapping("/admin")
    public ModelAndView adminPanel(HttpSession session) {

        // Session'dan kullanıcı bilgisi al
        User user = (User) session.getAttribute("user");
        

        
        // Eğer oturum açmış bir admin kullanıcı varsa admin paneline yönlendir
        if (user != null && user.getRole().equals("ADMIN")) {
            ModelAndView modelAndView = new ModelAndView("admin");
            modelAndView.addObject("user", user); // Giriş yapmış kullanıcı bilgisini view'a ekle

            return modelAndView;
        } else { // Admin değilse veya oturum açmamışsa login sayfasına yönlendir
            return new ModelAndView("login");
        }

    }
  	@RequestMapping(value = "/admin/users/edit", method = RequestMethod.GET)
    public String editUser(@RequestParam("id") int id, Model model) {
        User user = userDao.getUserById(id);
        if (user != null) {
            model.addAttribute("user", user);
            return "edit"; // This should forward to edit.jsp
        } else {
            return "redirect:/admin/users"; // Redirect if user not found
        }
    }

  	  @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
  	    public ModelAndView showUsersPage() {
  		  
  		  List<User> users = userDao.getAllUsers();
  		  ModelAndView modelAndView = new ModelAndView("users");
  		  modelAndView.addObject("users" , users);
  		   
  	        return modelAndView;
  	    }
  	 @RequestMapping(value = "/admin/users/delete", method = RequestMethod.GET)  	
     public String deleteUser(@RequestParam int id) {
         userDao.deleteUser(id);
         return "redirect:/admin/users";
     }
  	@GetMapping("/admin/users/adduser")
    public String showAddUserForm() {
        return "adduser"; // This will resolve to adduser.jsp
    }

    // Handler method to process add user form submission
    @PostMapping("/admin/users/adduser")
    public String addUser(@RequestParam("username") String username,
                          @RequestParam("email") String email,
                          @RequestParam("password") String password) {
        // Create a new User object with the form data
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPassword(password);

        // Call UserDao to add the user to the database
        userDao.addUser(newUser);

        // Redirect to the users list page or any other appropriate page
        return "redirect:/admin/users";
    }

 


    @GetMapping("/admin/adminOrder")
    public ModelAndView listOrders() {
        ModelAndView modelAndView = new ModelAndView();
        List<Order> orders = new ArrayList<>();

        try {
            orders = orderDao.getAllOrders();
            modelAndView.addObject("orders", orders);
            modelAndView.setViewName("adminOrder");
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.setViewName("error");
        }

        return modelAndView;
    }


    @GetMapping("/admin/productsAdmin")
    public ModelAndView listProducts(HttpSession session) {
        User user = (User) session.getAttribute("user");

        if (user != null && user.getRole().equals("ADMIN")) {
            List<Product> productsAdmin = productDao.getAllProducts(); // Tüm ürünleri al
            ModelAndView modelAndView = new ModelAndView("productsAdmin"); // products.jsp veya products.html gibi bir view adı
            modelAndView.addObject("products", productsAdmin); // View'a ürün listesini ekle
            
            return modelAndView;
        } else {
            return new ModelAndView("login"); // Admin değilse veya oturum açmamışsa login sayfasına yönlendir
        }
    }
    
    @GetMapping("/admin/addProduct")
    public ModelAndView showAddProductForm() {
        ModelAndView modelAndView = new ModelAndView("addProduct");
        modelAndView.addObject("product", new Product()); // Add empty product object to model
        return modelAndView;
    }

    // Handler method to process the form submission
    @PostMapping("/admin/addProduct")
    public String addProduct(@ModelAttribute("product") Product product) {
        // Save the product using ProductDao
        productDao.addProduct(product);
        return "redirect:/admin/productsAdmin"; // Redirect to admin dashboard after adding product
    }
    
    @GetMapping("/admin/products/pEdit")
    public String showPeditForm(@RequestParam("id") int id, Model model) {
        Product product = productDao.getProductById(id);
        if (product != null) {
            model.addAttribute("product", product);
            return "pEdit"; // This should forward to editProduct.jsp
        } else {
            return "redirect:/admin/productsAdmin"; // Redirect if product not found
        }
    }

    @PostMapping("/admin/products/pEdit")
    public String pEditProduct(@ModelAttribute("product") Product product) {
        // Ensure description is not null
        if (product.getDescription() == null) {
            // Handle case where description is null (optional)
            product.setDescription(""); // Or set a default value
            product.setCategory("");
        }
        productDao.updateProduct(product);
        return "redirect:/admin/productsAdmin"; // Redirect to product list after editing
    }


    // Handler method to delete a product
    @GetMapping("/admin/products/delete")
    public String deleteProduct(@RequestParam("id") int id) {
        productDao.deleteProduct(id);
        return "redirect:/admin/productsAdmin"; // Redirect to product list after deletion
    }




   
    
    }



    

