<%--
  Created by IntelliJ IDEA.
  User: elias
  Date: 12/19/21
  Time: 11:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="dao.*,model.*"%>
<%
    String month  = (String)request.getParameter("month");
        if(new SalaryDAO().checkIfMonth(Integer.parseInt(month))) {
            int count = new StaffDAO().countNhanVien();
            response.sendRedirect("GeneralSalary.jsp?month="+month+"&count="+count);

    } else  response.sendRedirect("SelectMonth.jsp?err=noMonth");


%>