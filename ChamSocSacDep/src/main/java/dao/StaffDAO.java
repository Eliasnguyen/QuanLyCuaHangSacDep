package dao;



import model.Staff;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

public class StaffDAO extends DAO{

    public StaffDAO() {
        super();
    }

    public boolean kiemtraDangnhap(Staff tv){
        boolean kq = false;
        if(tv.getUserName().contains("true") ||
                tv.getUserName().contains("=")||
                tv.getUserName().contains("true") ||
                tv.getUserName().contains("=")) return false;
        String sql = "{call kiemtraDN(?,?)}"; //su dung stored procedure
        try{
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1,tv.getUserName());
            cs.setString(2,tv.getPassWord());
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
   //             tv.setId(rs.getString("id"));
     //           tv.setName(rs.getString("nName"));
//hoten
//                Hoten ht = new Hoten();
//                ht.setHodem(rs.getString("ten"));
//                ht.setTen(rs.getString("ten"));
//                tv.setHoten(ht);
                kq = true;
            }
        }catch(Exception e){
            e.printStackTrace();
            kq = false;
        }
        return kq;
    }
    public Staff getInfoThanhVien(int id){
        Staff staff = new Staff();
        String sql = "{call getInfoUser(?)} ";
        try{CallableStatement cs = con.prepareCall(sql);
            cs.setInt(1,id);
            ResultSet rs = cs.executeQuery();
            if (rs.next()){
                staff.setId(rs.getString("id_staff"));
                staff.setName(rs.getString("staff_name"));
                staff.setBirth(formatDate(rs.getString("birth_day")));
                staff.setPhoneNumber(rs.getString("phone_number"));
                staff.setSalaryRank(rs.getInt("salary_rank"));
                String po = rs.getString(4);
                if(po.equals("1")) staff.setPosition("Quan ly");
                else if(po.equals("2")) staff.setPosition("Nhan vien");
                staff.setFixedSalary(rs.getInt("fixed_salary"));

            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return staff;
    }


    public ArrayList<Staff> getThanhVien(){
        String sql = "select * from tblStaff";
        ArrayList<Staff> ds = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Staff tv = new Staff();
                tv.setId(rs.getString(1));
                tv.setName(rs.getString(2));
                String po = rs.getString(3);
                if(po.equals("1")) tv.setPosition("Quan ly");
                else if(po.equals("0")) tv.setPosition("Nhan vien");
                ds.add(tv);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return ds;
    }
    public ArrayList<Staff> getTotalSalaryThanhVien(int id, int thang){
        String sql = "call";
        ArrayList<Staff> ds = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Staff tv = new Staff();
                tv.setId(rs.getString(1));
                tv.setName(rs.getString(2));
                String po = rs.getString(3);
                if(po.equals("1")) tv.setPosition("Quan ly");
                else if(po.equals("0")) tv.setPosition("Nhan vien");
                ds.add(tv);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return ds;
    }

    private String formatDate(String date) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        Date dateBirth = format.parse(date);
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String result = df.format(dateBirth);
        return  result;
    }

    public int countNhanVien(){
        String sql = "select * from tblStaff ";
        int count = 0;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                count++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;

    }

}
