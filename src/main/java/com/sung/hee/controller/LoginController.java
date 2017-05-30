package com.sung.hee.controller;

import com.sung.hee.ent.dao.SHEntService;
import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.help.AjaxCheck;
import com.sung.hee.help.EncryptUtil;
import com.sung.hee.mail.dao.EmailSender;
import com.sung.hee.mail.model.MyEmail;
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


    @Autowired
    private EmailSender emailSender;

    @RequestMapping(value = "login.do",
            method = RequestMethod.GET)
    public String login(Model model) {
        logger.info("Welcome LoginController login! " + new Date());
        return "login.tiles";
    }//

    @RequestMapping(value = "regi.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String regi(Model model) {
        logger.info("Welcome LoginController regi! " + new Date());
        return "regi.tiles";
    }//

    @RequestMapping(value = "regiAf.do",
            method = {RequestMethod.POST})
    public String regiAf(SHUser user, HttpServletRequest request, Model model) {
        logger.info("Welcome LoginController regiAf! " + new Date());
        try {
            shUserService.regi(user);
            MyEmail myEmail = new MyEmail();


            String reciver = user.getId(); //받을사람의 이메일입니다.
            String subject = "Sunghere 가입 인증 메일입니다.";
            String content = "[Sunghere]가입을 본인의 의사가 아니라면 해당메일로 회신문의주세요."
                    + "인증 완료 주소는\n " + getSiteUrl(request.getHeader("Referer")) + "emailCerti.do?id=cisisn@naver.com&encrypt="
                    + EncryptUtil.getEncryptMD5(user.getId()) + " 입니다.";

            myEmail.setReciver(reciver);
            myEmail.setSubject(subject);
            myEmail.setContent(content);
            try {
                emailSender.SendEmail(myEmail);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
        }
        return "redirect:/" + "main.do";
    }//

    @RequestMapping(value = "kakaoRegi.do",
            method = {RequestMethod.POST})
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
        logger.info("메일인증" + EncryptUtil.getMD5(user.getId()));

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


    @RequestMapping(value = "emailCerti.do", method = RequestMethod.GET)
    public String emailCerti(String encrypt, String id) {

        //emailSerti.do?id=cisisn@naver.com&encrypt=1bb66b51fd34f9cb8e2a57efd96d08d
        if (EncryptUtil.getMD5(id).equals(encrypt)) {
            logger.info("인증성공");
            SHUser shUser = new SHUser();
            shUser.setId(id);
            shUserService.emailCerti(shUser);
            return "redirect:/main.do";

        } else {
            logger.info("인증실패");
            //인증실패시
            return "redirect:/main.do";
        }
    }

    @RequestMapping(value = "logout.do",
            method = RequestMethod.GET)
    public String logout(HttpServletRequest request, Model model) {
        logger.info("Welcome LoginController logout! " + new Date());
        request.getSession().invalidate();
        model.addAttribute("head", "WELCOME");
        return "redirect:/main.do";
    }//

    public String getDoRef(String ref) {
        if (ref.contains("/"))
            ref = ref.substring(ref.lastIndexOf("/"));


        return ref;
    }

    public String getSiteUrl(String ref) {
        if (ref.contains("/"))
            ref = ref.substring(0, ref.lastIndexOf("/") + 1);


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
        return checkResult;
    }//

    @RequestMapping(value = "pointIn.do",
            method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck pointIn(
            SHUser user, Model model) throws Exception {
//        logger.info("Welcome LoginController getID! " + new Date());
        AjaxCheck checkResult = new AjaxCheck();

        try {
            shUserService.inPoint(user);
            checkResult.setMessage("SUCS");
        } catch (Exception e) {
            checkResult.setMessage("FAIL");
        }
        return checkResult;
    }//

    @RequestMapping(value = "pointOut.do",
            method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck pointOut(
            SHUser user, Model model) throws Exception {
//        logger.info("Welcome LoginController getID! " + new Date());
        AjaxCheck checkResult = new AjaxCheck();
        if (user.getPoint() >= user.getEpoint()) {
            try {
                shUserService.dePoint(user);
                checkResult.setMessage("SUCS");
            } catch (Exception e) {
                checkResult.setMessage("FAIL");
            }
        } else {
            checkResult.setMessage("FAIL");
        }
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
    }

    @RequestMapping(value = "myPage.do",
            method = {RequestMethod.POST,RequestMethod.GET})
    public String myPage(
            Model model) throws Exception {

        return "myPage.tiles";
    }
/*    *//* NaverLoginBO *//* 네이버 아이디 로그인
    private NaverLoginBO naverLoginBO;

    *//* NaverLoginBO *//*
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO){
        this.naverLoginBO = naverLoginBO;
    }

    @RequestMapping("nlogin/Get.do")
    @ResponseBody
    public AjaxCheck nloginGet(HttpSession session, Model model) {
        *//* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 *//*
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        AjaxCheck check = new AjaxCheck();
        check.setMessage(naverAuthUrl);
        *//* 생성한 인증 URL을 View로 전달 *//*
        return check;
    }

    @RequestMapping("nlogin/callback.do")
    @ResponseBody
    public AjaxCheck callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
    		*//* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 *//*
        OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
        String apiResult = naverLoginBO.getUserProfile(oauthToken);
        AjaxCheck check = new AjaxCheck();
        check.setMessage(apiResult);
        return check;
    }*/
}