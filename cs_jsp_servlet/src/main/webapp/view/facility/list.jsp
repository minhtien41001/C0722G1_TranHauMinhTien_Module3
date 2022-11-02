<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 02/11/2022
  Time: 4:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Facility list</title>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <style>
        body {
            background-image: url("https://i.pinimg.com/originals/86/41/6d/86416d71cbd1e608a5304bb92fc235ea.png");
        }
        table {
            border: solid 3px;
        }
        a {
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="p-3">
    <h2 class="text-center fw-bold">FACILITY LIST</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <c:if test="${mess!=null}">
        <c:if test="${check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-success alert-dismissible fade show w-50 text-center">
                    <strong>${mess}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>

        <c:if test="${!check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-danger alert-dismissible fade show w-50 text-center">
                    <strong>${mess}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>
    </c:if>

    <nav class="navbar navbar-expand-lg py-0 my-0">
        <div class="container-fluid">
            <a href="/facility?action=create">
                <button class="btn btn-success btn-outline-secondary btn-sm">
                    <span class="fa-solid fa-house-medical text-light h5 my-auto me-1"></span>
                    <span class="text-light"> Add new Facility</span>
                </button>
            </a>

            <form class="d-flex my-2" role="search" action="/facility">
                <input class="form-control me-2" type="text" placeholder="Input find Service name"
                       aria-label="Search" name="nameSearch" style="width: 210%">
                <select class="form-control me-2" name="facilityTypeSearch">
                    <option value="">Facility type</option>
                    <c:forEach var="facilityType" items="${facilityTypeList}">
                        <option value="${facilityType.facilityTypeName}">${facilityType.facilityTypeName}</option>
                    </c:forEach>
                </select>
                <button class="btn btn-outline-success" type="submit" name="action" value="search">
                    <i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </nav>

    <table id="facilityTable" class="table table-light table-striped table-bordered">
        <thead>
        <tr class="table-dark text-light">
            <th class="text-center"><i class="fa-solid fa-dog"></i></th>
            <th>Name</th>
            <th>Area</th>
            <th>Cost</th>
            <th class="text-center">Max people</th>
            <th>Standard</th>
            <th>Description</th>
            <th>Pool area</th>
            <th class="text-center">Number of Floors</th>
            <th>Facility Free</th>
            <th>Rent type</th>
            <th>Facility type</th>
            <th class="text-center">Edit</th>
            <th class="text-center">Delete</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach varStatus="status" var="facility" items="${facilityList}">
            <tr>
                <td class="text-center">${status.count}</td>
                <td>${facility.facilityName}</td>
                <td>${facility.area}</td>
                <td>₫${String.format("%.0f", facility.cost)}</td>
                <td class="text-center">${facility.maxPeople}</td>

                <c:if test="${facility.standardRoom!=null}">
                    <td>${facility.standardRoom}</td>
                </c:if>
                <c:if test="${facility.standardRoom==null}">
                    <td>-</td>
                </c:if>

                <c:if test="${facility.descriptionOtherConvenience!=null}">
                    <td>${facility.descriptionOtherConvenience}</td>
                </c:if>
                <c:if test="${facility.descriptionOtherConvenience==null}">
                    <td>-</td>
                </c:if>

                <c:if test="${facility.poolArea!=0}">
                    <td>${facility.poolArea}</td>
                </c:if>
                <c:if test="${facility.poolArea==0}">
                    <td>-</td>
                </c:if>

                <c:if test="${facility.numberOfFloors!=0}">
                    <td class="text-center">${facility.numberOfFloors}</td>
                </c:if>
                <c:if test="${facility.numberOfFloors==0}">
                    <td class="text-center">-</td>
                </c:if>

                <c:if test="${facility.facilityFree!=null}">
                    <td>${facility.facilityFree}</td>
                </c:if>
                <c:if test="${facility.facilityFree==null}">
                    <td>-</td>
                </c:if>

                <c:forEach var="rentType" items="${rentTypeList}">
                    <c:if test="${rentType.rentTypeId == facility.rentTypeId}">
                        <td>${rentType.rentTypeName}</td>
                    </c:if>
                </c:forEach>
                <c:forEach var="facilityType" items="${facilityTypeList}">
                    <c:if test="${facilityType.facilityTypeId == facility.facilityTypeId}">
                        <td>${facilityType.facilityTypeName}</td>
                    </c:if>
                </c:forEach>
                <td class="text-center">
                    <a href="/facility?action=edit&id=${facility.facilityId}">
                        <button class="btn btn-primary btn-outline-secondary btn-sm">
                            <span class="fa-solid fa-house-circle-exclamation text-light h6 m-auto px-2"></span>
                        </button>
                    </a>
                </td>
                <td class="text-center">
                    <a href="/facility?action=delete&id=${facility.facilityId}" data-bs-toggle="modal"
                       data-bs-target="#exampleModal"
                       onclick="deleteFacility('${facility.getFacilityId()}','${facility.getFacilityName()}')">
                        <button class="btn btn-danger btn-outline-secondary btn-sm">
                            <span class="fa-solid fa-house-circle-xmark text-light h6 m-auto px-2"></span>
                        </button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="/facility" method="get">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">You Want To Delete?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="text" hidden name="idDelete" id="idDelete">
                        <input type="text" hidden name="action" value="delete">
                        <strong>Facility: </strong>
                        <span id="nameDelete" class="text-danger"></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function deleteFacility(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#facilityTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 7
        });
    });
</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous">
</script>
</html>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>
