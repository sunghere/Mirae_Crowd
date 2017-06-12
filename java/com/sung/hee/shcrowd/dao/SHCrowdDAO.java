package com.sung.hee.shcrowd.dao;

import com.sung.hee.help.CrowdLike;
import com.sung.hee.help.MyCrowd;
import com.sung.hee.shcrowd.model.SHCrowd;
import com.sung.hee.shcrowd.model.SHFund;
import com.sung.hee.user.model.SHUser;

import java.util.List;
/*com.sung.hee.shcrowd.dao.SHCrowdDAO*/

/**
 * Created by SungHere on 2017-05-24.
 */
public interface SHCrowdDAO {


    void addCrowd(SHCrowd crowd) throws Exception; /* 크라우드 글쓰기(신청 req=0)*/

    void delCrowd(SHCrowd crowd); /* 크라우드 글삭제 */

    SHCrowd detailCrowd(SHCrowd crowd); /* 글 상세보기 */

    List<SHCrowd> reqCrowdList(); /* 글 신청 목록(req=0 인것들) */

    List<SHCrowd> myReqCrowdList(SHUser user); /* 내 글 신청 목록(req=0 인것들) */

    void accCrowd(SHCrowd crowd); /* 글 신청 수락(req=1) */

    Integer crowdLikeNum(CrowdLike crowdLike); /* like 갯수 얻어오기*/


    List<SHCrowd> crowdList(SHCrowd crowd); /* 글 리스트 */

    List<SHCrowd> crowdListAll(); /* 글 리스트 전부*/

    List<SHCrowd> listbySearch(SHCrowd crowd); /* 검색 리스트*/

    List<MyCrowd> myCrowdList(MyCrowd myCrowd); /* 내가 펀딩한 리스트*/

    void fundCrowd(SHFund shFund); /* 유저 펀딩 */

    /*  void crowdUnLike();*/
    void moneyUpdate(SHFund shFund);/* 펀딩한 만큼 금액추가*/

    void fundCrowdCancel(SHFund shFund); /* 유저 펀딩 취소(예비기능)*/

    void crowdLike(CrowdLike crowdLike); /* 좋아요 기능 */

    Integer crowdLikeChk(CrowdLike crowdLike); /* 좋아요 중복체크 */

    void crowdUnLike(CrowdLike crowdLike); /* 좋아요 취소*/

    void likeUpdate(CrowdLike crowdLike); /*좋아요 개수 증감*/

    void endFlag(SHCrowd crowd); /* 끝남체크*/

    void finishReward(SHCrowd shCrowd); /* 펀딩 종료후 금액 수령*/

    void addReward(SHCrowd shCrowd);

    void inPoint(SHUser shUser); /* 포인트 증감 */

    void dePoint(SHUser shUser);

    void noCrowd(SHCrowd shCrowd); /* 요청 거절 */

    List<String> findTag();
    
    List<SHCrowd> searchCategory(SHCrowd shCrowd);
}