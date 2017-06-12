package com.sung.hee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by SungHere on 2017-04-21.
 */
@Controller
public class SHCalController {
    private static final Logger logger =
            LoggerFactory.getLogger(LoginController.class);

    //D사용 I주입
    @RequestMapping(value = "mycal.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String mycal(HttpServletRequest request, Model model) throws Exception {
        logger.info("Welcome CalendarController mycal! " + new Date());

        return "mycal.tiles";
    }//
}
