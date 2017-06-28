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
    public String getPWD(SHUser user) {
        return shUserDAO.getPWD(user);
    }

    @Transactional(readOnly = true)
    public int getID(SHUser user) {

        return shUserDAO.getID(user);
    }

    @Transactional
    public boolean emailCerti(SHUser user) {


        int check = getID(user);
        boolean result = false;
        if (check != 0) {
            shUserDAO.emailCerti(user);
            result = true;
        } else {


        }


        return result;
    }

    @Override
    public List<SHUser> userlist() {
        return shUserDAO.userlist();
    }

    @Transactional(readOnly = true)
    public List<SHUser> getEntUserlist(SHEnt ent) {
        return shUserDAO.getEntUserlist(ent);
    }

    @Transactional
    public void inPoint(SHUser user) throws Exception {
        shUserDAO.inPoint(user);
    }

    @Transactional
    public void dePoint(SHUser user) throws Exception {
        shUserDAO.dePoint(user);

    }

    @Transactional
    public void pwdUpdate(SHUser shUser) {
        shUserDAO.pwdUpdate(shUser);
    }

    @Transactional(readOnly = true)
    public SHUser getIsSnS(SHUser shUser) {
        return shUserDAO.getIsSnS(shUser);
    }
}
