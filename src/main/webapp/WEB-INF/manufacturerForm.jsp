<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="container">
<c:if test="${empty manufacturer}">
<form action="/Manufacturer" method="post">
    <div class="form-group">
        <label for="name">Name_Manufacturer: </label> <br>
        <input type="text" class="form-control" id="name" placeholder="Enter Name Manufacturer" name="name"><br>
    <button type="submit" class="btn btn-default"> Submit</button>
    </div>

</form>
</c:if>

<c:if test="${!empty manufacturer}">
<form action="/Manufacturer" method="post">
    Id: ${manufacturer.id} <br>
    <div class="form-group">
        <label for="nam">Name_Manufacturer: </label> <br>
        <input type="text" class="form-control" id="nam" placeholder="Enter Name Manufacturer" name="name"><br>
        <button type="submit" class="btn btn-default"> Submit</button>
    </div>
</form>
</c:if>

</div>



</body>
</html>
