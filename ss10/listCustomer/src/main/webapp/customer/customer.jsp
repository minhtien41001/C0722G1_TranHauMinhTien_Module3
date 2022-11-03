<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 03/11/2022
  Time: 10:50 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>
<body>
   <h1 style="align-content: center"> LIST CUSTOMER</h1>
   <table class="table table-primary">
       <tr>
           <th>Name</th>
           <th>Date of birth</th>
           <th>Address</th>
           <th>Picture</th>
       </tr>
       <c:forEach var="customer" items="${customerList}">
           <tr>
               <td>${customer.getName()}</td>
               <td>${customer.getDateOfBirth()}</td>
               <td>${customer.getAddress()}</td>
               <td>
                   <img style="width: 70px ; height: 50px" src="${customer.getPicture()}" >
               </td>
           </tr>
       </c:forEach>
   </table>
</body>
</html>
