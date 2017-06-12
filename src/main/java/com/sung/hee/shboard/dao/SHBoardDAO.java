package com.sung.hee.shboard.dao;

import com.sung.hee.help.BoardParam;
import com.sung.hee.shboard.model.SHBoard;
import com.sung.hee.user.model.SHUser;

import java.util.List;


public interface SHBoardDAO {
    void writeBoard(SHBoard shBoard);

    List<SHBoard> getBoardList();

    SHBoard getBoard(SHBoard shBoard);

    void replyBoardUpdate(SHBoard shBoard) throws Exception;

    void replyBoardInsert(SHBoard shBoard) throws Exception;

    void updateBoard(SHBoard board);

    void boarddelete(SHBoard board);

    List<SHBoard> getBoardPageList(BoardParam param) throws Exception;

    int getBoardTotalCount(BoardParam param) throws Exception;

    void updateReadCount(SHBoard board);

    List<SHBoard> getMyBoardlist(SHUser shUser);

}