package com.sung.hee.user.dao;

import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.help.EncryptUtil;
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

    @Override
    public boolean pwdFindCerti(String id, String en) {
        boolean result = false;

        if (EncryptUtil.getMD5(id).equals(en)) {
            SHUser shUser = new SHUser();
            shUser.setId(id);
            shUser.setPwd("0000");
            pwdUpdate(shUser);
            result = true;
        } else {

        }


        return result;

    }

    @Transactional(readOnly = true)
    public SHUser login(SHUser user) {

        String shaPwd = EncryptUtil.getSHA256(user.getPwd());

        user.setPwd(shaPwd);

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
    public boolean emailCerti(String id, String en) {

        boolean result = false;
        if (EncryptUtil.getMD5(id).equals(en)) {
            SHUser user = new SHUser();
            user.setId(id);
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
