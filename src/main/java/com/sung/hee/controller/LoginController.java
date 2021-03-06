package com.sung.hee.controller;

import com.sung.hee.ent.dao.SHEntService;
import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.help.AjaxCheck;
import com.sung.hee.help.EncryptUtil;
import com.sung.hee.mail.service.MailService;
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
import java.util.List;

@Controller
public class LoginController {

    private static final Logger logger =
            LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private SHUserService shUserService;

    @Autowired
    private SHEntService shEntService;


    @RequestMapping(value = "regi.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String regi(Model model) {
        logger.info("Welcome LoginController regi! " + new Date());
        return "regi.tiles";
    }//

    @RequestMapping(value = "regiAf.do",
            method = {RequestMethod.POST})
    public String regiAf(SHUser user, HttpServletRequest request, Model model) {
        try {
            String shaPwd = EncryptUtil.getEncryptSHA256(user.getPwd()); /* 암호에 SH 문자열을 */
            user.setPwd(shaPwd);
            shUserService.regi(user);


            MailService.sendCertiMail(user);


        } catch (Exception e) {
        }
        return "redirect:main.do";
    }//

    @RequestMapping(value = "SNSRegi.do",
            method = {RequestMethod.POST})
    @ResponseBody
    public AjaxCheck snsRegi(SHUser user, Model model) {
        AjaxCheck check = new AjaxCheck();
        String shaPwd = EncryptUtil.getEncryptSHA256(user.getPwd()); /* 암호에 SH 문자열을 */
        user.setPwd(shaPwd);

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
    public AjaxCheck loginAf(
            SHUser user, HttpServletRequest request, Model model) {
        AjaxCheck check = new AjaxCheck();


        SHUser login = shUserService.login(user);

        if (login != null && !(login.getId().equals(""))) {
            request.getSession().setAttribute(
                    "login", login);
            request.getSession().setMaxInactiveInterval(30 * 60);

            check.setMessage("SUCS");

            if (login.getCerti() != 1) {
                check.setMessage("NOCERTI");

                request.getSession().invalidate();

            }

        } else {
            request.getSession().invalidate();
            logger.info("왜일로오");
            model.addAttribute("result", "아이디나 비밀번호를 확인해주세요");
            check.setMessage("FAIL");
        }
        return check;

    }

    @RequestMapping(value = "pwdFindmail.do",
            method = {RequestMethod.POST})
    @ResponseBody
    public AjaxCheck pwdFindmail(SHUser user, HttpServletRequest request, Model model) {
        AjaxCheck result = new AjaxCheck();
        if (shUserService.getIsSnS(user).getIsSNS().equals("1")) {
            result.setMessage("SNS");
            return result;
        }

        return result;
    }//

    @RequestMapping(value = "pwdFindCerti.do", method = RequestMethod.GET)
    public String pwdFindCerti(String en, String id) {


        if (shUserService.pwdFindCerti(id, en)) {

            return "redirect:/main.do";

        } else {
            /*인증 실패 페이지*/
            return "certierror.tiles";

        }
    }


    /**
     * @param en 유저의 id를 MD5로 암호화
     * @param id 유저의 본래 ID
     * @return
     */
    @RequestMapping(value = "emailCerti.do", method = RequestMethod.GET)
    public String emailCerti(String en, String id) {

        boolean isResult = shUserService.emailCerti(id, en);

        if (isResult) {  //인증성공

            return "redirect:/main.do";

        } else {

            //인증실패시
            return "certierror.tiles";
        }
    }

    @RequestMapping(value = "logout.do",
            method = RequestMethod.GET)
    public String logout(HttpServletRequest request, Model model) {
        logger.info("Welcome LoginController logout! " + new Date());
        request.getSession().invalidate();
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
            SHUser user, HttpServletRequest request, Model model) throws Exception {
//        logger.info("Welcome LoginController getID! " + new Date());
        AjaxCheck checkResult = new AjaxCheck();

        try {
            SHUser loginUser = (SHUser) request.getSession().getAttribute("login"); /* 세션에서 아이디 가져옴*/
            loginUser.setPwd(shUserService.getPWD(loginUser));  /*가져온 아이디를 통해 비밀번호를 찾아옴*/
            user.setId(loginUser.getId()); /*가져온 아이디를 epoint가 담긴 임시 객체로 옮겨넣음*/
            shUserService.inPoint(user); /* 임시 객체로 포인트*/
            checkResult.setMessage("SUCS"); /*성공처리*/
            SHUser resetUser = shUserService.login(loginUser); /* 세션을 통한 아이디 갱신(포인트갱신을위해)*/
            checkResult.setResultNum(resetUser.getPoint()); /* 포인트 변경내역 웹에 실시간 반영을위해 추가해줌*/
            request.getSession().setAttribute("login", resetUser);
        } catch (Exception e) {
            checkResult.setMessage("FAIL");
        }
        return checkResult;
    }//

    @RequestMapping(value = "pointOut.do",
            method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck pointOut(
            SHUser user, HttpServletRequest request, Model model) throws Exception {
        AjaxCheck checkResult = new AjaxCheck();
        SHUser loginUser = (SHUser) request.getSession().getAttribute("login"); /* 세션에서 아이디 가져옴*/

        if (loginUser.getPoint() >= user.getEpoint() + 1000) {

            try {
                loginUser.setPwd(shUserService.getPWD(loginUser));  /*가져온 아이디를 통해 비밀번호를 찾아옴*/
                user.setId(loginUser.getId()); /*가져온 아이디를 epoint가 담긴 임시 객체로 옮겨넣음*/

                shUserService.dePoint(user);/* 임시 객체로 포인트*/
                checkResult.setMessage("SUCS"); /*성공처리*/
                SHUser resetUser = shUserService.login(loginUser); /* 세션을 통한 아이디 갱신(포인트갱신을위해)*/

                checkResult.setResultNum(resetUser.getPoint()); /* 포인트 변경내역 웹에 실시간 반영을위해 추가해줌*/

                user.setId("admin"); /*  관리자에게 1000원 입금*/
                user.setEpoint(1000);

                shUserService.inPoint(user);
                request.getSession().setAttribute("login", resetUser);

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

    @RequestMapping(value = "pwdCheck.do",
            method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck pwdCheck(
            SHUser shUser, HttpServletRequest request, Model model) throws Exception {
//        logger.info("Welcome LoginController getEntName! " + new Date());
        AjaxCheck checkResult = new AjaxCheck();
        String shaPwd = EncryptUtil.getEncryptSHA256(shUser.getPwd()); /* 암호에 SH 문자열을 */
        shUser.setPwd(shaPwd);
        SHUser sessionUser = (SHUser) request.getSession().getAttribute("login");

        if (sessionUser.getId().equals(shUser.getId())) {
            if (shUserService.getPWD(shUser).equalsIgnoreCase(shaPwd)) {
                checkResult.setMessage("SUCS");

            } else {
                checkResult.setMessage("FAIL");

            }
        } else {
            checkResult.setMessage("FAIL");

        }


        return checkResult;
    }

    @RequestMapping(value = "pwdUpdate.do",
            method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck pwdUpdate(
            SHUser shUser, HttpServletRequest request, Model model) throws Exception {
//        logger.info("Welcome LoginController getEntName! " + new Date());
        AjaxCheck checkResult = new AjaxCheck();
        SHUser sessionUser = (SHUser) request.getSession().getAttribute("login");
        String shaPwd = EncryptUtil.getEncryptSHA256(shUser.getPwd()); /* 암호에 SH 문자열을 */
        shUser.setPwd(shaPwd);
        if (sessionUser.getId().equals(shUser.getId())) {

            shUserService.pwdUpdate(shUser);

            checkResult.setMessage("SUCS");

        } else {
            checkResult.setMessage("FAIL");

        }


        return checkResult;
    }

    @RequestMapping(value = "userlist.do",
            method = RequestMethod.POST)
    @ResponseBody
    public List<SHUser> userlist(
            HttpServletRequest request) throws Exception {
        SHUser sessionUser = (SHUser) request.getSession().getAttribute("login");
        List<SHUser> list = null;
        if (sessionUser == null || sessionUser.getAuth() != 1) {
            list = null;
        } else {

            list = shUserService.userlist();

        }


        return list;
    }

    @RequestMapping(value = "myPage.do",
            method = {RequestMethod.POST, RequestMethod.GET})
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