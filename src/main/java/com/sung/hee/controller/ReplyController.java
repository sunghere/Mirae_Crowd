package com.sung.hee.controller;

import com.sung.hee.help.AjaxCheck;
import com.sung.hee.help.BoardCheck;
import com.sung.hee.shreply.dao.SHReplyService;
import com.sung.hee.shreply.model.SHReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by SungHere on 2017-05-15.
 */
@Controller
public class ReplyController {
    private static final Logger logger =
            LoggerFactory.getLogger(ReplyController.class);
    @Autowired
    private SHReplyService shReplyService;


    @RequestMapping(value = "replyadd.do",
            method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck replyadd(
            SHReply reply, Model model) throws Exception {
        AjaxCheck checkResult = new AjaxCheck();
        try {

            shReplyService.addReply(reply);

            checkResult.setMessage("SUCS");
        } catch (Exception e) {
            checkResult.setMessage("FAIL");
        }
        return checkResult;
    }//

    @RequestMapping(value = "replylist.do",
            method = RequestMethod.POST)
    @ResponseBody
    public List<SHReply> replyList(
            BoardCheck checker, Model model) throws Exception {
        logger.info("replyList");
        logger.info(checker + "ddddddddddddd");
        return shReplyService.getReplyList(checker);
    }//

}
