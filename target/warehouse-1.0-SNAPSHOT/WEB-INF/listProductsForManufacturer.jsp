
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>Show All Products</title>
</head>
<body>
<table border=1>
    <thead>
    <tr>
        <th>Product_Id</th>
        <th>Product_Name</th>
        <th>Product_Price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="product">
        <tr>
            <td><c:out value="${product.id}" /></td>
            <td><c:out value="${product.name}" /></td>
            <td><c:out value="${product.price}" /></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a href="/Manufacturer?action=list">List Manufacturer</a></p>
<p><a href="/Home">Main Manu</a></p>
</body>
</html>
