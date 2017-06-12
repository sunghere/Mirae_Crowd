package com.sung.hee.poll.dao;

import com.sung.hee.poll.model.SHPoll;
import com.sung.hee.poll.model.SHPollSub;
import com.sung.hee.poll.model.SHVoter;

import java.util.List;

public interface SHPollDAO {

    void makePoll(SHPoll poll);

    void makePollSub(SHPollSub pollsub);

    List<SHPoll> getPollAllList();

    int isVote(SHVoter shVoter);

    SHPoll getPoll(SHPoll poll);

    List<SHPollSub> getPollSubList(SHPoll poll);

    void pollingVote(SHVoter voter);

    void pollingSub(SHVoter voter);

    void pollingPoll(SHVoter voter);

}