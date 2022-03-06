<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hóa đơn thanh toán lương</title>
</head>
<body>



<%
    Salary salary = (Salary)session.getAttribute("salary");
%>
<form name="nhaptrangphuc" action="hienthi" method="get">
    <h3>Hóa đơn thanh toán lương</h3>
    <div class="card-body">

        <div class="form-group"><label><strong>Họ và
            tên: </strong></label><%=salary.getThanhVien().getName()%>
        </div>
        <div class="form-group"><label><strong>Ngày
            sinh: </strong></label><%=salary.getThanhVien().getBirth()%>
        </div>
        <div class="form-group"><label><strong>Chức
            vụ: </strong></label><%=salary.getThanhVien().getPosition()%>
        </div>
        <div class="form-group"><label><strong>Số điện
            thoại: </strong></label><%=salary.getThanhVien().getPhoneNumber()%>
        </div>
        <div class="form-group"><label><strong>Mức lương
            cứng: </strong></label><%=salary.getThanhVien().getFixedSalary()* 1000%>
        </div>
        <div class="form-group"><label><strong>Lương sản phẩm: </strong></label><%=salary.getGross_salary() - salary.getThanhVien().getFixedSalary() * 1000%>
        </div>

        <div class="form-group"><label><strong>Tổng lương: </strong></label><%=salary.getGross_salary()%>
        </div>




    </div>

    <table style="border: 1px solid black;border-collapse: collapse;" >
        <thead>
        <td style="border: 1px solid black; padding:0 15px 0 15px;">TT</td>
        <td style="border: 1px solid black; padding:0 15px 0 15px;">Tên</td>
        <td style="border: 1px solid black; padding:0 15px 0 15px;">Số lượng</td>
        <td style="border: 1px solid black; padding:0 15px 0 15px;">Đơn giá</td>
        <td style="border: 1px solid black; padding:0 15px 0 15px;">%Hoa hồng</td>
        <td style="border: 1px solid black; padding:0 15px 0 15px;">Thành tiền</td>
        </thead>
        <%

            ArrayList<ServiceByStaff>  list = (ArrayList<ServiceByStaff>) session.getAttribute("list");
            for (int i = 0; i < list.size(); i++) {
        %>
        <tr>
            <td style="text-align:center; padding:0 15px 0 15px;"><%=(i + 1)%></td>
            <td style="text-align:center; padding:0 15px 0 15px;"><%=list.get(i).getServiceName()%></td>
            <td style="text-align:center; padding:0 15px 0 15px;"><%=list.get(i).getQuantily()%></td>
            <td style="text-align:center; padding:0 15px 0 15px;"><%=list.get(i).getPrice()%></td>
            <td style="text-align:center; padding:0 15px 0 15px;"><%=list.get(i).getCommission()%></td>
            <td style="text-align:center; padding:0 15px 0 15px;"><%=list.get(i).getInMoney()%></td>
        </tr>
        <%}%>
    </table>
</form>
</body>
</html>
