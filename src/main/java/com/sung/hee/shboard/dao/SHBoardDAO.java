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


    public List<SHBoard> getBoardPageList(BoardParam param) throws Exception;

    public int getBoardTotalCount(BoardParam param) throws Exception;

    void updateReadCount(SHBoard board);

    List<SHBoard> getEntBoardList(SHBoard board);

    List<SHBoard> getEntBoardPageList(BoardParam param) throws Exception;

    int getEntBoardTotalCount(BoardParam param) throws Exception;

    List<SHBoard> getMyBoardlist(SHUser shUser);

}