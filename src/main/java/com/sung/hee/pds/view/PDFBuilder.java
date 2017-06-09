package com.sung.hee.pds.view;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sung.hee.shboard.model.SHBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * This view class generates a PDF document 'on the fly' based on the data
 * contained in the model.
 *
 * @author www.codejava.net
 */
public class PDFBuilder extends AbstractITextPdfView {

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc,
                                    PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // get data model which is passed by the Spring container
        List<SHBoard> bbss = (List<SHBoard>) model.get("boardlist");

        doc.add(new Paragraph("Recommended SHBoard"));

        PdfPTable table = new PdfPTable(4);//4ĭ
        table.setWidthPercentage(100.0f);
        table.setWidths(new float[]{3.0f, 2.0f, 2.0f, 2.0f});//4ĭ ����
        table.setSpacingBefore(10);

        // define font for table header row
        String fontPath = request.getSession().getServletContext().getRealPath("/font");
        BaseFont objBaseFont = BaseFont.createFont(fontPath + "/피아노체.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(objBaseFont);
        Font font2 = new Font(objBaseFont);
        //Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(BaseColor.WHITE);
        font2.setColor(BaseColor.BLACK);
        font2.setSize(9);
        // define table header cell
        PdfPCell cell = new PdfPCell();
        PdfPCell cell2 = new PdfPCell();
        cell.setBackgroundColor(BaseColor.BLUE);
        cell.setPadding(4);
        cell2.setBackgroundColor(BaseColor.WHITE);
        cell2.setPadding(4);

        // write table header
        cell.setPhrase(new Phrase("번호", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("아이디", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("제목", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("작성일", font));
        table.addCell(cell);


        // write table row data
        for (SHBoard bbs : bbss) {
            cell2.setPhrase(new Phrase(bbs.getSeq() + "", font2));
            table.addCell(cell2);
            cell2.setPhrase(new Phrase(bbs.getId(), font2));
            table.addCell(cell2);
            cell2.setPhrase(new Phrase(bbs.getTitle(), font2));
            table.addCell(cell2);
            cell2.setPhrase(new Phrase(bbs.getWdate() + "", font2));
            table.addCell(cell2);
        }

        doc.add(table);

    }

}