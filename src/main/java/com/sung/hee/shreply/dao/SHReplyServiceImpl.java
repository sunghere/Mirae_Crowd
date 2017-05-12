package com.sung.hee.shreply.dao;

import com.sung.hee.help.BoardCheck;
import com.sung.hee.shreply.model.SHReply;
import com.sung.hee.user.model.SHUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by SungHere on 2017-05-11.
 */
@Service
public class SHReplyServiceImpl implements SHReplyService {

    @Autowired
    private SHReplyDAO shReplyDAO;


    @Transactional
    public void addReply(SHReply shReply) {
        shReplyDAO.addReply(shReply);
    }

    @Transactional
    public void addReReply(SHReply shReply) {
        shReplyDAO.addReply(shReply);
    }

    @Transactional
    public void removeReply(SHReply shReply) {
        shReplyDAO.removeReply(shReply);
    }

    @Transactional(readOnly = true)
    public SHReply getReply(SHReply shReply) {
        return shReplyDAO.getReply(shReply);
    }

    @Transactional
    public void updateReply(SHReply shReply) {
        shReplyDAO.updateReply(shReply);
    }

    @Transactional(readOnly = true)
    public List<SHReply> getReplyList(BoardCheck boardCheck) {
        return shReplyDAO.getReplyList(boardCheck);
    }

    @Transactional(readOnly = true)
    public List<SHReply> getReplyListbyId(SHUser shUser) {
        return shReplyDAO.getReplyListbyId(shUser);
    }
}
