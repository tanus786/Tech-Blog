package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
//    method to insert user data to database

    public boolean saveUser(User user) {
        boolean f = false;
        try {

            String q = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
//        get user email and password
    public User getUserByEmailAndPassword(String email, String password){
        User user = null;
        try {
            String q = "select * from user where email = ? and password =?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set=pstmt.executeQuery();
            if(set.next()){
                user = new User();
                String name = set.getString("name");
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setRdate(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean UpdateUser(User user){
        boolean f = false;
        try {
            String q = "update user set name = ? , email = ? , password = ?, about = ? , profile = ? where id = ?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getAbout());
            pstmt.setString(5,user.getProfile());
            pstmt.setInt(6,user.getId());
            pstmt.executeUpdate();
            f = true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
