package com.sung.hee.ent.dao;

import com.sung.hee.ent.model.SHEnt;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SungHere on 2017-04-27.
 */
@Repository
public class SHEntDAOImpl implements SHEntDAO {
    private String ns = "SHENT.";

    @Autowired
    SqlSession sqlSession;

    public void addEnt(SHEnt ent) {

        sqlSession.insert(ns + "addEnt", ent);
    }

    public String getEntName(SHEnt ent) {
        return sqlSession.selectOne(ns + "getEntName", ent);
    }

    public Integer entNameCheck(SHEnt ent) {
        return (Integer) sqlSession.selectOne(ns + "entNameCheck", ent);
    }

    public SHEnt getEnt(SHEnt ent) {
        return sqlSession.selectOne(ns + "getEnt", ent);
    }

    public void addNum(SHEnt ent) {

        sqlSession.update(ns + "addNum", ent);
    }

    public void entDel(SHEnt ent) {

        sqlSession.update(ns + "entDel", ent);
    }

    public List<SHEnt> getEntList() {
        return sqlSession.selectList(ns + "getEntList");
    }


}
