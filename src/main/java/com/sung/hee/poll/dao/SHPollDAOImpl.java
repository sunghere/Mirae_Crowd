package com.sung.hee.poll.dao;

import com.sung.hee.poll.model.SHPoll;
import com.sung.hee.poll.model.SHPollSub;
import com.sung.hee.poll.model.SHVoter;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SungHere on 2017-04-25.
 */
@Repository
public class SHPollDAOImpl implements SHPollDAO {

    private String ns = "SHPoll.";

    @Autowired
    private SqlSession sqlSession;

    public void makePoll(SHPoll poll) {
        sqlSession.insert(ns + "makePoll", poll);
    }

    public void makePollSub(SHPollSub pollsub) {
        sqlSession.insert(ns + "makePollSub", pollsub);

    }

    public List<SHPoll> getPollAllList() {
        return sqlSession.selectList(ns + "getPollAllList");
    }

    public int isVote(SHVoter shVoter) {
        return (Integer) sqlSession.selectOne(ns + "isVote", shVoter);

    }

    public SHPoll getPoll(SHPoll poll) {
        return (SHPoll) sqlSession.selectOne(ns + "getPoll", poll);

    }

    public List<SHPollSub> getPollSubList(SHPoll poll) {
        return sqlSession.selectList(ns + "getPollSubList", poll);

    }

    public void pollingVote(SHVoter voter) {
        sqlSession.insert(ns + "pollingVote", voter);

    }

    public void pollingSub(SHVoter voter) {
        sqlSession.insert(ns + "pollingSub", voter);

    }

    public void pollingPoll(SHVoter voter) {
        sqlSession.update(ns + "pollingPoll", voter);

    }
}
