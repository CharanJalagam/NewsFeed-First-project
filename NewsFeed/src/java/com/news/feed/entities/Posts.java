
package com.news.feed.entities;
import java.sql.*;


public class Posts {
    private int pid;
    private String pTitle;
    private String pContent;
    private String pAdditional;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private int userId;

    public Posts() {
    }

    public Posts(int pid, String pTitle, String pContent, String pAdditional, String pPic, Timestamp pDate, int catId ,int userId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pAdditional = pAdditional;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.userId=userId;
    }

    public Posts(String pTitle, String pContent, String pAdditional, String pPic, Timestamp pDate, int catId , int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pAdditional = pAdditional;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.userId=userId;
    }

    public int getPid() {
        return pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public String getpAdditional() {
        return pAdditional;
    }

    public String getpPic() {
        return pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public void setpAdditional(String pAdditional) {
        this.pAdditional = pAdditional;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
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
