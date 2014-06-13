<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
    pageEncoding="ISO-8859-1"%>  
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
  
<html>  
   <head>  
 <title>Spring MVC Form Handling</title>  
   </head>  
<body>  
<h2>  
Submitted Employee Information</h2>  
<table border="1"><tbody>  
<tr>     <td>user first name</td>      <td>${firstName}</td>   </tr>  
<tr>      <td>user last name</td>      <td>${lastName}</td>  </tr>  
 
</tbody></table>  
</body>  
</html>