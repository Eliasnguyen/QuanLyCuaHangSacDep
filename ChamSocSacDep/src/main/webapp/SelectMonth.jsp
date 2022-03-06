<%--
  Created by IntelliJ IDEA.
  User: elias
  Date: 11/5/21
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý cửa hàng chăm sóc sắc đẹp</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="SelectMonth.jsp" class="navbar-brand"> Ptit spa </a>
        </div>

    </nav>
</header>
<br>
<%
    if (request.getParameter("err") != null &&
            request.getParameter("err").equalsIgnoreCase("cast")) {
%> <h4>Vui lòng nhập lại!</h4><%
}%><%
    else if(request.getParameter("err") != null && request.getParameter("err").equals("noMonth")){
%> <h4>Không có dữ liệu của tháng này.Vui lòng nhập lại!</h4><%
    }
%>

<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <h2> Chọn tháng </h2>
            <form name="dangnhap" action="doCheckInput.jsp" method="post">

                <fieldset class="form-group">
                    <label>Tháng</label> <input type="text" class="form-control" name="month" id="month"
                                                  required="required">
                </fieldset>

                <button type="submit" class="btn btn-success">Hiện bảng lương</button>


            </form>
        </div>
    </div>
</div>
</body>
</html>

