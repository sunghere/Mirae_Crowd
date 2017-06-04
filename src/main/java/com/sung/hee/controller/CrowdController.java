package com.sung.hee.controller;

import com.sung.hee.help.AjaxCheck;
import com.sung.hee.help.CrowdLike;
import com.sung.hee.help.MyCrowd;
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
import java.util.ArrayList;
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
        return "admin.tiles";
    }

    @RequestMapping(value = "crowdAdd.do", method = RequestMethod.GET)
    public String crowdAdd(HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl crowdAdd--!");
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
        logger.info("CrowdControl reqCrowdList--!");
        List<SHCrowd> list = shCrowdService.reqCrowdList();
        logger.info("CrowdControl reqCrowdList--!-----------------" + list);

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
        logger.info("CrowdControl accCrowd--!");
        AjaxCheck checkResult = new AjaxCheck();

        try {
            shCrowdService.accCrowd(shCrowd);
            checkResult.setMessage("SUCS");

        } catch (Exception e) {

            checkResult.setMessage("FAIL");
        }

        return checkResult;
    }

    /* 크라우드 요청 거절 */
    @RequestMapping(value = "noCrowd.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck noCrowd(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl noCrowd--!");
        AjaxCheck checkResult = new AjaxCheck();

        try {
            shCrowdService.noCrowd(shCrowd);
            checkResult.setMessage("SUCS");

        } catch (Exception e) {

            checkResult.setMessage("FAIL");
        }

        return checkResult;
    }

    /* 크라우드 리스트 전부 (달력용) */
    @RequestMapping(value = "cListAll.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> cListAll(HttpServletRequest request, Model model) throws Exception {
        List<SHCrowd> list = shCrowdService.crowdListAll();
        return list;
    }


    /* 크라우드 리스트 */
    @RequestMapping(value = "crowdList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> cList(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl cList--!");
        List<SHCrowd> list = shCrowdService.crowdList(shCrowd);

        return list;
    }


    /* 크라우드 리스트 by 검색결과 + 태그 */
    @RequestMapping(value = "cSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHCrowd> cSearch(SHCrowd shCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl cSearch--!");
        List<SHCrowd> list = shCrowdService.listbySearch(shCrowd);

        return list;
    }

    /* 내 펀딩 리스트 */
    @RequestMapping(value = "mFundList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<MyCrowd> mFundList(MyCrowd myCrowd, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl mFundList--!");
        List<MyCrowd> list = shCrowdService.myCrowdList(myCrowd);

        return list;
    }

    /* 크라우드 펀드하기(투자) */
    @RequestMapping(value = "fundCrowd.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck fundCrowd(SHFund shFund, HttpServletRequest request, Model model) throws Exception {
        logger.info("CrowdControl fundCrowd--!");
        AjaxCheck checkResult = new AjaxCheck();

        try {
            shCrowdService.fundCrowd(shFund);
            checkResult.setMessage("SUCS");

        } catch (Exception e) {

            checkResult.setMessage("FAIL");
        }

        return checkResult;
    }

    /* 크라우드 펀드하기(투자) */
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

        try {
            shCrowdService.crowdLike(crowdLike);
            checkResult.setMessage("SUCS");

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

        try {
            shCrowdService.finishReward(shCrowd);
            checkResult.setMessage("SUCS");

        } catch (Exception e) {

            checkResult.setMessage("FAIL");
        }

        return checkResult;
    }

    @RequestMapping(value = "this.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String thispage(HttpServletRequest request, Model model) throws Exception {
        logger.info("go this page" + request.getHeader("Referer"));

        return "redirect:" + getDoRef(request.getHeader("Referer"));
    }

    /* 크라우드 태그 */
    @RequestMapping(value = "taglist.do", method = RequestMethod.POST)
    @ResponseBody
    public HashSet<String> getTagList(HttpServletRequest request, Model model) throws Exception {

        List<String> tagList = new ArrayList();
        HashSet<String> randomList = new HashSet();
        List<String> tempList = shCrowdService.findTag();

        for (String string : tempList) {
            for (String str : string.split("#")) {
                if (!str.equals(""))
                    tagList.add(str.trim());
            }
        }
        int count = 0;
        while (randomList.size() < 7) {
            count++;
            randomList.add(tagList.get((int) (Math.random() * tagList.size())));
            if (count > 300) {
                break;
            }
        }

        return randomList;
    }

    public String getDoRef(String ref) {

        if (ref.contains("/"))
            ref = ref.substring(ref.lastIndexOf("/"));

        return ref;
    }
}
