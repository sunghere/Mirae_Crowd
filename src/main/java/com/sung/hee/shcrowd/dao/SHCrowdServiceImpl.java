package com.sung.hee.shcrowd.dao;

import com.sung.hee.shcrowd.model.SHCrowd;
import com.sung.hee.shcrowd.model.SHFund;
import com.sung.hee.user.model.SHUser;
import com.sung.hee.help.CrowdLike;
import com.sung.hee.help.MyCrowd;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
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
    public List<SHCrowd> crowdListAllforCal() {
        return shCrowdDAO.crowdListAllforCal();
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

    }

    @Transactional
    public void fundCrowdCancel(SHFund shFund) throws Exception {
        SHUser shUser = new SHUser();
        shUser.setEpoint(shFund.getMoney());
        shUser.setId(shFund.getId());
        shCrowdDAO.inPoint(shUser);
        shCrowdDAO.fundCrowdCancel(shFund);
        shFund.setMoney(shFund.getMoney() * (-1));

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


    @Transactional
    public HashSet<String> getTagList() {
        List<String> tagList = new ArrayList();
        HashSet<String> randomList = new HashSet();
        List<String> tempList = findTag(); // 태그 리스트를 가져온다.

        for (String string : tempList) { // 가져온 태그리스트를 반복문으로 돌린다.
            for (String str : string.split("#")) { // 태그 리스트를 태그 하나하나로 나누는 작업. split을 이용
                if (!str.equals(""))
                    tagList.add(str.trim()); // 태그의 공백을 없애준다.
            }
        }
        int count = 0;
        while (randomList.size() < 7) { // 7개가 될때까지 반복하여 작업한다.
            count++;
            randomList.add(tagList.get((int) (Math.random() * tagList.size())));
            if (count > 500) {// 만약 태그의 부족으로 7개가 채워지지않는다면, 500번 정도에서 멈춰준다.(무한루프 방지)
                break;
            }
        }

        return randomList;
    }
}
