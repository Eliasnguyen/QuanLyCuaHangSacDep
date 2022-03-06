<%--
  Created by IntelliJ IDEA.
  User: elias
  Date: 12/19/21
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hóa đơn thanh toán lương</title>
</head>
<body>
<%
    if(request.getParameter("err").equalsIgnoreCase("paid")){
     %>
    <h4 color = "red">Nhân viên này đã được thanh toán lương</h4>
    <button type="button" name="back" onclick="history.back()">Quay lại</button>

<%
    }%>
</body>
</html>