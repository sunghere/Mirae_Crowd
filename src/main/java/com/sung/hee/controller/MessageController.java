package com.sung.hee.controller;

import com.sung.hee.help.AjaxCheck;
import com.sung.hee.message.dao.MessageService;
import com.sung.hee.message.model.SHMessage;
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
import java.util.List;

@Controller
public class MessageController {

    private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "messagelist.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHMessage> messagelist(SHMessage message, HttpServletRequest request, Model model) throws Exception {
        logger.info("messagelist" + message);
        List<SHMessage> lists = messageService.messageList(message);
        SHUser shuser = (SHUser) request.getSession().getAttribute("login");
        if (shuser.getAuth() == 1) {
            shuser.setId("admin");
            if (message.getFromid() != shuser.getId()) {
                message.setToid(shuser.getId());
                messageService.readMessage(message);
            }

        } else {
            message.setFromid("admin");
            message.setToid(shuser.getId());
            messageService.readMessage(message);

        }
        return lists;
    }

    @RequestMapping(value = "sendmessage.do", method = RequestMethod.POST)
    @ResponseBody
    public AjaxCheck sendmessage(SHMessage message, Model model) throws Exception {
        AjaxCheck checkResult = new AjaxCheck();
        try {
            messageService.sendMessage(message);
            checkResult.setMessage("SUCS");
        } catch (Exception e) {
            checkResult.setMessage("FAIL");
        }
        return checkResult;
    }//

    @RequestMapping(value = "adminmessagelist.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHMessage> adminmessagelist(SHMessage message, Model model) throws Exception {
        logger.info("adminmessagelist" + message);
        List<SHMessage> lists = messageService.messageListAll();
        logger.info(lists + "----------------------------------------------------------------");
        return lists;
    }

}
