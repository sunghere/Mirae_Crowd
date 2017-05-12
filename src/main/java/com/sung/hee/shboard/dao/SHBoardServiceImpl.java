package com.sung.hee.shboard.dao;

import com.sung.hee.help.BoardParam;
import com.sung.hee.shboard.model.SHBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by SungHere on 2017-04-19.
 */
@Service
public class SHBoardServiceImpl implements SHBoardService {

    @Autowired
    private SHBoardDAO shBoardDAO;

    @Transactional
    public void writeBoard(SHBoard shboard) {
        shBoardDAO.writeBoard(shboard);
    }

    @Transactional(readOnly = true)
    public List<SHBoard> getBoardList() {
        return shBoardDAO.getBoardList();
    }


    @Transactional(readOnly = true)
    public List<SHBoard> getEntBoardList(SHBoard board) {
        return shBoardDAO.getEntBoardList(board);
    }

    @Transactional
    public SHBoard getBoard(SHBoard shboard) {
        shBoardDAO.updateReadCount(shboard);
        return shBoardDAO.getBoard(shboard);
    }

    @Transactional
    public void reply(SHBoard shboard) throws Exception {

        shBoardDAO.replyBoardUpdate(shboard);
        shBoardDAO.replyBoardInsert(shboard);
    }

    @Transactional
    public void updateBoard(SHBoard board) {

        shBoardDAO.updateBoard(board);
    }

    @Transactional
    public void boarddelete(SHBoard board) {

        shBoardDAO.boarddelete(board);
    }

    @Transactional(readOnly = true)
    public List<SHBoard> getBoardPageList(BoardParam param) throws Exception {
        return shBoardDAO.getBoardPageList(param);
    }

    @Transactional(readOnly = true)
    public int getBoardTotalCount(BoardParam param) throws Exception {
        return shBoardDAO.getBoardTotalCount(param);
    }

    @Transactional(readOnly = true)
    public List<SHBoard> getEntBoardPageList(BoardParam param) throws Exception {
        return shBoardDAO.getEntBoardPageList(param);
    }

    @Transactional(readOnly = true)
    public int getEntBoardTotalCount(BoardParam param) throws Exception {
        return shBoardDAO.getEntBoardTotalCount(param);

    }


}
