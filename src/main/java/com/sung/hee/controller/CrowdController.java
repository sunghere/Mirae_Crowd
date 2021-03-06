package com.sung.hee.controller;

import com.sung.hee.help.AjaxCheck;
import com.sung.hee.help.CrowdLike;
import com.sung.hee.help.MyCrowd;
import com.sung.hee.help.SHUtil;
import com.sung.hee.shcrowd.dao.SHCrowdService;
import com.sung.hee.shcrowd.model.SHCrowd;
import com.sung.hee.shcrowd.model.SHFund;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

/**
 * Created by SungHere on 2017-04-17.
 */
@Controller
public class CrowdController {

    private static final Logger logger = LoggerFactory.getLogger(CrowdController.class);

    @Autowired
    SHCrowdService shCrowdService;

    @RequestMapping(value = "main.do", method = RequestMethod.GET)
    public String home(HttpServletRequest request, Model model) throws Exception {
        return "main.tiles";
    }

    @RequestMapping(value = "admin.do", method = RequestMethod.GET)
    public String admin(HttpServletRequest request, Model model) throws Exception {
        if (SHUtil.getLogin(request).getAuth() != 3) {
            return "admin.tiles";

        } else {
            return "main.tiles";
        }


    }

    /* 모든 리스트*/
    @RequestMapping(value = "crowdlistAll.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> crowdList(HttpServletRequest request, Model model) throws Exception {
        List<SHCrowd> list = null;


        list = shCrowdService.crowdListAll();


        return list;
    }

    @RequestMapping(value = "crowdAdd.do", method = RequestMethod.GET)
    public String crowdAdd(HttpServletRequest request, Model model) throws Exception {
        return "crowdAdd.tiles";
    }

    /* 크라우드 글쓰기 */
    @RequestMapping(value = "crowdAddAf.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck crowdAddAf(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl crowdAddAf--!" + shCrowd);
        AjaxCheck checkResult = new AjaxCheck();

        try {
            shCrowdService.addCrowd(shCrowd);
            checkResult.setMessage("SUCS");

        } catch (Exception e) {

            checkResult.setMessage("FAIL");
        }

