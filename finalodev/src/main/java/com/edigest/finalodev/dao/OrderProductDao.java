package com.edigest.finalodev.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.edigest.finalodev.model.OrderProduct;

@Repository
public class OrderProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Retrieves all order products from the database and returns them as a list
    public List<OrderProduct> getAllOrderProducts() {
        String sqlGetOrderProducts = "SELECT * FROM orderproduct";
        
        return jdbcTemplate.query(sqlGetOrderProducts, (rs, rowNum) -> {
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrderId(rs.getInt("orderid"));
            orderProduct.setProductId(rs.getInt("productid"));
            orderProduct.setAmount(rs.getInt("amount"));
            return orderProduct;
        });
    }

    // Retrieves an order product by its orderId and productId from the database
    public OrderProduct getOrderProductById(int orderId, int productId) {
        String sqlGetOrderProductById = "SELECT * FROM orderproduct WHERE orderid = ? AND productid = ?";
        
        return jdbcTemplate.queryForObject(sqlGetOrderProductById, new Object[]{orderId, productId}, (rs, rowNum) -> {
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrderId(rs.getInt("orderid"));
            orderProduct.setProductId(rs.getInt("productid"));
            orderProduct.setAmount(rs.getInt("amount"));
            return orderProduct;
        });
    }
    public List<OrderProduct> getOrderProductsByOrderId(int orderid) {
        String sqlGetOrderProductsByUserId = 
            "SELECT op.* FROM orderproduct op " +
            "JOIN `order` o ON op.orderId = o.id " +
            "WHERE op.orderid = ?";
        
        return jdbcTemplate.query(sqlGetOrderProductsByUserId, new Object[]{orderid}, (rs, rowNum) -> {
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrderId(rs.getInt("orderid"));
            orderProduct.setProductId(rs.getInt("productId"));
            orderProduct.setAmount(rs.getInt("amount"));
            return orderProduct;
        });
    }

    // Adds a new order product to the database
    public void addOrderProduct(OrderProduct orderProduct) {
        String sqlInsertOrderProduct = "INSERT INTO orderproduct (orderid, productid, amount) VALUES (?, ?, ?)";
        
        try {
            jdbcTemplate.update(sqlInsertOrderProduct, new PreparedStatementSetter() {
                @Override
                public void setValues(PreparedStatement ps) throws SQLException {
                    ps.setInt(1, orderProduct.getOrderId());
                    ps.setInt(2, orderProduct.getProductId());
                    ps.setInt(3, orderProduct.getAmount());
                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Updates an existing order product in the database
    public void updateOrderProduct(OrderProduct orderProduct) {
        String sqlUpdateOrderProduct = "UPDATE orderproduct SET amount = ? WHERE orderid = ? AND productid = ?";
        
        try {
            jdbcTemplate.update(sqlUpdateOrderProduct, new PreparedStatementSetter() {
                @Override
                public void setValues(PreparedStatement ps) throws SQLException {
                    ps.setInt(1, orderProduct.getAmount());
                    ps.setInt(2, orderProduct.getOrderId());
                    ps.setInt(3, orderProduct.getProductId());
                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Deletes an order product from the database by its orderId and productId
    public void deleteOrderProduct(int orderId, int productId) {
        String sqlDeleteOrderProduct = "DELETE FROM orderproduct WHERE orderid = ? AND productid = ?";
        
        try {
            jdbcTemplate.update(sqlDeleteOrderProduct, new Object[]{orderId, productId});
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public List<OrderProduct> getOrderProductsByUserId(int userid) {
        String sqlGetOrderProductsByUserid = 
            "SELECT op.* FROM orderproduct op " +
            "JOIN `order` o ON op.orderid = o.id " +
            "WHERE o.userid = ?";
        
        return jdbcTemplate.query(sqlGetOrderProductsByUserid, new Object[]{userid}, (rs, rowNum) -> {
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrderId(rs.getInt("orderid"));
            orderProduct.setProductId(rs.getInt("productid"));
            orderProduct.setAmount(rs.getInt("amount"));
            return orderProduct;
        });
    }
}
