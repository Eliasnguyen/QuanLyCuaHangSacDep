import dao.StaffDAO;
import model.Staff;
import org.junit.Assert;
import org.junit.jupiter.api.Test;

public class LoginTest {
    @Test
    void it_should_say_success(){
        Staff staff = new Staff();
        staff.setUserName("root");
        staff.setPassWord("Xacnhan1");
        StaffDAO dao = new StaffDAO();
        boolean kq = dao.kiemtraDangnhap(staff);
        Assert.assertEquals(true,kq);
    }

    @Test
    void it_should_say_failed(){
        Staff staff = new Staff();
        staff.setUserName("root");
        staff.setPassWord("XXX");
        StaffDAO dao = new StaffDAO();
        boolean kq = dao.kiemtraDangnhap(staff);
        Assert.assertNotEquals(true,kq);

    }
}
