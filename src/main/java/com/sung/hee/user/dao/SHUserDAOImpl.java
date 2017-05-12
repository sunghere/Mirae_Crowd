package com.sung.hee.user.dao;

import com.sung.hee.ent.model.SHEnt;
import com.sung.hee.user.model.SHUser;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Vector;

/**
 * Created by SungHere on 2017-04-19.
 */
@Repository
public class SHUserDAOImpl implements SHUserDAO {

    String ns = "SHUser.";
    @Autowired
    SqlSession sqlSession;

    public void regi(SHUser user) {
        sqlSession.insert(ns + "regi", user);
    }

    public SHUser login(SHUser user) {
        return (SHUser) sqlSession.selectOne(ns + "login", user);

    }

    public int getID(SHUser user) {
        return (Integer) sqlSession.selectOne(ns + "getID", user);
    }

    public List<SHUser> getEntUserlist(SHEnt ent) {
        return sqlSession.selectList(ns + "getEntUserlist", ent);
    }
}
