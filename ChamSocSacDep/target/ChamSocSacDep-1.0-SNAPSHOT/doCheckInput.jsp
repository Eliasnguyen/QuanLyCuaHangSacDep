<%--
  Created by IntelliJ IDEA.
  User: elias
  Date: 11/5/21
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="dao.*,model.*"%>
<%
        String month  = (String)request.getParameter("month");
        try {
            int monthInt = Integer.parseInt(month);
            response.sendRedirect("doCheckMonth.jsp?month="+monthInt);
        }catch (Exception e){
            response.sendRedirect("SelectMonth.jsp?err=cast");
        }


%>