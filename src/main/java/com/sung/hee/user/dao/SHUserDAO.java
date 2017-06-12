package com.sung.hee.user.dao;

import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.user.model.SHUser;

import java.util.List;

public interface SHUserDAO {
    void regi(SHUser user) throws Exception;

    SHUser login(SHUser user);

    int getID(SHUser user);

    String getPWD(SHUser user);

    void emailCerti(SHUser user);

    List<SHUser> getEntUserlist(SHEnt ent);

    void inPoint(SHUser user) throws Exception;

    void dePoint(SHUser user) throws Exception;
    
    void pwdUpdate(SHUser shUser);

    SHUser getIsSnS(SHUser shUser);
}
