package com.edigest.finalodev.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edigest.finalodev.dao.CartDao;
import com.edigest.finalodev.dao.CartProductDao;
import com.edigest.finalodev.dao.ProductDao;
import com.edigest.finalodev.model.CartProduct;
import com.edigest.finalodev.model.CartProductListing;
import com.edigest.finalodev.model.Product;
import com.edigest.finalodev.model.User;

@Controller
public class CartController {

	@Autowired
	private ProductDao productDao;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private CartProductDao cartProductDao;

	@GetMapping(value = "/cart")
	public ModelAndView sepet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			HttpSession httpSession = request.getSession();
			User user = (User) httpSession.getAttribute("user");
			if (user != null) {
				List<CartProduct> cartProducts = cartProductDao.getCartProductsByCartId(cartDao.getCartByUserId(user.getId()).getId());
				List<CartProductListing> cartProductListings = new ArrayList<CartProductListing>();

				double totalPrice = 0.0;

				for (CartProduct cartProduct : cartProducts) {
					Product product = productDao.getProductById(cartProduct.getProductId());
					cartProductListings.add(new CartProductListing(product, cartProduct.getQuantity()));
					totalPrice += product.getPrice() * cartProduct.getQuantity();
				}

				String formattedTotalPrice = String.format("%.2f", totalPrice);
				ModelAndView modelAndView = new ModelAndView("cart");
				modelAndView.addObject("cartProductListings", cartProductListings);
				modelAndView.addObject("totalPrice", formattedTotalPrice);
				return modelAndView;
			} else {
				response.sendRedirect("/finalodev/login");
			}
			return new ModelAndView("cart");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ModelAndView("cart");
		}
		
	}

	@PostMapping(value = "/addToCart/{productId}")
	public void addToCart(@PathVariable("productId") String productId, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			int cartId = cartDao.getCartByUserId(user.getId()).getId();
			CartProduct existingProduct = cartProductDao.getCartProductById(cartId, Integer.parseInt(productId));
			System.out.println(existingProduct);
			if (existingProduct != null) {
				System.out.println("444123");
				// Kullanıcı sepetinde aynı ürün varsa, miktarını artır
				existingProduct.setQuantity(existingProduct.getQuantity() + 1);
				cartProductDao.updateCartProduct(existingProduct);
			} else {
				System.out.println("123");
				// Kullanıcının sepetinde bu ürün yoksa, yeni bir ürün olarak ekle
				CartProduct cProduct = new CartProduct();
				cProduct.setCartId(cartId);
				cProduct.setProductId(Integer.parseInt(productId));
				cProduct.setQuantity(1);

				cartProductDao.addCartProduct(cProduct);
			}

			String referer = request.getHeader("Referer");
			if (referer != null) {
				response.sendRedirect(referer);
			} else {
				response.sendRedirect("/finalodev");
			}

		} else {
			response.sendRedirect("/finalodev/login");
		}
	}
	 @PostMapping("/finalodev/deleteFromCart/{productId}")
	    public String deleteFromCart(@PathVariable int productId, HttpSession session) {
	        int cartId = (int) session.getAttribute("cartId");
	        cartProductDao.deleteCartProduct(cartId, productId);
	        return "redirect:/finalodev/cart"; // Redirect to the cart page after deletion
	    }





}
