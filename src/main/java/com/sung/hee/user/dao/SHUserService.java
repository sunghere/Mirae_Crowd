package com.sung.hee.user.dao;

import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.user.model.SHUser;

import java.util.List;

/**
 * Created by SungHere on 2017-04-19.
 */
public interface SHUserService {
    void regi(SHUser user) throws Exception;

    boolean pwdFindCerti(String id, String en);

    SHUser login(SHUser user);

    String getPWD(SHUser user);

    int getID(SHUser user);

    boolean emailCerti(String id, String en);

    List<SHUser> userlist();


    List<SHUser> getEntUserlist(SHEnt ent);

    void inPoint(SHUser user) throws Exception;

    void dePoint(SHUser user) throws Exception;

    void pwdUpdate(SHUser shUser);

    SHUser getIsSnS(SHUser shUser);
}
