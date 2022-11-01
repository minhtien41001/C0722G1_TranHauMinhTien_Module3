<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 01/11/2022
  Time: 11:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Home</title>
  <link rel="stylesheet" href="/bootstrap-5.1.3/css/bootstrap.min.css">
  <style>
    body {
      background-image: url("https://cdn.wallpapersafari.com/97/50/eRwDMy.jpg");
    }
    form {
      background-image: url("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v960-ning-30.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=63dd5f402645ef52fb7dfb592aec765a");
    }
    a {
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    input:invalid {
      border-color: red;
    }
    input:valid {
      border-color: green;
    }
  </style>
  <style>
    .header {
      background-image: url("https://img.wallpapersafari.com/desktop/1600/900/22/47/iU4Gez.jpg");
    }
    a {
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    .footer {
      position: absolute;
      bottom: 0;
      background-image: url("https://wallpaperaccess.com/full/3953563.jpg");
    }
    .left {
      overflow: hidden;
      height: 520px;
    }
    .left:hover {
      overflow: scroll;
    }
    .zoom:hover {
      transform: scale(1.2);
    }
    .body {
      background-image: url("https://media.istockphoto.com/photos/abstract-blur-blue-gradient-color-background-with-bokeh-round-light-picture-id1310553941?b=1&k=20&m=1310553941&s=170667a&w=0&h=ceXJ-ZDLHlygjY53FQTNp5xpQ9lqRCkjD-RMJGUSvp0=");
    }
  </style>
</head>
<body>
<div class="container-fluid bg-gray-500 d-flex header" style="height: 100px">
  <img class="h-100 p-4" src="https://www.furama.com/images/LOGOFurama_4C_Normal.png" alt="">
  <img class="ms-5 ps-5" src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png"
       alt="">

  <div class="container-fluid text-end my-4 me-4">
    <span class="badge text-bg-warning mt-3">Trần Hậu Minh Tiến</span>
  </div>
</div>

<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid mx-5">
    <a class="navbar-brand font-weight-bold" href="/">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown ms-3">
          <a class="nav-link text-dark" href="/employee" role="button" >Employee</a>
        </li>

        <li class="nav-item dropdown ms-3">
          <a class="nav-link dropdown-toggle text-dark" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">Customer</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/customer">Customer list</a></li>
            <li><a class="dropdown-item" href="/customer?action=create">Add new Customer</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown ms-3">
          <a class="nav-link dropdown-toggle text-dark" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">Service</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/facility">Facility list</a></li>
            <li><a class="dropdown-item" href="/facility?action=create">Add new Facility</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown ms-3">
          <a class="nav-link dropdown-toggle text-dark" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">Contract</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/contract">Contract list</a></li>
            <li><a class="dropdown-item" href="/contract?action=create">Add new Contract</a></li>
          </ul>
        </li>
      </ul>

      <form class="d-flex my-2" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">
          <i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
    </div>
  </div>
</nav>

<div class="container-fluid body" style="height: 520px">
  <div class="row mx-3">
    <div class="col-2 left">
      <p class="ms-2 mt-2 text-success">Item 1</p>
      <img class="img-fluid zoom border border-primary" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkVmLmFswjaPR6nEZpl54_5iCVRwtZrf7ds6cnFnhH5DBRHAurKWkeKQc1OrF8jKURPGs&usqp=CAU" alt="">

      <p class="ms-2 mt-4 text-secondary">Item 2</p>
      <img class="img-fluid zoom border border-success" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi-taWYvyjOC_LUqwf5eHpUrgn-G2IqOqRowmd5rQoVMFW1D1OtrBioJhy1rZ319e96nc&usqp=CAU" alt="">

      <p class="ms-2 mt-4 text-success">Item 3</p>
      <img class="img-fluid zoom border border-danger" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9iS90e5jZmIgNx23HNAi4IFUwvjVCFhiZ4m1rj8C3PfYYFQPwuf9XJLcHijTMadm-QmM&usqp=CAU" alt="">

      <p class="ms-2 mt-4 text-secondary">Item 4</p>
      <img class="img-fluid zoom border border-warning" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWXGdKlUj-vG5q3kiSbZbXIZsvOV5arHkhn5IW24NExOxJBh1C12cfd2Q1jlEQLUqO2QQ&usqp=CAU" alt="">

      <p class="ms-2 mt-4 text-success">Item 5</p>
      <img class="img-fluid zoom border border-info" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWQfQa65lK7gySRtU6GwaV2LEIi7DdDg4N5mdR36doe06APb7d-L1-6B56DbAsUbhsonI&usqp=CAU" alt="">

      <p class="ms-2 mt-4 text-secondary">Item 6</p>
      <img class="img-fluid zoom border border-warning" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7YoFQEjitLVkwprh31XODzfX2nwG6_p9bZ8w0zAkN2WiBrbZ69iLoJZzLeeBUvHiT29s&usqp=CAU" alt="">

      <p class="ms-2 mt-4 text-success">Item 7</p>
      <img class="img-fluid zoom border border-success" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJDxUz9fzPbDof1B28f5_FLMNhNPor9MfjFQ&usqp=CAU" alt="">
    </div>

    <div class="col-10">
      <img class="img-fluid mt-4 ms-2 border border-4 border-light" src="http://ngocdiep.vn/wp-content/uploads/2020/12/4.flamigo-cat-ba.jpg" alt="">
    </div>
  </div>
</div>

<div class="container-fluid text-center footer" style="height: 50px">
  <p class="text-light pt-2">&copy;FURAMA - officially operated in 1997.</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>


<script src="bootstrap-5.1.3/js/bootstrap.min.js"></script>
</body>

</html>
