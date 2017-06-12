package com.sung.hee.shboard.dao;

import com.sung.hee.help.BoardParam;
import com.sung.hee.shboard.model.SHBoard;
import com.sung.hee.user.model.SHUser;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SungHere on 2017-04-19.
 */
@Repository
public class SHBoardDAOImpl implements SHBoardDAO {

    String ns = "SHBoard.";

    @Autowired
    SqlSession sqlSession;


    public void writeBoard(SHBoard shBoard) {
        sqlSession.insert(ns + "writeBoard", shBoard);
    }

    public List<SHBoard> getBoardList() {
        return sqlSession.selectList(ns + "getBoardList");
    }

    public SHBoard getBoard(SHBoard shBoard) {
        return (SHBoard) sqlSession.selectOne(ns + "getBoard", shBoard);
    }

    public void replyBoardUpdate(SHBoard shBoard) throws Exception {
        sqlSession.update(ns + "replyBoardUpdate", shBoard);
    }

    public void replyBoardInsert(SHBoard shBoard) throws Exception {
        sqlSession.insert(ns + "replyBoardInsert", shBoard);

    }

    public void updateBoard(SHBoard board) {
        sqlSession.update(ns + "updateBoard", board);

    }

    public void boarddelete(SHBoard board) {
        sqlSession.delete(ns + "boarddelete", board);

    }


    public List<SHBoard> getBoardPageList(BoardParam param) throws Exception {
        return sqlSession.selectList(ns + "getBoardPageList", param);
    }

    public int getBoardTotalCount(BoardParam param) throws Exception {
        return (Integer) sqlSession.selectOne(ns + "getBoardTotalCount", param);
    }

    public void updateReadCount(SHBoard board) {

        sqlSession.update(ns + "updateReadCount", board);
    }


    public List<SHBoard> getMyBoardlist(SHUser shUser) {
        return sqlSession.selectList(ns + "getMyBoardlist", shUser);
    }
}
