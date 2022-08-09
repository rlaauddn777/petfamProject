<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <title>ADMIN PAGE</title>
      <link rel='stylesheet'
         href='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.4/semantic.css'>
      <link rel="stylesheet" href="admin_dist/style.css">
   </head>
   <body>
      <main class="main">
         <jsp:include page="admin_nav.jsp"></jsp:include>
         
         <!-- 	<div class="pusher">
            <div class="ui menu asd borderless" style="border-radius: 0 !important; border: 0; margin-left: 260px; -webkit-transition-duration: 0.1s;">
            	<a class="item openbtn"> <i class="icon content"></i></a> 
            	<a class="item">Messages </a>
            	<div class="right menu">
            		<div class="ui dropdown item">
            			Language <i class="dropdown icon"></i>
            			<div class="menu">
            				<a class="item">English</a> <a class="item">Russian</a> <a
            					class="item">Spanish</a>
            			</div>
            		</div>
            		<div class="item">
            			<div class="ui primary button">Sign Up</div>
            		</div>
            	</div>
            </div>
            </div> -->
            
            
		<jsp:include page="${admin_jsp }"></jsp:include>
         
            
         <!-- partial -->
         <script rc='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js'></script>
         <script src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.4/semantic.js'></script>
         <script src="admin_dist/script.js"></script>
      </main>
   </body>
</html>