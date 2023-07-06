<%@page import="com.news.feed.entities.*"%>
<%@page import="com.news.feed.dao.*"%>
<%@page import="com.news.feed.helper.*"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("CurrentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body>
        <!-- navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-newspaper-o">&nbsp;</span>NewsFeed</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-home">&nbsp;</span>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-address-book-o">&nbsp;</span>Contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-caret-square-o-down">&nbsp;</span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming</a>
          <a class="dropdown-item" href="#">Machine Learning</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Others</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#">More...</a>
      </li>
      <li class="nav-item">
          <a class="nav-link " data-toggle="modal" data-target="#do-post-Modal"><span class="fa fa-send">&nbsp;</span>Do Post</a>
      </li>
      
      
    </ul>
    <ul class="navbar-nav mr-right"> 
        <li class="nav-item">
        <a class="nav-link "data-toggle="modal" data-target="#profileModal" ><span class="fa fa-user-circle " ></span>&nbsp;<%= user.getName() %></a>
      </li>
        <li class="nav-item">
        <a class="nav-link " href="LogoutServlet"><span class="fa fa-user-plus "></span>&nbsp;Logout</a>
      </li>
    </ul>
  </div>
</nav>
        <!-- navbar ending-->
        <%  
                            Message m=(Message) session.getAttribute("msg");
                            if(m!=null){
                            %>
                            <div class="alert <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent()%>
                              </div>
                            <% 
                                }
                                session.removeAttribute("msg");
                            %>
                            
                            
                            <!--main body of the page-->
                            
                            <main>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4 mt-4">
                                            <!--categories-->
                                            <div class="list-group  ">
                                                <a href="#"onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action  text-white primary-background  "  >
                                                      All Posts
                                                    </a>
                                                <%  
                                                Postdao d=new Postdao(ConnectionProvider.getConnection());
                                                ArrayList<Categories> list1=d.getAllCategories();
                                                for(Categories cc : list1){
                                                %>
                                                <a href="#" onclick="getPosts(<%= cc.getCid()%>,this)"class="border border-success c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                                                    <% 
                                                        }
                                                    %>
                                                  </div>
                                        </div>
                                         <div class="col-md-8">
                                            <!--posts-->
                                            <div class="container text-center" id="loader">
                                                
                                                <i class="fa fa-refresh fa-4x fa-spin mt-2"></i>
                                                <h3 class="mt-2">Loading...</h3>
                                            </div>
                                            <div class="container-fluid" id="post-container">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                            
                            
                            <!--end of the page-->

                    <!-- Modal -->
                    <!-- profile modal -->
                    <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header primary-background">
                            <h5 class="modal-title" id="exampleModalLabel">NewsFeed</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                              
                              <div class="container text-center" >
                                  <img src="pics/<%= user.getProfile()%>" class="img-fluid"style="border-radius: 50% ;max-width:150px" >
                                  <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName() %></h5>
                                  <!-- details -->
                                    <div id="profile-details">
                                        <table class="table">

                                          <tbody>
                                            <tr>
                                              <th scope="row">ID</th>
                                              <td><%=user.getId()%></td>

                                            </tr>
                                            <tr>
                                              <th scope="row">Email</th>
                                              <td><%=user.getEmail()%></td>

                                            </tr>
                                            <tr>
                                              <th scope="row">Gender</th>
                                              <td><%=user.getGender()%></td>

                                            </tr>
                                            <tr>
                                              <th scope="row">About</th>
                                              <td><%=user.getAbout()%></td>

                                            </tr>
                                            <tr>
                                              <th scope="row">Registered On</th>
                                              <td><%=user.getDateTime()%></td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="profile-edit" style="display:none;">
                                        <h3 class="mt-2">Please Edit Carefully</h3>
                                        <form action="EditProfileServlet" method="post" enctype="multipart/form-data">
                                            <table class="table">
                                                <tr>
                                              <th >ID :</th>
                                              <td><%=user.getId()%></td>

                                            </tr>
                                            <tr>
                                              <th >Name </th>
                                              <td><input type="text" class="form-control"name="user_name" value="<%=user.getName()%>"></td>

                                            </tr>
                                            <tr>
                                              <th >Email </th>
                                              <td><input type="text"class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>

                                            </tr>
                                            <tr>
                                              <th >Password </th>
                                              <td><input type="password"class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>

                                            </tr>
                                            <tr>
                                              <th >About </th>
                                              <td><textarea rows="3" class="form-control" name="user_about" ><%=user.getAbout()%></textarea>
                                                </td>

                                            </tr>
                                            <tr>
                                              <th >New Profile </th>
                                              <td><input type="file" name="image" class="form-control">
                                                </td>

                                            </tr>
                                            </table>
                                                <button type="submit" class="btn btn-outline-primary primary-background text-white">Save</button>
                                        </form>
                                    </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" id="edit-profile-btn"class="btn btn-primary primary-background">EDIT</button>
                          </div>
                        </div>
                      </div>
                    </div>
                                                <!-- end ofprofile modal -->
                    <!-- end of modal -->
                            <!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="do-post-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        Postdao postd = new Postdao(ConnectionProvider.getConnection());
                                        ArrayList<Categories> list = postd.getAllCategories();
                                        for (Categories c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pAdditional" class="form-control" style="height: 200px;" placeholder="Enter any additional info(if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>


        <!--END add post modal-->
        
        
        <!-- javascript -->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                let editbtn=false;
                $('#edit-profile-btn').click(function(){
                    
                    if(editbtn===false){
                        $("#profile-details").hide()
                $("#profile-edit").show();
                        editbtn=true;
                        $(this).text("Back");
                    }
                    else{
                        $("#profile-details").show()
                $("#profile-edit").hide();
                        editbtn=false;
                        $(this).text("EDIT");
                    }
                
                });
            });
        </script>
        <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
//                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        <script>
            function getPosts(catId,temp){
                $("#loader").show();
                        $("#post-container").hide();
                        $(".c-link").removeClass('active');
                        $(".c-link").removeClass('primary-background');
                        $(".c-link").removeClass('text-white');
                        $(".c-link").removeClass('border border-success');
                $.ajax({
                    url:"load_post.jsp",
                    data:{cid:catId},
                    success:function (data,textStatus,jqXHR){
                        console.log(data);
                        $("#loader").hide();
                         $("#post-container").show();
                        $("#post-container").html(data)
                        $(temp).addClass('active')
                     $(temp).addClass('primary-background')
                        $(temp).addClass('text-white')
                        $(temp).addClass('border border-success')
                    }
                })
                
            }
            $(document).ready(function(e){
                let allPostRef=$('.c-link')[0]
                getPosts(0,allPostRef);
                
            })
        </script>
    </body>
</html>
