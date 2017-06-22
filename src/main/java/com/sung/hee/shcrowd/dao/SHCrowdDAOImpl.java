package com.sung.hee.shcrowd.dao;

import com.sung.hee.shcrowd.model.SHFund;
import com.sung.hee.help.CrowdLike;
import com.sung.hee.help.MyCrowd;
import com.sung.hee.shcrowd.model.SHCrowd;
import com.sung.hee.user.model.SHUser;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SungHere on 2017-05-28.
 */
@Repository
public class SHCrowdDAOImpl implements SHCrowdDAO {
    String ns = "SHCrowd.";

    @Autowired
    SqlSession sqlSession;

    public void crowdUnLike(CrowdLike crowdLike) {
        sqlSession.delete(ns + "crowdUnLike", crowdLike);
    }

    public void addCrowd(SHCrowd crowd) throws Exception {

        sqlSession.insert(ns + "addCrowd", crowd);

    }

    public void delCrowd(SHCrowd crowd) {
        sqlSession.delete(ns + "delCrowd", crowd);

    }

    public SHCrowd detailCrowd(SHCrowd crowd) {
        return sqlSession.selectOne(ns + "detailCrowd", crowd);
    }

    public List<SHCrowd> reqCrowdList() {
        return sqlSession.selectList(ns + "reqCrowdList");
    }

    public List<SHCrowd> myReqCrowdList(SHUser user) {
        return sqlSession.selectList(ns + "myReqCrowdList", user);

    }

    public void accCrowd(SHCrowd crowd) {

        sqlSession.update(ns + "accCrowd", crowd);
    }

    public List<SHCrowd> crowdList(SHCrowd crowd) {
        return sqlSession.selectList(ns + "crowdList", crowd);
    }

    public List<SHCrowd> crowdListAll() {
        return sqlSession.selectList(ns + "crowdListAll");

    }


    public List<SHCrowd> listbySearch(SHCrowd crowd) {
        return sqlSession.selectList(ns + "listbySearch", crowd);
    }

    public List<MyCrowd> myCrowdList(MyCrowd myCrowd) {
        return sqlSession.selectList(ns + "myCrowdList", myCrowd);
    }

    public void fundCrowd(SHFund shFund) {
        sqlSession.insert(ns + "fundCrowd", shFund);
    }

    public void moneyUpdate(SHFund shFund) {
        sqlSession.update(ns + "moneyUpdate", shFund);
    }

    public void fundCrowdCancel(SHFund shFund) {
        sqlSession.delete(ns + "fundCrowdCancel", shFund);
    }

    public Integer crowdLikeNum(CrowdLike crowdLike) {
        return sqlSession.selectOne(ns + "crowdLikeNum", crowdLike);
    }


    public void crowdLike(CrowdLike crowdLike) {
        sqlSession.insert(ns + "crowdLike", crowdLike);
    }

    public Integer crowdLikeChk(CrowdLike crowdLike) {
        return sqlSession.selectOne(ns + "crowdLikeChk", crowdLike);
    }

    public void likeUpdate(CrowdLike crowdLike) {
        sqlSession.update(ns + "likeUpdate", crowdLike);
    }

    public void endFlag(SHCrowd crowd) {
        sqlSession.update(ns + "endFlag", crowd);
    }

    public void finishReward(SHCrowd shCrowd) {
        sqlSession.update(ns + "finishReward", shCrowd);
    }

    public void addReward(SHCrowd shCrowd) {
        sqlSession.update(ns + "addReward", shCrowd);
    }

    public void inPoint(SHUser shUser) {
        sqlSession.update(ns + "inPoint", shUser);

    }

    public void dePoint(SHUser shUser) {
        sqlSession.update(ns + "dePoint", shUser);

    }

    public void noCrowd(SHCrowd shCrowd) {
        sqlSession.update(ns + "noCrowd", shCrowd);
    }

    public List<String> findTag() {
        return sqlSession.selectList(ns + "findTag");
    }

	public List<SHCrowd> searchCategory(SHCrowd shCrowd) {
		return sqlSession.selectList(ns + "searchCategory", shCrowd);
	}

	public void updateCrowd(SHCrowd shCrowd) {
		sqlSession.update(ns + "updateCrowd", shCrowd);
	}

    @Override
    public List<SHCrowd> crowdListAllforCal() {
        return sqlSession.selectList(ns + "crowdListAllforCal");
    }
}
