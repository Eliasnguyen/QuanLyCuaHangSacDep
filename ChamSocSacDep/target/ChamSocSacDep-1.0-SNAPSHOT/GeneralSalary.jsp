<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*,dao.*,model.*" %>
<%@ page import="model.Staff" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thông tin lương toàn bộ nhân viên</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<%
    int month = Integer.parseInt(request.getParameter("month"));
    int count = Integer.parseInt(request.getParameter("count"));
        ArrayList<Salary> ds = (new SalaryDAO().getAllInfoSalary(count,month));
     //   Collections.sort(ds);
%>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="GeneralSalary.jsp" class="navbar-brand"> Bang luong </a>
        </div>


    </nav>
</header>

<div class="d-flex flex-column">
    <div class="container-fluid">
            <div class="card shadow mb-5">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Bảng lương toàn bộ nhân viên</p>
                </div>
                <div class="card-body">
                    <div class="table-responsive table mt-2" id="dataTable" role="grid"
                         aria-describedby="dataTable_info">
                        <table class="table my-0" id="dataTable">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên Nhân Viên</th>
                                <th>Vị trí</th>
                                <th>Bậc lương</th>
                                <th>Tổng lương</th>
                                <th>Trạng thái</th>
                            </tr>
                            </thead>
                            <%
                                if (ds != null)
                                    for (int i = 0; i < ds.size(); i++) {
                                        System.out.println(ds.size());
                            %>

                            <tr>
                                <td><%=ds.get(i).getThanhVien().getId() %>
                                </td>

                                <td>
                                    <a

                                        href="SalaryDetailView.jsp?month=<%=month%>&idStaff=<%=ds.get(i).getThanhVien().getId()%>">
                                    <%=ds.get(i).getThanhVien().getName()%>


                                </a>
                                </td>
<%--                                style="text-align:center; padding:0 15px 0 15px;"--%>
                                <td ><%=ds.get(i).getThanhVien().getPosition() %>
                                </td>
                                <td><%=ds.get(i).getThanhVien().getSalaryRank() %>
                                </td>
                                <td><%=ds.get(i).getGross_salary() %>
                                </td>

                                <td ><%=ds.get(i).getStatus()%>
                                </td>

                            </tr>
                            <%} %>


                        </table>

                    </div>
                    <%--    <div class="row">--%>

                    <%--        <div class="col-md-6">--%>
                    <%--            <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">--%>
                    <%--                <ul class="pagination">--%>
                    <%--                    <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>--%>
                    <%--                    <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
                    <%--                    <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                    <%--                    <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                    <%--                    <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>--%>
                    <%--                </ul>--%>
                    <%--            </nav>--%>
                    <%--        </div>--%>
                    <%--    </div>--%>
                </div>

            </div>
        </div>
    </div>

<%--<button type="button" name="back" onclick="history.back()">Quay lại</button>--%>
</body>

</html>
