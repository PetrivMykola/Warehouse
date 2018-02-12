<%@ page import="net.petriv.warehouse.dao.ManufacturerDao" %>
<%@ page import="java.util.List" %>
<%@ page import="net.petriv.warehouse.model.Manufacturer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
    <title>Title</title>
</head>
<body>

<%ManufacturerDao dao = new ManufacturerDao();
    List<Manufacturer> list = dao.getAll();
    request.setAttribute("list", list);%>

<c:if test="${empty products}">
<form action="/Product" method="post">
    Name: <input type="text" name="name"><br>
    Price: <input type="text" name="price"><br>
    Manufacturer: <select name="manufacturerId">

    <c:forEach items="${list}" var="manufacturer">
         <option value="${manufacturer.id}"> ${manufacturer.name} </option>
     </c:forEach>

    </select> <br>

    <p><input type="submit" value="submit"></p>
    </c:if>

<c:if test="${!empty products}">
    <form action="/Product" method="post">
        Id: ${products.id} <br>
        Name: <input type="text" name="name"><br>
        Price: <input type="text" name="price"><br>
        Manufacturer: <select name="manufacturerId">

        <c:forEach items="${list}" var="manufacturer">
            <option value="${manufacturer.id}"> ${manufacturer.name} </option>
        </c:forEach>

    </select> <br>

        <p><input type="submit" value="submit"></p>
        </c:if>
</form>
</body>
</html>
