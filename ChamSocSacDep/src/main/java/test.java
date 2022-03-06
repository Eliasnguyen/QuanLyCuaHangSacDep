
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPRow;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class test {
    public static void main(String[] args) {

        // Tạo đối tượng tài liệu
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);

        try {

            // Tạo đối tượng PdfWriter

            PdfWriter.getInstance(document, new FileOutputStream("\\viblo_asia.pdf"));

            // Mở file để thực hiện ghi
            document.open();

            // Thêm nội dung sử dụng add function
            document.add(new Paragraph("Viblo Asia"));

//            Anchor anchorTarget = new Anchor("First page of the document.");
//            anchorTarget.setName("BackToTop");
//            document.add(anchorTarget);

            // Đóng File
            PdfPTable  table = new PdfPTable(6);
            PdfPCell c1 = new PdfPCell(new Phrase("id"));
            table.addCell(c1);
            PdfPCell c2 = new PdfPCell(new Phrase("Ten dich vu"));
            table.addCell(c2);
            PdfPCell c3 = new PdfPCell(new Phrase("Don gia"));
            table.addCell(c3);
            PdfPCell c4 = new PdfPCell(new Phrase("So luong"));
            table.addCell(c4);
            PdfPCell c5 = new PdfPCell(new Phrase("% Hoa hong"));
            table.addCell(c5);
            PdfPCell c6 = new PdfPCell(new Phrase("Thuc nhan"));
            table.addCell(c6);
            int a[] ={1,2,3,4,5,6};
            table.addCell(new PdfPCell(new Phrase("a[0]")));
            table.addCell(new PdfPCell(new Phrase("a[0]")));
            table.addCell(new PdfPCell(new Phrase("a[0]")));
            table.addCell(new PdfPCell(new Phrase("a[0]")));
            table.addCell(new PdfPCell(new Phrase("a[0]")));
            table.addCell(new PdfPCell(new Phrase("a[0]")));
            document.add(table);

            document.close();
            System.out.println("Write file succes!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
