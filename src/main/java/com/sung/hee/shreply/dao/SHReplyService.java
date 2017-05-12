package com.sung.hee.shreply.dao;

import com.sung.hee.help.BoardCheck;
import com.sung.hee.shreply.model.SHReply;
import com.sung.hee.user.model.SHUser;

import java.util.List;

/**
 * Created by SungHere on 2017-05-11.
 */

public interface SHReplyService {


    public void addReply(SHReply shReply);

    public void addReReply(SHReply shReply);

    public void removeReply(SHReply shReply);

    public SHReply getReply(SHReply shReply);

    public void updateReply(SHReply shReply);

    public List<SHReply> getReplyList(BoardCheck boardCheck);

    public List<SHReply> getReplyListbyId(SHUser shUser);
}
