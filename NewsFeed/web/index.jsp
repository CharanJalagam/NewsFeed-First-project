
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.news.feed.helper.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- css -->
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 92%, 69% 100%, 25% 92%, 0 100%, 0 0);
            }
        </style>
    </head>
   
    <body
        
        <!-- navbar-->
        <%@include file="navbar.jsp" %>
        <!-- banner -->
        <div class="container-fluid m-0 p-0 banner-background">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3 class="display-3">Welcome to NewsFeed</h3>
                    <p>news around the world
                        Using the web to follow world news, local news, and information on natural disasters or weather events, is easy. You can get news from all over the world, from virtually every country, on every possible story, from politics to natural disasters.
                    </p>
                    <p>Online newspapers are how most people get the news these days from all over the world—every major newspaper in every country, in addition to most city newspapers, are freely available online for everyone to read.</p>
                    <a href="register_page.jsp"class=" btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start ! its free</a>
                    <a href="login_page.jsp" class=" btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>&nbsp;Login</a>
                </div>
            </div>
        </div>
        <!-- cards -->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Heart health has no age:</h5>
                            <p class="card-text">With five deaths reported owing to sudden cardiac arrest in the last 10 days in Telangana.</p>
                            <a href="#" class="btn primary-background text-white">Read more..</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Heart health has no age:</h5>
                            <p class="card-text">With five deaths reported owing to sudden cardiac arrest in the last 10 days in Telangana.</p>
                            <a href="#" class="btn primary-background text-white">Read more..</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Heart health has no age:</h5>
                            <p class="card-text">With five deaths reported owing to sudden cardiac arrest in the last 10 days in Telangana.</p>
                            <a href="#" class="btn primary-background text-white">Read more..</a>
                        </div>
                    </div>
                </div>
            </div>
             <div class="row">
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Heart health has no age:</h5>
                            <p class="card-text">With five deaths reported owing to sudden cardiac arrest in the last 10 days in Telangana.</p>
                            <a href="#" class="btn primary-background text-white">Read more..</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Heart health has no age:</h5>
                            <p class="card-text">With five deaths reported owing to sudden cardiac arrest in the last 10 days in Telangana.</p>
                            <a href="#" class="btn primary-background text-white">Read more..</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Heart health has no age:</h5>
                            <p class="card-text">With five deaths reported owing to sudden cardiac arrest in the last 10 days in Telangana.</p>
                            <a href="#" class="btn primary-background text-white">Read more..</a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
        <!-- javascript -->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
