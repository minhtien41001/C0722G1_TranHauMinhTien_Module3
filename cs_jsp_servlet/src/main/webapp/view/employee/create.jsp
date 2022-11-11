<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 09/11/2022
  Time: 11:14 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Add new Employee</title>
    <style>
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
</head>
<body>
<div class="mx-5 px-5 pt-3">
    <h2 class="text-center fw-bold">Add new Employee</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <p class="text-center">
        <a href="/employee"><i class="fa-solid fa-backward"></i> Back to Employee list</a>
    </p>

    <c:if test="${mess!=null}">
        <c:if test="${check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-success alert-dismissible fade show w-50 text-center">
                    <strong>Congratulations!</strong> ${mess}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>

        <c:if test="${!check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-danger alert-dismissible fade show w-50 text-center">
                    <strong>Sorry!</strong> ${mess}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>
    </c:if>

    <div class="d-flex justify-content-center">

        <form class="w-50 border border-2 border-success p-3 bg-warning rounded" action="/employee?action=create"
              method="post">
            <div class="form-group">
                <label for="name" class="h6">Name:</label>
                <div class="input-group">
                    <input type="text" id="name" class="form-control" placeholder="Input name" name="name"
                           required pattern="^[A-Z][a-z]+( [A-Z][a-z]*)+$"
                           title="Tên nhân viên không được chứa số và các kí tự đầu tiên của mỗi từ phải viết hoa.">
                    <span class="input-group-text"><i class="fa-solid fa-person-circle-question"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="dateOfBirth" class="h6">Date of Birth:</label>
                <input type="date" id="dateOfBirth" class="form-control" name="dateOfBirth" min="${minAge}"
                       max="${maxAge}">
            </div>

            <div class="mt-3 form-group">
                <label for="idCard" class="h6">Id card:</label>
                <div class="input-group">
                    <input type="text" id="idCard" class="form-control" placeholder="Input Id card" name="idCard"
                           required pattern="^\d{9}|\d{12}$"
                           title="Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9).">
                    <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="salary" class="h6">Salary:</label>
                <div class="input-group">
                    <input type="text" id="salary" class="form-control" placeholder="Input Salary" name="salary"
                           required pattern="^[1-9]\d*[.]?\d+$"
                           title="Lương, Giá, Tiền đặt cọc phải là số dương.">
                    <span class="input-group-text"><i class="fa-solid fa-money-bill-wave"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="phone" class="h6">Phone number:</label>
                <div class="input-group">
                    <input type="text" id="phone" class="form-control" placeholder="Input Phone number" name="phone"
                           required pattern="^09[01]\d{7}|[(]84[)][+]9[01]\d{7}$"
                           title="Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx.">
                    <span class="input-group-text"><i class="fa-solid fa-square-phone"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="email" class="h6">Email:</label>
                <div class="input-group">
                    <input type="text" id="email" class="form-control" placeholder="Input Email" name="email"
                           required
                           pattern="^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]{2,}(\.[A-Za-z0-9]{2,}){1,2}$"
                           title="Địa chỉ email phải đúng định dạng.">
                    <span class="input-group-text"><i class="fa-solid fa-envelope-circle-check"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="address" class="h6">Address:</label>
                <div class="input-group">
                    <input type="text" id="address" class="form-control" placeholder="Input Address" name="address"
                           required pattern="^.+$" title="Vui lòng không để trống địa chỉ.">
                    <span class="input-group-text"><i class="fa-solid fa-map-location-dot"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="position">Position:</label>
                <div class="input-group">
                    <select id="position" class="form-control" name="position">
                        <c:forEach var="position" items="${positionList}">
                            <option value="${position.positionId}">${position.positionName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-map"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="educationDegree">Education degree:</label>
                <div class="input-group">
                    <select id="educationDegree" class="form-control" name="educationDegree">
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <option value="${educationDegree.educationDegreeId}">${educationDegree.educationDegreeName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-graduation-cap"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="division">Division:</label>
                <div class="input-group">
                    <select id="division" class="form-control" name="division">
                        <c:forEach var="division" items="${divisionList}">
                            <option value="${division.divisionId}">${division.divisionName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-brands fa-creative-commons-nd"></i></span>
                </div>
            </div>

            <div class="mt-3 text-center">
                <button class="btn btn-info btn-outline-success btn-sm border border-2 border-success text-dark">
                    -- Save <i class="fa-solid fa-floppy-disk"></i> --
                </button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>
