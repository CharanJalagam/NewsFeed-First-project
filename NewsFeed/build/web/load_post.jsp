<%@page import="com.news.feed.helper.*" %>
<%@page import="com.news.feed.entities.*" %>
<%@page import="com.news.feed.dao.*" %>
<%@page import="java.util.*" %>
<div class="row">
<%
    User f=(User)session.getAttribute("CurrentUser");
Postdao p=new Postdao(ConnectionProvider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<Posts> post=null;
if(cid==0){
 post=p.getAllPosts();
    }else{
        post=p.getPostsByCatId(cid);
    }
    if(post.size()==0){
    out.println("<h3 class='display-3 text-center'>No Posts in this Category...</h3>");
    return;
    }
for(Posts s : post){
  %>
  <div class="col-md-6 mt-2">
      <div class="card">
          <div class="card-body">
              <img class="card-img-top" src="blog_pics/<%= s.getpPic() %>" alt="Card image cap">
              <b><%=s.getpTitle()%></b>
              <p><%=s.getpContent()%></p>
              <p><%=s.getpAdditional()%></p>
          </div>
          <div class="card-footer">
              <a href="post_page.jsp?post_id=<%= s.getPid()%>" class="btn btn-sm btn-outline-success" >Read More...</a>
              <%
                           LikeDao d=new LikeDao(ConnectionProvider.getConnection());
                           %>
              <a href="#"onclick="doLike(<%= s.getPid()%>,<%=f.getId()%>)" class="btn btn-outline-success btn-sm text-left"><i class="fa fa-thumbs-o-up">&nbsp;<span class="like-counter"><%=d.countLikeOnPost(s.getPid())%></span> </i></a>
              <a href="#" class="btn btn-outline-success btn-sm"><i class="fa fa-commenting-o">&nbsp;<span>10</span> </i></a>
          </div>
      </div>
  </div>
  
<%
    }

%>
<!-- javascript -->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
<script>
           function doLike(pid, uid)
{
    console.log(pid + "," + uid)
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    }

    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.trim() == "true")
            {
                let c = $(".like-counter").html();
                c++;
                $('.like-counter').html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data)
        }
    })
}
        </script>
</div>