package com.sung.hee.user.dao;

import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.user.model.SHUser;

import java.util.List;

public interface SHUserDAO {
    void regi(SHUser user);

    SHUser login(SHUser user);

    int getID(SHUser user);

    List<SHUser> getEntUserlist(SHEnt ent);
}
