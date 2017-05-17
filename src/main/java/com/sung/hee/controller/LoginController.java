package com.sung.hee.controller;

import com.sung.hee.ent.dao.SHEntService;
import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.help.AjaxCheck;
import com.sung.hee.user.dao.SHUserService;
import com.sung.hee.user.model.SHUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class LoginController {

    private static final Logger logger =
            LoggerFactory.getLogger(LoginController.class);
    //D사용 I주입
    @Autowired
    private SHUserService shUserService;

    @Autowired
    private SHEntService shEntService;

    @RequestMapping(value = "login.do",
            method = RequestMethod.GET)
    public String login(Model model) {
        logger.info("Welcome LoginController login! " + new Date());
        model.addAttribute("head", "WELCOME");
        return "login.tiles";
    }//

    @RequestMapping(value = "regi.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String regi(Model model) {
        logger.info("Welcome LoginController regi! " + new Date());
        return "regi.tiles";
    }//

    @RequestMapping(value = "regiAf.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String regiAf(SHUser user, Model model) {
        logger.info("Welcome LoginController regiAf! " + new Date());
        try {
            shUserService.regi(user);
        } catch (Exception e) {
        }
        return "redirect:/" + "login.do";
    }//

    @RequestMapping(value = "kakaoRegi.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public AjaxCheck kakaoRegi(SHUser user, Model model) {
        AjaxCheck check = new AjaxCheck();

        try {

            shUserService.regi(user);
            check.setMessage("SUCS");

        } catch (Exception e) {
            check.setMessage("FAIL");

        }
        return check;
    }//

    @RequestMapping(value = "loginAf.do",
            method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck loginAf(HttpServletRequest request
            , SHUser user, Model model) {
        SHUser login = shUserService.login(user);
        AjaxCheck check = new AjaxCheck();
        logger.info("Welcome LoginController loginAf!---- " + login);
        if (login != null && !login.getId().equals("")) {
            request.getSession().setAttribute(
                    "login", login);
            request.getSession().setMaxInactiveInterval(20 * 60);
            check.setMessage("SUCS");

        } else {
            request.getSession().invalidate();
            model.addAttribute("result", "아이디나 비밀번호를 확인해주세요");
            check.setMessage("FAIL");
        }
        return check;

    }

    @RequestMapping(value = "logout.do",
            method = RequestMethod.GET)
    public String logout(HttpServletRequest request, Model model) {
        logger.info("Welcome LoginController logout! " + new Date());
        request.getSession().invalidate();
        model.addAttribute("head", "WELCOME");
        return "redirect:" + getDoRef(request.getHeader("Referer"));
    }//

    public String getDoRef(String ref) {
        if (ref.contains("/"))
            ref = ref.substring(ref.lastIndexOf("/"));


        return ref;
    }


    @RequestMapping(value = "getID.do",
            method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck getID(
            SHUser user, Model model) throws Exception {
//        logger.info("Welcome LoginController getID! " + new Date());
        int count = shUserService.getID(user);

        AjaxCheck checkResult = new AjaxCheck();
        if (count > 0) {
            checkResult.setMessage("SUCS");
        } else {
            checkResult.setMessage("FAIL");
        }
        logger.info("ddddddddddddddddddddddddddddddddddddddddddddddd"+checkResult.getMessage());
        return checkResult;
    }//

    @RequestMapping(value = "checkEntName.do",
            method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck getEntName(
            SHEnt ent, Model model) throws Exception {
//        logger.info("Welcome LoginController getEntName! " + new Date());
        int count = shEntService.entNameCheck(ent);

        AjaxCheck checkResult = new AjaxCheck();
        if (count > 0) {
            checkResult.setMessage("SUCS");
        } else {
            checkResult.setMessage("FAIL");
        }
        return checkResult;
    }//
}