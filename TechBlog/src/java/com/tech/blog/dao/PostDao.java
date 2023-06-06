/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);

            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");

                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
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

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
//        Fetch All the Post
        try {
            PreparedStatement p = con.prepareStatement("select * from post order by pid desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String title = set.getString("title");
                String content = set.getString("content");
                String code = set.getString("code");
                String pics = set.getString("pics");
                Timestamp date = set.getTimestamp("date");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, title, content, code, pics, date, catId, userId);

                list.add(post);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
//        Fetch Post Through CatID
        try {
            PreparedStatement p = con.prepareStatement("select * from post where catId = ?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String title = set.getString("title");
                String content = set.getString("content");
                String code = set.getString("code");
                String pics = set.getString("pics");
                Timestamp date = set.getTimestamp("date");
                int userId = set.getInt("userId");
                Post post = new Post(pid, title, content, code, pics, date, catId, userId);

                list.add(post);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
