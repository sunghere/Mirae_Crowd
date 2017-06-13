package com.sung.hee.shcrowd.dao;

import com.sung.hee.shcrowd.model.SHCrowd;
import com.sung.hee.shcrowd.model.SHFund;
import com.sung.hee.user.model.SHUser;
import com.sung.hee.help.CrowdLike;
import com.sung.hee.help.MyCrowd;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by SungHere on 2017-05-28.
 */
@Service
public class SHCrowdServiceImpl implements SHCrowdService {


    @Autowired
    SHCrowdDAO shCrowdDAO;

    @Transactional
    public void addCrowd(SHCrowd crowd) throws Exception {
        shCrowdDAO.addCrowd(crowd);
    }

    @Transactional
    public void delCrowd(SHCrowd crowd) throws Exception {

        shCrowdDAO.delCrowd(crowd);
    }

    @Transactional(readOnly = true)
    public SHCrowd detailCrowd(SHCrowd crowd) {
        return shCrowdDAO.detailCrowd(crowd);
    }

    @Transactional(readOnly = true)
    public List<SHCrowd> reqCrowdList() {
        return shCrowdDAO.reqCrowdList();
    }

    @Transactional
    public List<SHCrowd> myReqCrowdList(SHUser user) {
        return shCrowdDAO.myReqCrowdList(user);

    }

    @Transactional
    public void accCrowd(SHCrowd crowd) throws Exception {
        shCrowdDAO.accCrowd(crowd);
    }


    @Transactional(readOnly = true)
    public List<SHCrowd> crowdList(SHCrowd crowd) {
        return shCrowdDAO.crowdList(crowd);
    }

    @Transactional(readOnly = true)
    public List<SHCrowd> crowdListAll() {
        return shCrowdDAO.crowdListAll();
    }

    @Transactional(readOnly = true)
    public List<SHCrowd> listbySearch(SHCrowd crowd) {
        return shCrowdDAO.listbySearch(crowd);
    }

    @Transactional(readOnly = true)
    public List<MyCrowd> myCrowdList(MyCrowd myCrowd) {
        return shCrowdDAO.myCrowdList(myCrowd);
    }

    @Transactional
    public void fundCrowd(SHFund shFund) throws Exception {
        SHUser shUser = new SHUser();
        shUser.setEpoint(shFund.getMoney());
        shUser.setId(shFund.getId());
        shCrowdDAO.dePoint(shUser);
        shCrowdDAO.fundCrowd(shFund);
        shCrowdDAO.moneyUpdate(shFund);

    }

    @Transactional
    public void fundCrowdCancel(SHFund shFund) throws Exception {
        SHUser shUser = new SHUser();
        shUser.setEpoint(shFund.getMoney());
        shUser.setId(shFund.getId());
        shCrowdDAO.inPoint(shUser);
        shCrowdDAO.fundCrowdCancel(shFund);
        shFund.setMoney(shFund.getMoney() * (-1));
        shCrowdDAO.moneyUpdate(shFund);

    }

    @Transactional
    public Integer crowdLike(CrowdLike crowdLike) throws Exception {
        int chk = shCrowdDAO.crowdLikeChk(crowdLike);

        if (chk != 0) { /* 이미 있는경우 딜리트*/
            shCrowdDAO.crowdUnLike(crowdLike);
            crowdLike.setLike(-1);

        } else { /* 없는경우 인설트*/
            shCrowdDAO.crowdLike(crowdLike);

        }
        shCrowdDAO.likeUpdate(crowdLike);

        return shCrowdDAO.crowdLikeNum(crowdLike);
    }

    @Transactional
    public void endFlag(SHCrowd crowd) throws Exception {
        shCrowdDAO.endFlag(crowd);

    }

    @Transactional
    public void finishReward(SHCrowd shCrowd) throws Exception {
        SHUser shUser = new SHUser();
        shUser.setId(shCrowd.getId());

        shUser.setEpoint(shCrowd.getCurMoney());

        shCrowdDAO.finishReward(shCrowd);

        shCrowdDAO.inPoint(shUser);

    }

    @Transactional
    public void noCrowd(SHCrowd shCrowd) {
        shCrowdDAO.noCrowd(shCrowd);
    }

    @Transactional(readOnly = true)
    public List<String> findTag() {
        return shCrowdDAO.findTag();
    }

    @Transactional(readOnly = true)
    public Integer crowdLikeChk(CrowdLike crowdLike) {
        return shCrowdDAO.crowdLikeChk(crowdLike);
    }

    @Transactional(readOnly = true)
    public List<SHCrowd> searchCategory(SHCrowd shCrowd) {
        return shCrowdDAO.searchCategory(shCrowd);
    }

    @Transactional
	public void updateCrowd(SHCrowd shCrowd) {
    	shCrowdDAO.updateCrowd(shCrowd);
	}
}
