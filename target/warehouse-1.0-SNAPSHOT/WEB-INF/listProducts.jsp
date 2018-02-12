<%@ page import="net.petriv.warehouse.model.Manufacturer" %>
<%@ page import="java.util.List" %>
<%@ page import="net.petriv.warehouse.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Show All Products</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div class="well"><h1 align="center" style="color: rebeccapurple">Products</h1></div>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Product_Id</th>
            <th>Product_Name</th>
            <th>Product_Price</th>
            <th>Manufacter</th>
            <th colspan=2>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product">
            <tr>
                <td><c:out value="${product.id}"/></td>
                <td><c:out value="${product.name}"/></td>
                <td><c:out value="${product.price}"/></td>
                <td>
                    <a href="/Manufacturer?action=manufacturerInfo&manufacturerId=<c:out value="${product.manufacturer.id}"/>">${product.manufacturer.name}</a>
                </td>
                <td><a href="/Product?action=edit&productId=<c:out value="${product.id}"/>">Update</a></td>
                <td><a href="/Product?action=delete&productId=<c:out value="${product.id}"/>">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="container">
        <div class="btn-group btn-group-justified">

            <a href="/Product?action=insert" class="btn btn-primary" role="button">Add Product</a>
            <a href="/Home" class="btn btn-primary" role="button">Main Manu</a>
        </div>
    </div>
</div>
</body>
</html>
