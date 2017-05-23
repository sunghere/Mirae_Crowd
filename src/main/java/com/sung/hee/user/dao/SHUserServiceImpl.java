package com.sung.hee.user.dao;

import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.user.model.SHUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by SungHere on 2017-04-19.
 */
@Service
public class SHUserServiceImpl implements SHUserService {

    @Autowired
    private SHUserDAO shUserDAO;

    @Transactional
    public void regi(SHUser user) throws Exception {
        shUserDAO.regi(user);
    }

    @Transactional(readOnly = true)
    public SHUser login(SHUser user) {
        return shUserDAO.login(user);
    }

    @Transactional(readOnly = true)
    public int getID(SHUser user) {

        return shUserDAO.getID(user);
    }

    public void emailCerti(SHUser user) {
        shUserDAO.emailCerti(user);
    }

    @Transactional(readOnly = true)
    public List<SHUser> getEntUserlist(SHEnt ent) {
        return shUserDAO.getEntUserlist(ent);
    }
}
