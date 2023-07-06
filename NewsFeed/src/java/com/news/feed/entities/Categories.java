
package com.news.feed.entities;


public class Categories {
    private int cid;
    private String name;
    private String description;

    public Categories(int cid, String name, String description) {
        this.cid = cid;
        this.name = name;
        this.description = description;
    }

    public Categories() {
    }

    public Categories(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public int getCid() {
        return cid;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
