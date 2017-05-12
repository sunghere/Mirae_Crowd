package com.sung.hee.user.dao;

import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.user.model.SHUser;

import java.util.List;

/**
 * Created by SungHere on 2017-04-19.
 */
public interface SHUserService {
    void regi(SHUser user);

    SHUser login(SHUser user);

    int getID(SHUser user);

    List<SHUser> getEntUserlist(SHEnt ent);

}
