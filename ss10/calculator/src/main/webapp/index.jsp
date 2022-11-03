<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 29/09/2022
  Time: 4:13 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <style>
    *{
      font-family: sans-serif;
    }
    label{
      display: inline-block;
      width: 24%;
      margin-bottom: 12px;
    }
    .submit{
      display: flex;
      justify-content: center;
    }
  </style>
  <body>
  <h2>Simple Calculator</h2>
  <form action="calculator" style="width: 50%">
    <fieldset>
      <legend>Calculator</legend>
      <label for="operandFirst">First operand: </label>
      <input type="text" name="operandFirst" id="operandFirst">
      <br>
      <label for="operator">Operator</label>
      <select name="operator" id="operator">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
      </select>
      <br>
      <label for="operandSecond">Second operand: </label>
      <input type="text" name="operandSecond" id="operandSecond">
      <br>
      <div class="submit">
        <input type="submit" value="Calculate">
      </div>
    </fieldset>
  </form>
  </body>
</html>
