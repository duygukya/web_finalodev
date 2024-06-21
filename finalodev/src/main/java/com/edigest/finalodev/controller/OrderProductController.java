package com.edigest.finalodev.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edigest.finalodev.dao.OrderProductDao;
import com.edigest.finalodev.model.OrderProduct;

@Controller
public class OrderProductController {

    @Autowired
    private OrderProductDao orderProductDao;

    @RequestMapping("/orderproducts")
    public String viewOrderProducts(Model model) {
        List<OrderProduct> orderProducts = orderProductDao.getAllOrderProducts();
        model.addAttribute("orderProducts", orderProducts);
        return "orderproduct_list";
    }

    @RequestMapping("/orderproduct/add")
    public String addOrderProduct(Model model) {
        // Buraya sipariş ürünü ekleme sayfasını döndüren kod eklenebilir.
        return "add_orderproduct";
    }

    @RequestMapping("/orderproduct/save")
    public String saveOrderProduct(OrderProduct orderProduct) {
        orderProductDao.addOrderProduct(orderProduct);
        return "redirect:/orderproducts";
    }

    @RequestMapping("/orderproduct/edit/{orderId}/{productId}")
    public String editOrderProduct(Model model, @PathVariable int orderId, @PathVariable int productId) {
        OrderProduct orderProduct = orderProductDao.getOrderProductById(orderId, productId);
        model.addAttribute("orderProduct", orderProduct);
        return "edit_orderproduct";
    }

    @RequestMapping("/orderproduct/update")
    public String updateOrderProduct(OrderProduct orderProduct) {
        orderProductDao.updateOrderProduct(orderProduct);
        return "redirect:/orderproducts";
    }

    @RequestMapping("/orderproduct/delete/{orderId}/{productId}")
    public String deleteOrderProduct(@PathVariable int orderId, @PathVariable int productId) {
        orderProductDao.deleteOrderProduct(orderId, productId);
        return "redirect:/orderproducts";
    }
}
