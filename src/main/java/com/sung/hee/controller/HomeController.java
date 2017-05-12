package com.sung.hee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by SungHere on 2017-04-17.
 */
@Controller
public class HomeController {

    private static final Logger logger =
            LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value = "main.do", method = RequestMethod.GET)
    public String home(HttpServletRequest request, Model model) throws Exception {
        logger.info("Welcome HomeController home---------------------------------!" + request.getHeader("Referer"));
        return "main.tiles";
    }

    @RequestMapping(value = "this.do", method = RequestMethod.GET)
    public String thispage(HttpServletRequest request, Model model) throws Exception {
        logger.info("go this page" + request.getHeader("Referer"));


        return "redirect:" + getDoRef(request.getHeader("Referer"));
    }


    public String getDoRef(String ref) {

        if (ref.contains("/"))
            ref = ref.substring(ref.lastIndexOf("/"));


        return ref;
    }
}
