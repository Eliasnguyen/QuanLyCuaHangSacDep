<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h1></h1>
</body>
<%
    Salary salary = (Salary) session.getAttribute("salary");
    ArrayList<ServiceByStaff>  serviceByStaff = (ArrayList<ServiceByStaff>) session.getAttribute("list");
    if (salary.getStatus().equals("Da Thanh toan")){
        response.sendRedirect("ArlertNotToBeSaved.jsp?err=paid");
        session.setAttribute("salary", salary);
    }
    else {
        boolean b = new SalaryDAO().saveSalary(salary);
        if (b) {
            session.setAttribute("salary", salary);
            session.setAttribute("listInvoice", serviceByStaff);
            response.sendRedirect("Invoice.jsp");
        }
        // neu luu bi loi
//        System.out.println(salary.getMonthSalary());
    }
%>
