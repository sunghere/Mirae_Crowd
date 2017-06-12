package com.sung.hee.pds.view;
//com.mirhenge.jyl.pds.view.ExcelBuilder

import com.sung.hee.shboard.model.SHBoard;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


/**
 * This class builds an Excel spreadsheet document using Apache POI library.
 *
 * @author www.codejava.net
 */
public class ExcelBuilder extends AbstractXlsxView {


    protected void buildExcelDocument(Map<String, Object> map, Workbook workbook, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        // get data model which is passed by the Spring container
        List<SHBoard> bbss = (List<SHBoard>) map.get("boardlist");

        // create a new Excel sheet
        HSSFSheet sheet = (HSSFSheet) workbook.createSheet("board");
        sheet.setDefaultColumnWidth(30);

        // create style for header cells
        CellStyle style = workbook.createCellStyle();
     /*   Font font = workbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.BLUE.index);
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.WHITE.index);
        style.setFont(font);*/

        // create header row
        HSSFRow header = sheet.createRow(0);

        header.createCell(0).setCellValue("넘버");
        header.getCell(0).setCellStyle(style);

        header.createCell(1).setCellValue("아이디");
        header.getCell(1).setCellStyle(style);

        header.createCell(2).setCellValue("제목");
        header.getCell(2).setCellStyle(style);

        header.createCell(3).setCellValue("날짜");
        header.getCell(3).setCellStyle(style);


        // create data rows
        int rowCount = 1;

        for (SHBoard bbs : bbss) {
            HSSFRow aRow = sheet.createRow(rowCount++);
            aRow.createCell(0).setCellValue(bbs.getSeq() + "");
            aRow.createCell(1).setCellValue(bbs.getId());
            aRow.createCell(2).setCellValue(bbs.getTitle());
            aRow.createCell(3).setCellValue(bbs.getWdate() + "");
        }
    }
}