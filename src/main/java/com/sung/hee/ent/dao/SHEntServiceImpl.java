package com.sung.hee.ent.dao;

import com.sung.hee.ent.model.SHEnt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by SungHere on 2017-04-27.
 */
@Service
public class SHEntServiceImpl implements SHEntService {

    @Autowired
    SHEntDAO shEntDAO;

    @Transactional
    public void addEnt(SHEnt ent) {
        shEntDAO.addEnt(ent);
    }

    @Transactional(readOnly = true)
    public String getEntName(SHEnt ent) {
        return shEntDAO.getEntName(ent);
    }

    @Transactional(readOnly = true)
    public SHEnt getEnt(SHEnt ent) {
        return shEntDAO.getEnt(ent);
    }

    @Transactional
    public void addNum(SHEnt ent) {
        shEntDAO.addNum(ent);
    }

    @Transactional
    public void entDel(SHEnt ent) {
        shEntDAO.entDel(ent);
    }

    @Transactional(readOnly = true)
    public List<SHEnt> getEntList() {
        return shEntDAO.getEntList();
    }

    @Transactional(readOnly = true)
    public Integer entNameCheck(SHEnt ent) {
        return shEntDAO.entNameCheck(ent);
    }
}
