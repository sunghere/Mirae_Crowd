package com.sung.hee.ent.dao;

import com.sung.hee.ent.model.SHEnt;

import java.util.List;

/**
 * Created by SungHere on 2017-04-27.
 */
public interface SHEntService {
    void addEnt(SHEnt ent);

    String getEntName(SHEnt ent);

    SHEnt getEnt(SHEnt ent);

    void addNum(SHEnt ent);

    void entDel(SHEnt ent);

    List<SHEnt> getEntList();

    Integer entNameCheck(SHEnt ent);

}
