package com.sung.hee.controller;


import com.sung.hee.shboard.dao.SHBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;

@Controller
public class PdfController {

    private static final Logger logger =
            LoggerFactory.getLogger(PdfController.class);

    @Autowired
    private SHBoardService shBoardService;

    @RequestMapping(value = "downloadPDF.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String downloadPDF(Model model) throws Exception {
        logger.info("Welcome PdfController downloadPDF! " + new Date());
        model.addAttribute("boardlist", shBoardService.getBoardList());
        return "pdfView";
    }

    @RequestMapping(value = "downloadExcel.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String downloadExcel(Model model) throws Exception {
        logger.info("Welcome PdfController downloadExcel! " + new Date());
        model.addAttribute("boardlist", shBoardService.getBoardList());
        return "excelView";
    }


}