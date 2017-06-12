package com.sung.hee.shreply.dao;

import com.sung.hee.shreply.model.SHReply;
import com.sung.hee.help.BoardCheck;
import com.sung.hee.user.model.SHUser;

import java.util.List;

/**
 * Created by SungHere on 2017-05-11.
 */

public interface SHReplyService {


    void addReply(SHReply shReply) throws Exception;

    void addReReply(SHReply shReply) throws Exception;

    void removeReply(SHReply shReply);

    SHReply getReply(SHReply shReply);

    void updateReply(SHReply shReply);

    List<SHReply> getReplyList(BoardCheck boardCheck);

    List<SHReply> getReplyListbyId(SHUser shUser);
}
