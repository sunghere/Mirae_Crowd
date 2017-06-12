package com.sung.hee.poll.dao;

import com.sung.hee.help.PollBean;
import com.sung.hee.poll.model.SHPoll;
import com.sung.hee.poll.model.SHPollSub;
import com.sung.hee.poll.model.SHVoter;

import java.util.List;

public interface SHPollService {

	void makePoll(PollBean pbean);

	List<SHPoll> getPollAllList(String id);

	SHPoll getPoll(SHPoll poll);

	 List<SHPollSub> getPollSubList(SHPoll poll);

	void polling(SHVoter voter);

}