        return checkResult;
    }

    /* 크라우드 글삭제 */
    @RequestMapping(value = "delCrowd.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck delCrowd(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl delCrowd--!");
        AjaxCheck checkResult = new AjaxCheck();

        try {
            shCrowdService.delCrowd(shCrowd);
            checkResult.setMessage("SUCS");

        } catch (Exception e) {

            checkResult.setMessage("FAIL");
        }

        return checkResult;
    }

    /* 크라우드 글 상세보기 */
    @RequestMapping(value = "detailCrowd.do", method = RequestMethod.POST)
    @ResponseBody
    public SHCrowd detailCrowd(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl detailCrowd--!");
        SHCrowd getCrowd = shCrowdService.detailCrowd(shCrowd);
        Date date = new Date();
        SimpleDateFormat dateCheck = new SimpleDateFormat("yyyy-MM-dd");

        if (getCrowd.getEdate().compareTo(dateCheck.format(date)) < 0) {

            shCrowdService.endFlag(shCrowd);
            getCrowd.setEndflag("1");
        }
        return getCrowd;
    }

    /* 크라우드 요청글 리스트 페이지 */
    @RequestMapping(value = "crowdReqlist.do", method = RequestMethod.GET)
    public String crowdReqlist(HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl reqCrowdList--!");

        return "reqlist.tiles";
    }

    /* 크라우드 요청글 리스트 */
    @RequestMapping(value = "reqList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> reqCrowdList(HttpServletRequest request, Model model) throws Exception {
        List<SHCrowd> list = shCrowdService.reqCrowdList();

        return list;
    }

    /* 크라우드 내 요청글 리스트 */
    @RequestMapping(value = "myReq.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> myReq(SHUser shUser, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl myReq--!");
        List<SHCrowd> list = shCrowdService.myReqCrowdList(shUser);

        return list;
    }

    /* 크라우드 요청 승낙 */
    @RequestMapping(value = "accCrowd.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck accCrowd(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        AjaxCheck checkResult = new AjaxCheck();
        SHUser user = SHUtil.getLogin(request);

        if (user.getAuth() == 1) {

            try {
                shCrowdService.accCrowd(shCrowd);
                checkResult.setMessage("SUCS");

            } catch (Exception e) {

                checkResult.setMessage("FAIL");
            }
        } else {
            checkResult.setMessage("DEMO");

        }
        return checkResult;
    }

    /* 크라우드 요청 거절 */
    @RequestMapping(value = "noCrowd.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck noCrowd(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        AjaxCheck checkResult = new AjaxCheck();

        SHUser user = SHUtil.getLogin(request);

        if (user.getAuth() == 1) {
            try {
                shCrowdService.noCrowd(shCrowd);
                checkResult.setMessage("SUCS");

            } catch (Exception e) {

                checkResult.setMessage("FAIL");
            }
        } else {
            checkResult.setMessage("DEMO");

        }
        return checkResult;
    }

    /* 크라우드 리스트 전부 (달력용) */
    @RequestMapping(value = "crowdlistforCal.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> crowdlistforCal(HttpServletRequest request, Model model) throws Exception {
        List<SHCrowd> list = shCrowdService.crowdListAllforCal();
        return list;
    }


    /* 크라우드 리스트 */
    @RequestMapping(value = "list.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> crowdList(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        List<SHCrowd> list = shCrowdService.crowdList(shCrowd);

        return list;
    }


    /* 크라우드 리스트 by 검색결과 + 태그 */
    @RequestMapping(value = "search.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> cSearch(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        List<SHCrowd> list = shCrowdService.listbySearch(shCrowd);

        return list;
    }


    /* 내 펀딩 리스트 */
    @RequestMapping(value = "mFundList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<MyCrowd> mFundList(MyCrowd myCrowd, HttpServletRequest request, Model model) throws Exception {
        List<MyCrowd> list = shCrowdService.myCrowdList(myCrowd);
        return list;
    }

    /* 크라우드 펀드하기(투자) */
    @RequestMapping(value = "fundCrowd.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck fundCrowd(SHFund shFund, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl fundCrowd--!");
        SHUser loginUser = (SHUser) request.getSession().getAttribute("login"); /* 세션에서 아이디 가져옴*/
        AjaxCheck checkResult = new AjaxCheck();

        if (loginUser.getPoint() > shFund.getMoney() && loginUser.getId().equals(shFund.getId())) {
            /* 잔액이 더많음을 체크 (한번더) && 세션 아이디 + 펀드하는 유저가 같은사람인지 체크*/


            try {
                shCrowdService.fundCrowd(shFund);
                loginUser.setPoint(loginUser.getPoint() - shFund.getMoney());

                request.getSession().setAttribute("login", loginUser);/*포인트 차감후 업데이트*/
                checkResult.setResultNum(loginUser.getPoint()); /* 포인트 변경내역 웹에 실시간 반영을위해 추가해줌*/

                checkResult.setMessage("SUCS");

            } catch (Exception e) {

                checkResult.setMessage("FAIL");
            }
        } else { /* 잔액이 더적은 경우*/
            checkResult.setMessage("FAIL");

        }
        return checkResult;
    }

    /* 크라우드 펀드 취소(투자) */
    @RequestMapping(value = "fundCancel.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck fundCancel(SHFund shFund, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl fundCancel--!");
        AjaxCheck checkResult = new AjaxCheck();

        try {
            shCrowdService.fundCrowdCancel(shFund);
            checkResult.setMessage("SUCS");

        } catch (Exception e) {

            checkResult.setMessage("FAIL");
        }

        return checkResult;
    }

    /* 크라우드 Like */
    @RequestMapping(value = "crowdLike.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck crowdLike(CrowdLike crowdLike, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl crowdLike--!");
        AjaxCheck checkResult = new AjaxCheck();
        int likeNum = 0;
        try {
            likeNum = shCrowdService.crowdLike(crowdLike);
            checkResult.setMessage("" + likeNum);

        } catch (Exception e) {

            checkResult.setMessage("FAIL");
        }

        return checkResult;
    }

    /* 크라우드 보상받기 */
    @RequestMapping(value = "cfinish.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck finishReward(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl finishReward--!");
        AjaxCheck checkResult = new AjaxCheck();

        SHUser login = (SHUser) request.getSession().getAttribute("login");
        if (!shCrowd.getId().equals(login.getId())) {/*세션에 들어있는 로그인과 비교*/
            checkResult.setMessage("FAIL");

        } else {
            SHCrowd temp = shCrowdService.detailCrowd(shCrowd);
            try {
                shCrowdService.finishReward(temp);
                checkResult.setMessage("SUCS");

            } catch (Exception e) {

                checkResult.setMessage("FAIL");
            }
        }
        return checkResult;
    }

    @RequestMapping(value = "this.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String thispage(HttpServletRequest request, Model model) throws Exception {
        logger.info("go this page" + request.getHeader("Referer"));

        return "redirect:" + getDoRef(request.getHeader("Referer"));
    }

    /*좋아요 체크 이미 좋아요 했으면 over 안했으면 아무거나보내라*/
    @RequestMapping(value = "checkLike.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck checkLike(CrowdLike crowdLike, HttpServletRequest request, Model model) throws Exception {

        AjaxCheck result = new AjaxCheck();

        int checkNum = shCrowdService.crowdLikeChk(crowdLike);
        if (checkNum > 0) {
            result.setMessage("Over");
        } else {
            result.setMessage("OK");
        }
        return result;
    }

    /* 크라우드 태그 */
    @RequestMapping(value = "taglist.do", method = RequestMethod.POST)
    @ResponseBody
    public HashSet<String> getTagList(HttpServletRequest request, Model model) throws Exception {

        HashSet<String> randomList = shCrowdService.getTagList();


        return randomList;
    }

    /*모달 카테고리 서치*/
    @RequestMapping(value = "searchCategory.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> searchCategory(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl searchCategory--!");
        return shCrowdService.searchCategory(shCrowd);
    }

    public String getDoRef(String ref) {

        if (ref.contains("/"))
            ref = ref.substring(ref.lastIndexOf("/"));

        return ref;
    }

    /* 크라우드 글 수정 */
    @RequestMapping(value = "updateCrowd.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck updateCrowd(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl delCrowd--!");
        AjaxCheck checkResult = new AjaxCheck();
        SHUser login = (SHUser) request.getSession().getAttribute("login");

        shCrowd.setId(login.getId());
        try {
            shCrowdService.updateCrowd(shCrowd);
            checkResult.setMessage("SUCS");

        } catch (Exception e) {

            checkResult.setMessage("FAIL");
        }

        return checkResult;
    }
}
