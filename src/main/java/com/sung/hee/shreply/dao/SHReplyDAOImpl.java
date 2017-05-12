package com.sung.hee.shreply.dao;

import com.sung.hee.help.BoardCheck;
import com.sung.hee.shreply.model.SHReply;
import com.sung.hee.user.model.SHUser;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SungHere on 2017-05-08.
 */
@Repository
public class SHReplyDAOImpl implements SHReplyDAO {
    @Autowired
    SqlSession sqlSession;

    String ns = "SHReply.";

    public void addReply(SHReply shReply) {

        sqlSession.insert(ns + "addReply", shReply);
    }

    public void addReReply(SHReply shReply) {
        sqlSession.insert(ns + "addReReply", shReply);

    }

    public void removeReply(SHReply shReply) {

        sqlSession.update(ns + "removeReply", shReply);
    }

    public SHReply getReply(SHReply shReply) {
        return sqlSession.selectOne(ns + "getReply", shReply);
    }

    public void updateReply(SHReply shReply) {

        sqlSession.update(ns + "updateReply", shReply);
    }

    public List<SHReply> getReplyList(BoardCheck boardCheck) {
        return sqlSession.selectList(ns + "getReplyList", boardCheck);
    }


    public List<SHReply> getReplyListbyId(SHUser shUser) {
        return sqlSession.selectList(ns + "getReplyListbyId", shUser);

    }
}
