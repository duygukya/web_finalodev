package com.edigest.finalodev.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.edigest.finalodev.model.Order;

@Repository
public class OrderDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Retrieves all orders from the database and returns them as a list
    public List<Order> getAllOrders() {
        String sqlGetOrders = "SELECT * FROM `order`";
        
        return jdbcTemplate.query(sqlGetOrders, (rs, rowNum) -> {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setAddress(rs.getString("address"));
            order.setDate(rs.getTimestamp("date"));
            order.setUserId(rs.getInt("userid"));
            order.setTotalPrice(rs.getDouble("totalprice"));
            order.setPayment(rs.getString("payment"));
            return order;
        });
    }

 // Retrieves orders by user id from the database
    public List<Order> getOrdersByUserId(int userId) {
        String sqlGetOrdersByUserId = "SELECT * FROM `order` WHERE userid = ?";
        
        return jdbcTemplate.query(sqlGetOrdersByUserId, new Object[]{userId}, (rs, rowNum) -> {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setAddress(rs.getString("address"));
            order.setDate(rs.getTimestamp("date"));
            order.setUserId(rs.getInt("userid"));
            order.setTotalPrice(rs.getDouble("totalprice"));
            order.setPayment(rs.getString("payment"));
            return order;
        });
    }

   

    // Adds a new order to the database
    public void addOrder(Order order) {
        String sqlInsertOrder = "INSERT INTO `order` (address, date, userid, totalprice, payment) VALUES (?, ?, ?, ?, ?)";
        
        try {
            jdbcTemplate.update(sqlInsertOrder, new PreparedStatementSetter() {
                @Override
                public void setValues(PreparedStatement ps) throws SQLException {
                    ps.setString(1, order.getAddress());
                    ps.setTimestamp(2, new java.sql.Timestamp(order.getDate().getTime()));
                    ps.setInt(3, order.getUserId());
                    ps.setDouble(4, order.getTotalPrice());
                    ps.setString(5, order.getPayment());
                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Updates an existing order in the database
    public void updateOrder(Order order) {
        String sqlUpdateOrder = "UPDATE `order` SET address = ?, date = ?, userid = ?, totalprice = ?, payment = ? WHERE id = ?";
        
        try {
            jdbcTemplate.update(sqlUpdateOrder, new PreparedStatementSetter() {
                @Override
                public void setValues(PreparedStatement ps) throws SQLException {
                    ps.setString(1, order.getAddress());
                    ps.setTimestamp(2, new java.sql.Timestamp(order.getDate().getTime()));
                    ps.setInt(3, order.getUserId());
                    ps.setDouble(4, order.getTotalPrice());
                    ps.setString(5, order.getPayment());
                    ps.setInt(6, order.getId());
                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Deletes an order from the database by its id
    public void deleteOrder(int orderId) {
        String sqlDeleteOrder = "DELETE FROM `order` WHERE id = ?";
        
        try {
            jdbcTemplate.update(sqlDeleteOrder, new Object[]{orderId});
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
