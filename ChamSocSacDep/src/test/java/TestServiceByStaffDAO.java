import dao.ServiceByStaffDAO;
import model.ServiceByStaff;
import model.Staff;
import org.junit.Assert;
import org.junit.Test;

import java.util.ArrayList;

public class TestServiceByStaffDAO {
    ServiceByStaffDAO serviceByStaffDAO = new ServiceByStaffDAO();
    @Test
    public void test_getServiceByOneStaff_standard1(){
        Staff staff = new Staff();
        staff.setId("1");
        ArrayList<ServiceByStaff> ds = serviceByStaffDAO.getServiceByOneStaff(staff,10);
        Assert.assertNotNull(ds);
    }
    @Test
    public void test_getServiceByOneStaff_standard2(){
        Staff staff = new Staff();
        staff.setId("1");
        ArrayList<ServiceByStaff> ds = serviceByStaffDAO.getServiceByOneStaff(staff,5);
        Assert.assertEquals(0,ds.size());
    }
}
