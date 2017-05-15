package com.sung.hee.shreply.dao;


import com.sung.hee.help.BoardCheck;
import com.sung.hee.shreply.model.SHReply;
import com.sung.hee.user.model.SHUser;

import java.util.List;

/**
 * Created by SungHere on 2017-05-08.
 */
public interface SHReplyDAO {

    public void addReply(SHReply shReply) throws Exception;

    public void addReReply(SHReply shReply) throws Exception;

    public void removeReply(SHReply shReply);

    public SHReply getReply(SHReply shReply);

    public void updateReply(SHReply shReply);

    public List<SHReply> getReplyList(BoardCheck boardCheck);

    public List<SHReply> getReplyListbyId(SHUser shUser);


}
