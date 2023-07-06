
package com.news.feed.dao;
import com.news.feed.entities.*;
import java.sql.*;
import java.util.ArrayList;

public class Postdao {
    Connection con;

    public Postdao(Connection con) {
        this.con = con;
    }
    public ArrayList<Categories> getAllCategories(){
        ArrayList<Categories>list=new ArrayList<>();
        try{
            String query="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet rs=st.executeQuery(query);
            while(rs.next()){
                int cid=rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
                Categories c=new Categories(cid,name,description);
                list.add(c);
            }
        }catch(Exception e){
        e.printStackTrace();
        }
        return list;
    } 
    
    
    public boolean savePosts(Posts p) {
        boolean f = false;
        try {

            String q = "insert into posts(pTitle,pContent,pAdditional,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpAdditional());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    //get all posts
    public ArrayList<Posts> getAllPosts(){
    ArrayList<Posts> list2=new ArrayList<>();
       //fetch all posts
       try{
       PreparedStatement p=con.prepareStatement("select * from posts order by pId desc");
       ResultSet rs=p.executeQuery();
       while(rs.next()){
           int pId=rs.getInt("pId");
           String pTitle=rs.getString("pTitle");
           String pContent=rs.getString("pContent");
           String pAdditional=rs.getString("pAdditional");
           String pPic=rs.getString("pPic");
           Timestamp pDate=rs.getTimestamp("pDate");
           int catId=rs.getInt("catId");
           int userId=rs.getInt("userId");
           Posts ps=new Posts(pId, pTitle, pContent, pAdditional, pPic, pDate, catId, userId);
           list2.add(ps);
           
       }
       }catch(Exception e){
       e.printStackTrace();
       }
       
    return list2;
    }
    //get posts by categories
    public ArrayList<Posts> getPostsByCatId(int catId){
    ArrayList<Posts> list3=new ArrayList<>();
       //fetch all posts
       try{
       PreparedStatement p=con.prepareStatement("select * from posts where catId=?");
       p.setInt(1,catId);
       ResultSet rs=p.executeQuery();
       while(rs.next()){
           int pId=rs.getInt("pId");
           String pTitle=rs.getString("pTitle");
           String pContent=rs.getString("pContent");
           String pAdditional=rs.getString("pAdditional");
           String pPic=rs.getString("pPic");
           Timestamp pDate=rs.getTimestamp("pDate");
           
           int userId=rs.getInt("userId");
           Posts ps=new Posts(pId, pTitle, pContent, pAdditional, pPic, pDate, catId, userId);
           list3.add(ps);
           
       }
       }catch(Exception e){
       e.printStackTrace();
       }
       
    return list3;
    
    }
    
    public Posts getPostByPostId(int postid){
    Posts p=null;
    try{
        String q="select * from posts where pId=? ";
    PreparedStatement ps=con.prepareStatement(q);
    ps.setInt(1,postid);
    ResultSet rs=ps.executeQuery();
    if(rs.next()){
        int pId=rs.getInt("pId");
           String pTitle=rs.getString("pTitle");
           String pContent=rs.getString("pContent");
           String pAdditional=rs.getString("pAdditional");
           String pPic=rs.getString("pPic");
           int catId=rs.getInt("catId");
           Timestamp pDate=rs.getTimestamp("pDate");
           
           int userId=rs.getInt("userId");
           p=new Posts(pId, pTitle, pContent, pAdditional, pPic, pDate, catId, userId);
    
    }
    }catch(Exception e){
    e.printStackTrace();
    }
    
    
    return p;
    }
    
    public User getUserByUserId(int userid){
    User user=null;
    String query="select * from user where id=?";
    try{
    PreparedStatement ps=con.prepareStatement(query);
    ps.setInt(1, userid);
    ResultSet set=ps.executeQuery();
    if(set.next()){
    user=new User();
             //get data from db
                String name=set.getString("name");
               //assaining iit to the user object 
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("Password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
    }
    }catch(Exception e){
    e.printStackTrace();
    }
    return user;
    }
}
