
package com.news.feed.dao;
import com.news.feed.entities.User;
import java.sql.*;

public class Userdao {
    private Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }
    boolean f=false;
    public boolean saveUser(User user){
        try{
            
        String query="Insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
        PreparedStatement pstmt=this.con.prepareStatement(query);
        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getEmail());
        pstmt.setString(3, user.getPassword());
        pstmt.setString(4, user.getGender());
        pstmt.setString(5, user.getAbout());
        pstmt.executeUpdate();
        return f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    //getting user details by email and password
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
            try{
             String query="select * from user where email=? and password=?";
             PreparedStatement pstmt=con.prepareStatement(query);
             pstmt.setString(1, email);
             pstmt.setString(2,password);
             ResultSet set=pstmt.executeQuery();
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
    public boolean updateUser(User user){
        boolean f=false;
        try{
        String query="update user set name=? , email=? , password=? , about=? , profile=? where id=?";
        PreparedStatement pstmt=con.prepareStatement(query);
        pstmt.setString(1,user.getName());
        pstmt.setString(2,user.getEmail());
        pstmt.setString(3,user.getPassword());
        pstmt.setString(4,user.getAbout());
        pstmt.setString(5,user.getProfile());
        pstmt.setInt(6,user.getId());
        pstmt.executeUpdate();
        f=true;
        }catch(Exception e){
        e.printStackTrace();
        }
        return f;
    }
    
}
