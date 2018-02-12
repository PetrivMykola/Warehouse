<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Show All Manufacturer</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div class="well"><h1 align="center" style="color: rebeccapurple">Manufacturers</h1></div>
    <br>
    <input class="form-control" id="myInput" type="text" placeholder="Search..">
    <br>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Manufacturer_Id</th>
            <th>Manufacturer_Name</th>
            <th colspan=3> Action</th>
        </tr>
        </thead>
        <tbody id="myTable">
        <c:forEach items="${manufacturers}" var="manuf">
            <tr>
                <td><c:out value="${manuf.id}"/></td>
                <td><c:out value="${manuf.name}"/></td>
                <td><a href="/Manufacturer?action=edit&manufacturerId=<c:out value="${manuf.id}"/>">Update</a></td>
                <td><a href="/Manufacturer?action=delete&manufacturerId=<c:out value="${manuf.id}"/>">Delete</a></td>
                <td>
                    <a href="/Manufacturer?action=listProducts&manufacturerId=<c:out value="${manuf.id}"/>">ViewProduct</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>

    <div class="container">
        <div class="btn-group btn-group-justified">

            <a href="/Manufacturer?action=insert" class="btn btn-primary" role="button">Add Manfacturer</a>
            <a href="/Home" class="btn btn-primary" role="button">Main Manu</a>
        </div>
    </div>
</div>
</body>
</html>