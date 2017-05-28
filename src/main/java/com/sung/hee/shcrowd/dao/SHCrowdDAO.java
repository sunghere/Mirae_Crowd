package com.sung.hee.shcrowd.dao;

import com.sung.hee.help.CrowdLike;
import com.sung.hee.help.MyCrowd;
import com.sung.hee.shcrowd.model.SHCrowd;
import com.sung.hee.shcrowd.model.SHFund;
import com.sung.hee.user.model.SHUser;

import java.util.List;

/**
 * Created by SungHere on 2017-05-24.
 */
public interface SHCrowdDAO {


    public void addCrowd(SHCrowd crowd) throws Exception; /* 크라우드 글쓰기(신청 req=0)*/

    public void delCrowd(SHCrowd crowd); /* 크라우드 글삭제 */

    public SHCrowd detailCrowd(SHCrowd crowd); /* 글 상세보기 */

    public List<SHCrowd> reqCrowdList(); /* 글 신청 목록(req=0 인것들) */

    public List<SHCrowd> myReqCrowdList(SHUser user); /* 내 글 신청 목록(req=0 인것들) */

    public void accCrowd(SHCrowd crowd); /* 글 신청 수락(req=1) */

    public Integer crowdLikeNum(CrowdLike crowdLike); /* like 갯수 얻어오기*/

    public List<SHCrowd> crowdListInit(SHCrowd crowd); /* 글 리스트 초기 */

    public List<SHCrowd> crowdList(SHCrowd crowd); /* 글 리스트 */

    public List<SHCrowd> listbySearchInit(SHCrowd crowd); /* 검색 리스트 초기*/

    public List<SHCrowd> listbySearch(SHCrowd crowd); /* 검색 리스트*/

    public List<MyCrowd> myCrowdList(MyCrowd myCrowd); /* 내가 펀딩한 리스트*/

    public void fundCrowd(SHFund shFund); /* 유저 펀딩 */

    /* public void crowdUnLike();*/
    public void moneyUpdate(SHFund shFund);/* 펀딩한 만큼 금액추가*/

    public void fundCrowdCancel(SHFund shFund); /* 유저 펀딩 취소(예비기능)*/

    public void crowdLike(CrowdLike crowdLike); /* 좋아요 기능 */

    public Integer crowdLikeChk(CrowdLike crowdLike); /* 좋아요 중복체크 */

    public void crowdUnLike(CrowdLike crowdLike); /* 좋아요 취소*/

    public void likeUpdate(CrowdLike crowdLike); /*좋아요 개수 증감*/

    public void endFlag(SHCrowd crowd); /* 끝남체크*/

    public void finishReward(SHCrowd shCrowd); /* 펀딩 종료후 금액 수령*/

    void inPoint(String id);

    void dePoint(String id);
}