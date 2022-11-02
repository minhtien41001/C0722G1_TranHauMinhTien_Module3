<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 02/11/2022
  Time: 2:06 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Discount Calculator</title>
  </head>
  <body>
  <form action="/discount" method="post">
    <input type="text" required name="description" placeholder="Product Description">
    <input required name="price" type="text" placeholder="Enter Price">
    <input required name="discount" type="text" placeholder="Enter Discount Percent">
    <input type="submit" value="Calculate Discount">
  </form>
  </body>
</html>
