<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 02/11/2022
  Time: 4:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Update Facility</title>
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
</head>
<body>
<div class="mx-5 px-5 pt-3">
    <h2 class="text-center fw-bold">Update Facility</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <p class="text-center">
        <a href="/facility"><i class="fa-solid fa-backward"></i> Back to Facility list</a>
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

        <form class="w-50 border border-2 border-success p-3 bg-warning rounded" method="post">
            <div class="form-group" hidden>
                <label class="h6">Facility id:</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="id" value="${facility.facilityId}" readonly>
                    <span class="input-group-text"><i class="fa-solid fa-person-circle-question"></i></span>
                </div>
            </div>

            <c:forEach var="type" items="${facilityTypeList}">
                <c:if test="${facility.facilityTypeId==type.facilityTypeId}">
                    <div class="form-group">
                        <label class="h6">Facility type:</label>
                        <div class="input-group">
                            <input type="text" value="${facility.facilityTypeId}" name="type" hidden readonly>
                            <input type="text" class="form-control" value="${type.facilityTypeName}"
                                   readonly style="background-color: #b6bac2">
                            <span class="input-group-text"><i class="fa-solid fa-house-user"></i></span>
                        </div>
                    </div>
                </c:if>
            </c:forEach>

            <div class="form-group">
                <label for="name" class="h6">Facility name:</label>
                <div class="input-group">
                    <input type="text" id="name" class="form-control" name="name" value="${facility.facilityName}"
                           required pattern="^([A-Z][a-z]+ )+\d*$"
                           title="Tên dịch vụ được phép chứa số và các kí tự đầu tiên của mỗi từ phải viết hoa.">
                    <span class="input-group-text"><i class="fa-solid fa-file-signature"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="area" class="h6">Area (m<sup>2</sup>):</label>
                <div class="input-group">
                    <input type="number" id="area" class="form-control" name="area" value="${facility.area}"
                           required pattern="^[1-9]\d*$" title="Diện tích dịch vụ phải là số nguyên dương.">
                    <span class="input-group-text"><i class="fa-solid fa-chart-area"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="cost" class="h6">Cost:</label>
                <div class="input-group">
                    <input type="text" id="cost" class="form-control" name="cost" value="${facility.cost}"
                           required pattern="^[1-9]\d*[.]?\d+$" title="Lương, Giá, Tiền đặt cọc phải là số dương.">
                    <span class="input-group-text"><i class="fa-solid fa-dollar-sign"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="maxPeople" class="h6">Maximum number of people:</label>
                <div class="input-group">
                    <input type="number" id="maxPeople" class="form-control" name="maxPeople"
                           value="${facility.maxPeople}" required pattern="^[1-9]\d*$"
                           title="Số lượng, Số tầng phải là số nguyên dương.">
                    <span class="input-group-text"><i class="fa-solid fa-person"></i></span>
                </div>
            </div>

            <c:if test="${facility.facilityTypeId==1 or facility.facilityTypeId==2}">
                <div class="mt-3 form-group">
                    <label for="standardRoom" class="h6">Standard room:</label>
                    <div class="input-group">
                        <input type="text" id="standardRoom" class="form-control" name="standardRoom"
                               value="${facility.standardRoom}">
                        <span class="input-group-text"><i class="fa-solid fa-star"></i></span>
                    </div>
                </div>
            </c:if>
            <c:if test="${facility.facilityTypeId==3}">
                <div class="mt-3 form-group" hidden>
                    <label class="h6">Standard room:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="standardRoom"
                               value="-">
                        <span class="input-group-text"><i class="fa-solid fa-star"></i></span>
                    </div>
                </div>
            </c:if>

            <c:if test="${facility.facilityTypeId==1 or facility.facilityTypeId==2}">
                <div class="mt-3 form-group">
                    <label for="description" class="h6">Description other convenience:</label>
                    <div class="input-group">
                        <input type="text" id="description" class="form-control" name="description"
                               value="${facility.descriptionOtherConvenience}">
                        <span class="input-group-text"><i class="fa-solid fa-book"></i></span>
                    </div>
                </div>
            </c:if>
            <c:if test="${facility.facilityTypeId==3}">
                <div class="mt-3 form-group" hidden>
                    <label class="h6">Description other convenience:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="description" value="-">
                        <span class="input-group-text"><i class="fa-solid fa-book"></i></span>
                    </div>
                </div>
            </c:if>

            <c:if test="${facility.facilityTypeId==1}">
                <div class="mt-3 form-group">
                    <label for="poolArea" class="h6">Pool area (m<sup>2</sup>):</label>
                    <div class="input-group">
                        <input type="text" id="poolArea" class="form-control" name="poolArea"
                               value="${facility.poolArea}" required pattern="^0|[1-9]\d*[.]?\d+$"
                               title="Diện tích hồ bơi phải là số dương.">
                        <span class="input-group-text"><i class="fa-solid fa-person-swimming"></i></span>
                    </div>
                </div>
            </c:if>
            <c:if test="${facility.facilityTypeId==2 or facility.facilityTypeId==3}">
                <div class="mt-3 form-group" hidden>
                    <label class="h6">Pool area (m<sup>2</sup>):</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="poolArea" value="0">
                        <span class="input-group-text"><i class="fa-solid fa-person-swimming"></i></span>
                    </div>
                </div>
            </c:if>

            <c:if test="${facility.facilityTypeId==1 or facility.facilityTypeId==2}">
                <div class="mt-3 form-group">
                    <label for="numberOfFloors" class="h6">Number of floors:</label>
                    <div class="input-group">
                        <input type="number" id="numberOfFloors" class="form-control" name="numberOfFloors"
                               value="${facility.numberOfFloors}" required pattern="^0|[1-9]\d*$"
                               title="Số lượng, Số tầng phải là số nguyên dương.">
                        <span class="input-group-text"><i class="fa-solid fa-building"></i></span>
                    </div>
                </div>
            </c:if>
            <c:if test="${facility.facilityTypeId==3}">
                <div class="mt-3 form-group" hidden>
                    <label class="h6">Number of floors:</label>
                    <div class="input-group">
                        <input type="number" class="form-control" name="numberOfFloors" value="0">
                        <span class="input-group-text"><i class="fa-solid fa-building"></i></span>
                    </div>
                </div>
            </c:if>

            <c:if test="${facility.facilityTypeId==3}">
                <div class="mt-3 form-group">
                    <label for="facilityFree" class="h6">Facility free:</label>
                    <div class="input-group">
                        <input type="text" id="facilityFree" class="form-control" name="facilityFree"
                               value="${facility.facilityFree}">
                        <span class="input-group-text"><i class="fa-solid fa-gift"></i></span>
                    </div>
                </div>
            </c:if>
            <c:if test="${facility.facilityTypeId==1 or facility.facilityTypeId==2}">
                <div class="mt-3 form-group" hidden>
                    <label class="h6">Facility free:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="facilityFree" value="-">
                        <span class="input-group-text"><i class="fa-solid fa-gift"></i></span>
                    </div>
                </div>
            </c:if>

            <div class="mt-3 form-group">
                <label class="h6" for="rentType">Rent type:</label>
                <div class="input-group">
                    <select id="rentType" class="form-control" name="rentType">
                        <c:forEach var="rentType" items="${rentTypeList}">
                            <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-business-time"></i></span>
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
