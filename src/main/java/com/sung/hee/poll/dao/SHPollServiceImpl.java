package com.sung.hee.poll.dao;

import com.sung.hee.poll.model.SHPollSub;
import com.sung.hee.help.PollBean;
import com.sung.hee.poll.model.SHPoll;
import com.sung.hee.poll.model.SHVoter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by SungHere on 2017-04-25.
 */
@Service
public class SHPollServiceImpl implements SHPollService {
    @Autowired
    private SHPollDAO shPollDAO;

    @Transactional
    public void makePoll(PollBean pbean) {
        SHPoll poll = new SHPoll(
                pbean.getId(),
                pbean.getQuestion(),
                pbean.getSdate(),
                pbean.getEdate(),
                pbean.getItemcount(), 0
        );
        int itemcount = pbean.getItemcount();
        String[] answer = pbean.getPollnum();

        shPollDAO.makePoll(poll);
        for (int i = 0; i < itemcount; i++) {
            SHPollSub pollsub = new SHPollSub();
            pollsub.setAnswer(answer[i]);
            shPollDAO.makePollSub(pollsub);
        }


    }

    @Transactional(readOnly = true)
    public List<SHPoll> getPollAllList(String id) {
        List<SHPoll> plists = shPollDAO.getPollAllList();
        List<SHPoll> plists2 = new ArrayList<SHPoll>();
        for (SHPoll poll : plists) {
            //String id=poll.getId();
            int pollid = poll.getPollid();
            int count = shPollDAO.isVote(new SHVoter(pollid, -1, id));
            //System.out.println("-------------------------------------::::"+count);
            if (count > 0) {
                poll.setVote(true);//투표했다.
            } else {
                poll.setVote(false);//
            }
            plists2.add(poll);
        }
        return plists2;
    }

    @Transactional(readOnly = true)
    public SHPoll getPoll(SHPoll poll) {
        return shPollDAO.getPoll(poll);
    }

    @Transactional(readOnly = true)
    public List<SHPollSub> getPollSubList(SHPoll poll) {
        return shPollDAO.getPollSubList(poll);
    }

    @Transactional
    public void polling(SHVoter voter) {
        shPollDAO.pollingVote(voter);
        shPollDAO.pollingSub(voter);
        shPollDAO.pollingPoll(voter);
    }
}
