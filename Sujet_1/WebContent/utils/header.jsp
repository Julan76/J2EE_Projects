<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= request.getParameter("title") %></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/Sujet_1/ext/bootstrap/3.2.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/Sujet_1/ext/bootstrap/3.2.2/css/styles.css">
</head>


<body>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
    	
    	<div class="navbar-header">
      		<a class="navbar-brand" href="<%= request.getContextPath()%>/index.jsp"><%= request.getParameter("title") %></a>
    	</div>
    
    <div>
    
    	<!-- When the user input the right email and password -->
      	<% if(session.getAttribute("user") != null) { %>
		
		<ul class="nav navbar-nav pull-right">
        	<li class="dropdown">
          		<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
          			<span class="glyphicon glyphicon-user" aria-hidden="true"></span> 
          			
		<%
			User user = (User) session.getAttribute("user");
			String nom = user.getNom();
			String prenom = user.getPrenom();
		%>
		
			<%= prenom %>&nbsp&nbsp<%= nom %>
		
          			<span class="caret"></span>
          		</a>
          		
         		<ul class="dropdown-menu" role="menu">
        			<li><a href="<%= request.getContextPath()%>/#">Mon profil</a></li>
            		<li><a href="<%= request.getContextPath()%>/LogoutServlet">Deconnexion</a></li>
        		</ul>
        		
        	</li>
         </ul>
		
		<!-- When the password or the email address is wrong -->
		<% } else if (session.getAttribute("wrongPwd") != null){ %>
	
		<form class="navbar-form form-inline pull-right"  action="<%= request.getContextPath()%>/LoginServlet">

			<div class="alert alert-danger alert-dismissible" role="alert">Wrong password!</div>
			<input type="text" class="form-control" placeholder="john@example.com" name="email">
    		<input type="password" class="form-control" placeholder="Password" name="password">
    		<br/>
    		<div class="checkbox">
    			<label>
      				<input type="checkbox">Garder ma session active
    			</label>
  			</div>
  			<span>&nbsp&nbsp&nbsp</span><a href="inscription.jsp">Inscription</a>
    		<button type="submit" class="btn btn-default">Sign in</button>
    		
 		</form>
	
	<% } else {%>
		
		<form class="navbar-form form-inline pull-right"  action="<%= request.getContextPath()%>/LoginServlet">
		
    		<input type="text" class="form-control" placeholder="john@example.com" name="email">
    		<input type="password" class="form-control" placeholder="Password" name="password">
    		<br/>
    		<div class="checkbox">
    			<label>
      				<input type="checkbox">Garder ma session active
    			</label>
  			</div>
  			<span>&nbsp&nbsp&nbsp</span><a href="inscription.jsp">Inscription</a>
    		<button type="submit" class="btn btn-default">Sign in</button>
    		
		</form>
	
	<% } %>
	
	</div>	    
  </div>
</nav>
<!-- container, body and HTML tags are still opened -->