import dao.StaffDAO;
import model.Staff;
import org.junit.Assert;
import org.junit.Test;

public class TestStaffDAO {
    StaffDAO staffDAO = new StaffDAO();
    @Test
    public void test_get_info_thanh_vien_standard1(){
        int id =1;
        Assert.assertNotNull(staffDAO.getInfoThanhVien(id));
    }
    @Test
    public void test_get_info_thanh_vien_standard2(){
        int id =11;
        Assert.assertNotNull(staffDAO.getInfoThanhVien(id));
    }

}
