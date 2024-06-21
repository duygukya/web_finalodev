package com.edigest.finalodev.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edigest.finalodev.dao.ProductDao;
import com.edigest.finalodev.model.Product;

@Controller
public class ProductController {

    @Autowired
    private ProductDao productDao;

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public String listProducts(Model model) {
        List<Product> products = productDao.getAllProducts();
        model.addAttribute("products", products);
        return "products";
    }

    @RequestMapping(value = "/product/new", method = RequestMethod.GET)
    public String showAddProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "addProduct";
    }

    @RequestMapping(value = "/product/new", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") Product product) {
        productDao.addProduct(product);
        return "redirect:/products";
    }

    @RequestMapping(value = "/product/edit/{id}", method = RequestMethod.GET)
    public String showEditProductForm(@PathVariable("id") int id, Model model) {
        Product product = productDao.getProductById(id);
        model.addAttribute("product", product);
        return "editProduct";
    }

    @RequestMapping(value = "/product/edit", method = RequestMethod.POST)
    public String editProduct(@ModelAttribute("product") Product product) {
        productDao.updateProduct(product);
        return "redirect:/products";
    }

    @RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
    public String deleteProduct(@PathVariable("id") int id) {
        productDao.deleteProduct(id);
        return "redirect:/products";
    }
}
