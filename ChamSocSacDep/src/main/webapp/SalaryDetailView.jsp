<%--
  Created by IntelliJ IDEA.
  User: elias
  Date: 11/22/21
  Time: 8:46 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%
    int idStaff = Integer.parseInt(request.getParameter("idStaff"));
    int month = Integer.parseInt(request.getParameter("month"));
    //  ThanhVien staff = (new ThanhVienDAO()).getInfoThanhVien(idStaff);
  //  ArrayList<ServiceByStaff> ds = new ServiceByStaffDAO().getServiceByOneStaff(staff, 10);
    Salary salary = new SalaryDAO().getInfoSalary(idStaff,month);
    Staff staff = salary.getThanhVien();
    ArrayList<ServiceByStaff> ds = new ServiceByStaffDAO().getServiceByOneStaff(salary.getThanhVien(), month);



%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">

            </nav>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Chi tiết lương nhân viên</h3>
                <div class="row mb-3">
                    <div class="col-lg-4">
                        <div class="card mb-3">
                            <div class="card-body text-center shadow"><img class="rounded-circle mb-3 mt-4"
                                                                           src="assets/img/dogs/image2.jpeg" width="160"
                                                                           height="160">
                                <%--                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Change Photo</button></div>--%>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">

                        <div class="row">
                            <div class="col">
                                <div class="card shadow mb-3">
                                    <div class="card-header py-3">
                                        <p class="text-primary m-0 font-weight-bold">Thông tin nhân viên</p>
                                    </div>
                                    <div class="card-body">


                                        <div class="form-group"><label><strong>Họ và
                                            tên: </strong></label><%=staff.getName()%>
                                        </div>
                                        <div class="form-group"><label><strong>Ngày
                                            sinh: </strong></label><%=staff.getBirth()%>
                                        </div>
                                        <div class="form-group"><label><strong>Chức
                                            vụ: </strong></label><%=staff.getPosition()%>
                                        </div>
                                        <div class="form-group"><label><strong>Số điện
                                            thoại: </strong></label><%=staff.getPhoneNumber()%>
                                        </div>
                                        <div class="form-group"><label><strong>Mức lương
                                            cứng: </strong></label><%=staff.getFixedSalary()* 1000%>
                                        </div>
                                        <div class="form-group"><label><strong>Lương sản phẩm: </strong></label><%=salary.getGross_salary() - staff.getFixedSalary() * 1000%>
                                        </div>

                                        <div class="form-group"><label><strong>Tổng lương: </strong></label><%=salary.getGross_salary()%>
                                        </div>

                                        <form action="doSaveInvoice.jsp" method="post">
                                            <%session.setAttribute("salary",salary);
                                              session.setAttribute("list",ds);
                                            %>
                                            <table border="0">
                                                <tr>
                                                    <td><input type="submit" value="Thanh toán"/></td>
                                                </tr>
                                            </table>
                                        </form>

                                    <%--                                        <div class="form-group"><label><strong>Thu nhập: </strong></label><%=%>--%>
<%--                                        </div>--%>

                                        <%--                                        <form>--%>
                                        <%--                                            <div class="form-row">--%>
                                        <%--                                                <div class="col">--%>
                                        <%--                                                    <div class="form-group"><label for="username"><strong>Username</strong></label><input class="form-control" type="text" placeholder="user.name" name="username"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                                <div class="col">--%>
                                        <%--                                                    <div class="form-group"><label for="email"><strong>Email Address</strong></label><input class="form-control" type="email" placeholder="user@example.com" name="email"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                            <div class="form-row">--%>
                                        <%--                                                <div class="col">--%>
                                        <%--                                                    <div class="form-group"><label for="first_name"><strong>First Name</strong></label><input class="form-control" type="text" placeholder="John" name="first_name"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                                <div class="col">--%>
                                        <%--                                                    <div class="form-group"><label for="last_name"><strong>Last Name</strong></label><input class="form-control" type="text" placeholder="Doe" name="last_name"></div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                            <div class="form-group"><button class="btn btn-primary btn-sm" type="submit">Save Settings</button></div>--%>
                                        <%--                                        </form>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card shadow mb-5">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 font-weight-bold">Bảng kê chi tiết lương</p>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <%--                            <div class="col-md-6 text-nowrap">--%>
                            <%--                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label>Show&nbsp;<select class="form-control form-control-sm custom-select custom-select-sm">--%>
                            <%--                                    <option value="10" selected="">10</option>--%>
                            <%--                                    <option value="25">25</option>--%>
                            <%--                                    <option value="50">50</option>--%>
                            <%--                                    <option value="100">100</option>--%>
                            <%--                                </select>&nbsp;</label></div>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col-md-6">--%>
                            <%--                                <div class="text-md-right dataTables_filter" id="dataTable_filter"><label><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>--%>
                            <%--                            </div>--%>
                        </div>
                        <div class="table-responsive table mt-2" role="grid" aria-describedby="dataTable_info">
                            <table class="table my-0">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tên dịch vụ</th>
                                    <th>Đơn giá</th>
                                    <th>Số lượng</th>
                                    <%--                                    <th>Thành tiền </th>--%>
                                    <th>% Hoa hồng</th>
                                    <th>Thực nhận</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if (ds != null)
                                        for (int i = 0; i < ds.size(); i++) {
                                %>

                                <tr>
                                    <td><%=i + 1 %>
                                    </td>
                                    <td><%=ds.get(i).getServiceName() %>
                                    </td>

                                    </td>
                                    <%--                                style="text-align:center; padding:0 15px 0 15px;"--%>
                                    <td><%=ds.get(i).getPrice() * 1000 %>
                                    </td>
                                    <td><%=ds.get(i).getQuantily() %>
                                    </td>
                                    <td><%=ds.get(i).getCommission() %>
                                    </td>

                                    <td><%=ds.get(i).getInMoney()%>
                                    </td>
                                </tr>
                                <%} %>
                                <%--                                <tr>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>Làm móng </td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>10</td>--%>
                                <%--                                    <td>1.900</td>--%>
                                <%--                                </tr>--%>
                                <%--                                <tr>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>Làm móng </td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>10</td>--%>
                                <%--                                    <td>1.900</td>--%>
                                <%--                                </tr> <tr>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>Làm móng </td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>10</td>--%>
                                <%--                                    <td>1.900</td>--%>
                                <%--                                </tr> <tr>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>Làm móng </td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>10</td>--%>
                                <%--                                    <td>1.900</td>--%>
                                <%--                                </tr> <tr>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>Làm móng </td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>1</td>--%>
                                <%--                                    <td>19.000</td>--%>
                                <%--                                    <td>10</td>--%>
                                <%--                                    <td>1.900</td>--%>
                                <%--                                </tr>--%>
                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>



        </div>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="assets/js/script.min.js"></script>
</body>

</html>