package dao;

import model.Salary;
import model.Staff;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

public class SalaryDAO extends DAO {

    public SalaryDAO() {
        super();
    }
    public void checkSalary(int id, int thang, Salary salary){
        String sql = "{call checkSalary(?,?)} ";
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setInt(1,id);
            cs.setInt(2,thang);
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
                salary.setStatus("Da Thanh Toan");
            }else {
                salary.setStatus("Chua Thanh Toan");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public ArrayList<Salary> getAllInfoSalary(int count,int month){
        ArrayList<Salary> ds = new ArrayList<>();
        for(int i =1; i<=count; i++) {
            Salary salary = getInfoSalary(i, month);
            ds.add(salary);
        }
        return ds;
    }

    public Salary getInfoSalary(int idStaff, int month){
        String sqlCheckStatus = "{call checkSalary(?,?)}";
        Salary salary = new Salary();
        Staff staff = new Staff();
        try {
            CallableStatement cs = con.prepareCall(sqlCheckStatus);
            cs.setInt(1,idStaff);
            cs.setInt(2,month);
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
                //set thanh vien
                staff.setId(rs.getString("id_staff"));
                staff.setName(rs.getString("staff_name"));
                staff.setSalaryRank(rs.getInt("salary_rank"));
                staff.setBirth(formatDate(rs.getString("birth_day")));
                staff.setPhoneNumber(rs.getString("phone_number"));
                staff.setFixedSalary(Long.parseLong(rs.getString("fixed_salary")));
                if(rs.getInt("staff_position") == 1) staff.setPosition("Quan ly");
                else staff.setPosition("Nhan vien");
                // set thong tin luong

                salary.setThanhVien(staff);
                salary.setStatus("Da Thanh toan");
                salary.setMonthSalary(rs.getInt("monthSalary"));
                salary.setGross_salary(rs.getInt("gross_salary"));
            }else{//neu chua thanh toan thi se k tim thay

                salary = getInfoSalaryNotPaidYet(idStaff, month);

            }


        } catch (SQLException | ParseException throwables) {
            throwables.printStackTrace();
        }
        return salary;
    }

    public Salary getInfoSalaryNotPaidYet(int idStaff, int month){
//        System.out.println("da goi not paid");
        String sql = "{call getTongLuong(?,?)}";
        Salary salary = new Salary();
        salary.setThanhVien(getInfoWithSalary(idStaff));
        try {
            CallableStatement csSalary = con.prepareCall(sql);
            csSalary.setInt(1, idStaff);
            csSalary.setInt(2, month);
            ResultSet rsSalary = csSalary.executeQuery();
            if(rsSalary.next()){
                salary.setMonthSalary(month);
                salary.setGross_salary(rsSalary.getInt("fixed_salary")*1000+rsSalary.getInt("thunhap"));
                salary.setStatus("Chua thanh toan");
            }else {
                salary.setMonthSalary(month);
                salary.setGross_salary(0);
                salary.setStatus("Khong co luong");
                System.out.println("lam gi co luong");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  salary;
    }

    public boolean saveSalary(Salary salary){
        String sql = "INSERT INTO tblMonthlySalary(id_staff ,monthSalary,gross_salary) VALUES(?,?,?)";
        boolean kq = true;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,salary.getThanhVien().getId());
            ps.setInt(2,salary.getMonthSalary());
            ps.setLong(3,salary.getGross_salary());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            kq = false;
        }
        return kq;

    }
    public boolean checkIfMonth(int month){
        String sql = "select * from tblSlot where Month(dateOfSlot) ="+month;
        boolean kq = false;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                kq = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }


    public Staff getInfoWithSalary(int idStaff){
        Staff staff = new StaffDAO().getInfoThanhVien(idStaff);
        return staff;
    }
    private String formatDate(String date) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        Date dateBirth = format.parse(date);
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String result = df.format(dateBirth);
        return  result;
    }

}
