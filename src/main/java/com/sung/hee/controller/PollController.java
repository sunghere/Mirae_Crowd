package com.sung.hee.controller;

import com.sung.hee.poll.dao.SHPollService;
import com.sung.hee.poll.model.SHVoter;
import com.sung.hee.help.PollBean;
import com.sung.hee.poll.model.SHPoll;
import com.sung.hee.user.model.SHUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by SungHere on 2017-04-25.
 */
@Controller
public class PollController {

    private static final Logger logger =
            LoggerFactory.getLogger(PollController.class);

    @Autowired
    SHPollService shPollService;

    @RequestMapping(value = "pollmake.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String pollmake(Model model) {
        logger.info("Welcome PollController pollmake! " + new Date());
        model.addAttribute("doc_title", "POLL 투표문항만들기");

        return "pollmake.tiles";
    }//

    @RequestMapping(value = "pollmakeAf.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String pollmakeAf(PollBean pbean, Model model) {
        logger.info("Welcome PollController pollmakeAf! " + new Date());

        shPollService.makePoll(pbean);

        return "redirect:polllist.do";
    }//

    @RequestMapping(value = "polling.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String polling(SHVoter voter, Model model) {
        logger.info("Welcome PollController polling! " + new Date());
        logger.info("Welcome PollController voter! -----------------------------" + voter);
        shPollService.polling(voter);

        return "redirect:polllist.do";
    }//

    @RequestMapping(value = "polllist.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String polllist(HttpServletRequest request, Model model) {
        logger.info("Welcome PollController polllist! " + new Date());
        //이사람이 두표를 했을까
        String id = ((SHUser) request.getSession().getAttribute("login")).getId();
        model.addAttribute("doc_title", "POLL 투표문항");
        model.addAttribute("plists",
                shPollService.getPollAllList(id));

        return "polllist.tiles";
    }//

    @RequestMapping(value = "polldetail.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String polldetail(SHPoll poll, Model model) {
        logger.info("Welcome PollController polldetail! " + new Date());
        model.addAttribute("doc_title", "POLL 투표 상세내용");
        model.addAttribute("poll",
                shPollService.getPoll(poll));
        model.addAttribute("pollsublist",
                shPollService.getPollSubList(poll));

        return "polldetail.tiles";
    }//

    @RequestMapping(value = "pollresult.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String pollresult(SHPoll poll, Model model) {
        logger.info("Welcome PollController pollresult! " + new Date());
        model.addAttribute("doc_title", "POLL 투표 결과");
        model.addAttribute("poll",
                shPollService.getPoll(poll));
        model.addAttribute("pollsublist",
                shPollService.getPollSubList(poll));

        return "pollresult.tiles";
    }//


}
