<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Show All Manufacturer</title>
</head>
<body>
<table border=1>
    <thead>
    <tr>
        <th>Manufacturer_Id</th>
        <th>Manufacturer_Name</th>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td><c:out value="${manufacturers.id}" /></td>
            <td><c:out value="${manufacturers.name}" /></td>
        </tr>
    </tbody>
</table>
<p><a href="/Home">Main Manu</a></p>
</body>
</html>