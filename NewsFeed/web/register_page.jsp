
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
        <%@include file="navbar.jsp" %>
        <main class=" primary-background banner-background "  style="padding-bottom: 80px">
            <div class="container">
                
                    <div class="col-md-6 offset-md-3 ">
                        <div class="card ">
                            <div class="card-header primary-background text-white text-center ">
                                <span class="fa fa-user-circle fa-3x"></span>
                                <br>
                                Register here
                            </div>
                            <div class="card-body">
                                <form id="reg-form"action="RegisterServlet" method='POST'>
                                    <div class="form-group">
                                    <label for="username">User Name</label>
                                    <input type="text" name="user_name"class="form-control" id="username"  required="" placeholder="Enter name">
                                    
                                  </div>
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="user_email" class="form-control" required="" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                   <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                  </div>
                                  <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="user_password"required="" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                  </div>
                                    <div class="form-group">
                                    <label for="gender"> Select gender</label>
                                    <br>
                                    <input type="radio"  id="gender" name="gender"value="male" >Male
                                    <input type="radio"  id="gender" name="gender" value="female">Female
                                  </div>
                                    <div class="form-group">
                                        <textarea name="about"  class="form-control"  rows="3" placeholder="Enter something about yourself"></textarea>
                                        
                                    </div>
                                  <div class="form-check">
                                    <input type="checkbox" name="check"class="form-check-input" id="exampleCheck1">
                                    <label  class="form-check-label" for="exampleCheck1">agree terms & conditions</label>
                                  </div>
                                    <div class="container text-center" id="loader" style="display:none";>
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait....</h4>
                                    </div>
                                    <br>
                                  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                    
                                </form>
                            </div>
                            
                        </div>
                    </div>
                    
                
            </div>
        </main>
        <!-- javascript -->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>
