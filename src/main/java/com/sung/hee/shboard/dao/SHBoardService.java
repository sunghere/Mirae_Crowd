package com.sung.hee.shboard.dao;

import com.sung.hee.help.BoardParam;
import com.sung.hee.shboard.model.SHBoard;
import com.sung.hee.user.model.SHUser;

import java.util.List;

public interface SHBoardService {
    void writeBoard(SHBoard shboard);

    List<SHBoard> getBoardList();

    List<SHBoard> getEntBoardList(SHBoard board);

    SHBoard getBoard(SHBoard shboard);

    void updateReadCount(SHBoard shboard);

    void reply(SHBoard shboard) throws Exception;

    void updateBoard(SHBoard board);

    void boarddelete(SHBoard board);

    List<SHBoard> getBoardPageList(BoardParam param) throws Exception;

    int getBoardTotalCount(BoardParam param) throws Exception;

    List<SHBoard> getEntBoardPageList(BoardParam param) throws Exception;

    int getEntBoardTotalCount(BoardParam param) throws Exception;

    List<SHBoard> getMyBoardlist(SHUser shUser);
}
