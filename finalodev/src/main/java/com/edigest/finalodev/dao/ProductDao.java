package com.edigest.finalodev.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.edigest.finalodev.model.Product;

@Repository
public class ProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    public List<Product> getProductsByName(String name) {
        String sqlGetProductsByName = "SELECT * FROM products WHERE name LIKE ?";
        String searchTerm = "%" + name + "%"; // Adding wildcard for partial matching
        
        return jdbcTemplate.query(sqlGetProductsByName, new Object[]{searchTerm}, (rs, rowNum) -> {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            product.setDescription(rs.getString("descr"));
            product.setImageUrl(rs.getString("imgurl"));
            product.setCategory(rs.getString("categori"));
            return product;
        });
    }
    // Retrieves all products from the database and returns them as a list
    public List<Product> getAllProducts() {
        String sqlGetProducts = "SELECT * FROM products";
        
        return jdbcTemplate.query(sqlGetProducts, (rs, rowNum) -> {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            product.setDescription(rs.getString("descr"));
            product.setImageUrl(rs.getString("imgurl"));
            product.setCategory(rs.getString("categori"));
            return product;
        });
    }

    // Retrieves a product by its id from the database
    public Product getProductById(int productId) {
        String sqlGetProductById = "SELECT * FROM products WHERE id = ?";
        
        return jdbcTemplate.queryForObject(sqlGetProductById, new Object[]{productId}, (rs, rowNum) -> {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            product.setDescription(rs.getString("descr"));
            product.setImageUrl(rs.getString("imgurl"));
            product.setCategory(rs.getString("categori"));
            return product;
        });
    }

    // Adds a new product to the database
    public void addProduct(Product product) {
        String sqlInsertProduct = "INSERT INTO products (name, price, descr, imgurl, categori) VALUES (?, ?, ?, ?, ?)";
        
        try {
            jdbcTemplate.update(sqlInsertProduct, new PreparedStatementSetter() {
                @Override
                public void setValues(PreparedStatement ps) throws SQLException {
                    ps.setString(1, product.getName());
                    ps.setDouble(2, product.getPrice());
                    ps.setString(3, product.getDescription());
                    ps.setString(4, product.getImageUrl());
                    ps.setString(5, product.getCategory());
                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Updates an existing product in the database
    public void updateProduct(Product product) {
        String sqlUpdateProduct = "UPDATE products SET name = ?, price = ?, descr = ?, imgurl = ?, categori = ? WHERE id = ?";
        
        try {
            jdbcTemplate.update(sqlUpdateProduct, new PreparedStatementSetter() {
                @Override
                public void setValues(PreparedStatement ps) throws SQLException {
                    ps.setString(1, product.getName());
                    ps.setDouble(2, product.getPrice());
                    ps.setString(3, product.getDescription());
                    ps.setString(4, product.getImageUrl());
                    ps.setString(5, product.getCategory());
                    ps.setInt(6, product.getId());
                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Deletes a product from the database by its id
    public void deleteProduct(int productId) {
        String sqlDeleteProduct = "DELETE FROM products WHERE id = ?";
        
        try {
            jdbcTemplate.update(sqlDeleteProduct, new Object[]{productId});
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public List<Product> getProductsByCategory(String category) {
        String sqlGetProductsByCategory = "SELECT * FROM products WHERE categori = ?";
        
        return jdbcTemplate.query(sqlGetProductsByCategory, new Object[]{category}, (rs, rowNum) -> {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            product.setDescription(rs.getString("descr"));
            product.setImageUrl(rs.getString("imgurl"));
            product.setCategory(rs.getString("categori"));
            return product;
        });
    }
}
