package dao;

import model.ServiceByStaff;
import model.Staff;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ServiceByStaffDAO extends DAO{
    public ServiceByStaffDAO() {
        super();
    }

    public ArrayList<ServiceByStaff> getServiceByOneStaff(Staff staff, int month){

        ArrayList<ServiceByStaff> ds = new ArrayList<>();
        String sql = "{call getServiceByStaff(?,?)}";
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setInt(1,Integer.parseInt(staff.getId()));
            cs.setInt(2,month);
            ResultSet rs = cs.executeQuery();
            while (rs.next()){
                ServiceByStaff serviceByStaff = new ServiceByStaff();
                serviceByStaff.setThanhVien(staff);
                serviceByStaff.setCommission(rs.getInt("commission"));
                serviceByStaff.setServiceName(rs.getString("service_name"));
                serviceByStaff.setPrice(rs.getInt("price"));
                serviceByStaff.setQuantily(rs.getInt("soluong"));
                serviceByStaff.setRankStaff(rs.getInt("rank_of_staff"));
                serviceByStaff.setInMoney(rs.getInt("inmoney"));
                ds.add(serviceByStaff);
            }

        }catch ( SQLException throwables) {
            throwables.printStackTrace();
        }
        return ds;
    }
}
