package com.edigest.finalodev.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.edigest.finalodev.model.User;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    public int addUser(User user) {
        String sqlInsertUser = "INSERT INTO user (name, email, password) VALUES (?, ?, ?)";

        try {
            KeyHolder keyHolder = new GeneratedKeyHolder();
            jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(sqlInsertUser, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getPassword());
                return ps;
            }, keyHolder);

            // Yeni eklenen kullanıcının ID'sini al
            return keyHolder.getKey().intValue();
        } catch (Exception e) {
            throw new RuntimeException("Kullanıcı eklenirken bir hata oluştu.", e);
        }
    }


    public User loginUser(String email, String password) {
        String sqlGetUserByEmailAndPassword = "SELECT * FROM user WHERE email = ? AND password = ?";

        User user = jdbcTemplate.queryForObject(sqlGetUserByEmailAndPassword, new Object[]{email, password}, (rs, rowNum) -> {
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setUsername(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            u.setRole(rs.getString("rol")); // Set user role
            return u;
        });

        return user;
    }

    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM user WHERE name = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{username}, new BeanPropertyRowMapper<>(User.class));
        } catch (Exception e) {
            return null; // Kullanıcı bulunamazsa null döndür
        }
    }
    public User getUserById(int userId) {
        String sqlGetUserById = "SELECT * FROM user WHERE id = ?";

        try {
            return jdbcTemplate.queryForObject(sqlGetUserById, new Object[]{userId}, new BeanPropertyRowMapper<>(User.class));
        } catch (Exception e) {
            throw new RuntimeException("Kullanıcı getirilirken bir hata oluştu.", e);
        }
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email = ?";
        
        User user = jdbcTemplate.queryForObject(sql, new Object[]{email}, (rs, rowNum) -> {
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setUsername(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            u.setRole(rs.getString("rol")); // Set user role
            return u;
        });
        
        return user;
    }
    public List<User> getAllUsers() {
        String sqlGetAllUsers = "SELECT * FROM user";

        try {
            return jdbcTemplate.query(sqlGetAllUsers, (rs, rowNum) -> {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("rol")); // Set user role
                return u;
            });
        } catch (Exception e) {
            throw new RuntimeException("Kullanıcılar getirilirken bir hata oluştu.", e);
        }
    }

    public int updateUser(User user) {
        String sqlUpdateUser = "UPDATE user SET name = ?, email = ?, password = ? WHERE id = ?";

        try {
            return jdbcTemplate.update(sqlUpdateUser, user.getUsername(), user.getEmail(), user.getPassword(), user.getId());
        } catch (Exception e) {
            throw new RuntimeException("Kullanıcı güncellenirken bir hata oluştu.", e);
        }
    }

    public int deleteUser(int userId) {
        String sqlDeleteUser = "DELETE FROM user WHERE id = ?";

        try {
            return jdbcTemplate.update(sqlDeleteUser, userId);
        } catch (Exception e) {
            throw new RuntimeException("Kullanıcı silinirken bir hata oluştu.", e);
        }
    }
}
