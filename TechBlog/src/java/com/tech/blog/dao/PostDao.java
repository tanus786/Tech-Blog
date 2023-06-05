/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            
            while(rs.next()){
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");
                
                Category c = new Category(cid,name,description);
                list.add(c);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    public boolean savePost(Post p){
        boolean f = false;
        try {
            String q = "insert into post(title, content , code , pics , catId, userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getTitle());
            pstmt.setString(2, p.getContent());
            pstmt.setString(3, p.getCode());
            pstmt.setString(4, p.getPics());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return f;
    }
    
}
