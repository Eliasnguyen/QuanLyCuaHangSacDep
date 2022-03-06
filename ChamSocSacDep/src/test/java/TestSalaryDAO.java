import dao.DAO;
import dao.SalaryDAO;
import dao.StaffDAO;
import model.Salary;
import model.Staff;
import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.ArrayList;

public class TestSalaryDAO {
    SalaryDAO salaryDAO = new SalaryDAO();
    StaffDAO staffDAO = new StaffDAO();

    //Thang k ton tai
    @Test
    public void test_check_if_month_standard1(){
        int month = 5;
        boolean check = false;
        Assert.assertEquals(check, salaryDAO.checkIfMonth(month));
    }
    @Test
    public void test_check_if_month_standard2(){
        int month = 10;
        boolean check = true;
        Assert.assertEquals(check, salaryDAO.checkIfMonth(month));
    }

    // GetinfoThanhVien cua thanhVienDAO
//    @Test
//    public void test_get_Info_With_Salary_standard1(){
//
//    }

    @Test
    public void test_get_Info_Salary_Not_Paid_Yet_standard1(){
        //Nhan vien khong ton tai va thang khong ton tai
        int idStaf = 10;
        int month = 12;
        Salary salary = salaryDAO.getInfoSalaryNotPaidYet(idStaf,month);
        Assert.assertNotNull(salary);
    }
    @Test
    public void test_get_Info_Salary_Not_Paid_Yet_standard2(){
        //Nhan vien ton tai, thang khong lam chi co luong cung
        int idStaf = 3;
        int month = 9;
        Salary salary = salaryDAO.getInfoSalaryNotPaidYet(idStaf,month);
        System.out.println(salary.getMonthSalary());
        Assert.assertNotNull(salary);
    }
    // get thong tin neu da thanh toan
    @Test
    public void test_get_Info_Salary_standard1(){
        //chua thanh toan
        int month = 10;
        int idStaff = 1;
        String resul = "Chua thanh toan";
        Assert.assertEquals(resul, salaryDAO.getInfoSalary(idStaff, month).getStatus());
    }
    @Test
    public void test_get_Info_Salary_standard2(){
        //da thanh toan
        int month = 10;
        int idStaff = 3;
        String resul = "Chua thanh toan";
        Assert.assertEquals(resul, salaryDAO.getInfoSalary(idStaff, month).getStatus());
    }
    @Test
    public void test_get_All_Info_Salary_standard1(){
        int month = 10;
        //dem xem co bao nhieu nhan vien trong bang idStaff
        int count = staffDAO.countNhanVien();
        ArrayList<Salary> list = salaryDAO.getAllInfoSalary(count, month);
        Assert.assertNotNull(list);
    }
    // tai sao 7 khong co ma van equall not null,<Boi vi co luong cung nen mac dinh luong thang day la luong cung>
    @Test
    public void test_get_All_Info_Salary_standard2(){
        int month = 7;
        //dem xem co bao nhieu nhan vien trong bang idStaff
        int count = staffDAO.countNhanVien();
        ArrayList<Salary> list = salaryDAO.getAllInfoSalary(count, month);
        Assert.assertNotNull(list);
    }
    //truong hop da co trong csdl->trang thai = da thanh toan ->> do doluuhoadon xu ly
    @Test
    public void test_save_salary_standard1() throws SQLException {
        Salary salary = new Salary();
        Staff staff = new Staff();
        staff.setId("1");
        staff.setPosition("2");
        salary.setThanhVien(staff);
        salary.setMonthSalary(2);
        salary.setGross_salary(2400000);
        salary.setStatus("Da thanh toan");
        try {
            DAO.con.setAutoCommit(false);
            boolean b = salaryDAO.saveSalary(salary);
            Assert.assertTrue(b);

            //check db
            //id == thanhvien.setid
            Salary salary1 = salaryDAO.getInfoSalary(1,2);
            Assert.assertNotNull(salary1);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            DAO.con.rollback();
            DAO.con.setAutoCommit(true);
        }
    }
}
