/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.*;

public class Post {
  private int pid;  
  private String title;
  private String content;
  private String code;
  private String pics;
  private  Timestamp date;
  private int catId;
  private int  userId;

    public Post(int pid, String title, String content, String code, String pics, Timestamp date, int catId , int userId) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pics = pics;
        this.date = date;
        this.catId = catId;
        this.userId = userId;
    }

    public Post() {
    }

    public Post(String title, String content, String code, String pics, Timestamp date, int catId , int userId) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.pics = pics;
        this.date = date;
        this.catId = catId;
        this.userId = userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPics() {
        return pics;
    }

    public void setPics(String pics) {
        this.pics = pics;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
  
  
}
