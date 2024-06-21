package com.edigest.finalodev.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.edigest.finalodev.model.CartProduct;

@Repository
public class CartProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<CartProduct> getAllCartProducts() {
        String sqlGetCartProducts = "SELECT * FROM cartpro";
        return jdbcTemplate.query(sqlGetCartProducts, (rs, rowNum) -> {
            CartProduct cartProduct = new CartProduct();
            cartProduct.setCartId(rs.getInt("cartid"));
            cartProduct.setProductId(rs.getInt("productid"));
            cartProduct.setQuantity(rs.getInt("amount"));
            return cartProduct;
        });
    }

    public CartProduct getCartProductById(int cartId, int productId) {
    	
    	try {
            String sqlGetCartProductById = "SELECT * FROM cartpro WHERE cartid = ? AND productid = ?";
            return jdbcTemplate.queryForObject(sqlGetCartProductById, new Object[]{cartId, productId}, (rs, rowNum) -> {
                CartProduct cartProduct = new CartProduct();
                cartProduct.setCartId(rs.getInt("cartid"));
                cartProduct.setProductId(rs.getInt("productid"));
                cartProduct.setQuantity(rs.getInt("amount"));
                return cartProduct;
            });
			
		} catch (Exception e) {
			return null;
			// TODO: handle exception
		}
    }

    public List<CartProduct> getCartProductsByCartId(int cartId) {
        String sqlGetCartProductByCartId = "SELECT * FROM cartpro WHERE cartid = ?";
        return jdbcTemplate.query(sqlGetCartProductByCartId, new Object[]{cartId}, (rs, rowNum) -> {
            CartProduct cartProduct = new CartProduct();
            cartProduct.setCartId(rs.getInt("cartid"));
            cartProduct.setProductId(rs.getInt("productid"));
            cartProduct.setQuantity(rs.getInt("amount"));
            return cartProduct;
        });
    }

    public void addCartProduct(CartProduct cartProduct) {
        String sqlInsertCartProduct = "INSERT INTO cartpro (cartid, productid, amount) VALUES (?, ?, ?)";
        jdbcTemplate.update(sqlInsertCartProduct, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, cartProduct.getCartId());
                ps.setInt(2, cartProduct.getProductId());
                ps.setInt(3, cartProduct.getQuantity());
            }
        });
    }

    public void updateCartProduct(CartProduct cartProduct) {
        String sqlUpdateCartProduct = "UPDATE cartpro SET amount = ? WHERE cartid = ? AND productid = ?";
        jdbcTemplate.update(sqlUpdateCartProduct, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, cartProduct.getQuantity());
                ps.setInt(2, cartProduct.getCartId());
                ps.setInt(3, cartProduct.getProductId());
            }
        });
    }

    public void deleteCartProduct(int cartId, int productId) {
        String sqlDeleteCartProduct = "DELETE FROM cartpro WHERE cartId = ? AND productId = ?";
        jdbcTemplate.update(sqlDeleteCartProduct, cartId, productId);
    }
}
