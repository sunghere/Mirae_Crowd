<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<footer id="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-6 col-sm-3 column">
                <h4>Information</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Products</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Benefits</a></li>
                    <li><a href="#">Developers</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-sm-3 column">
                <h4>About</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Delivery Information</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#term-modal">Privacy Policy</a></li>
                </ul>
            </div>

            <div class="col-xs-12 col-sm-3 text-right">
                <h4>Follow</h4>
                <ul class="list-inline">
                    <li><a href="http://twitter.com/Sunghee____" title="Twitter"><i
                            class="icon-lg ion-social-twitter-outline"></i></a>&nbsp;
                    </li>
                    <li><a href="http://facebook.com/sunghee4" title="Facebook"><i
                            class="icon-lg ion-social-facebook-outline"></i></a>&nbsp;
                    </li>
                    <li><a href="http://github.com/sunghere" title="GitHub"><i
                            class="icon-lg ion-social-github-outline"></i></a>&nbsp;
                    </li>
                </ul>
                <form>

                    <div class="form-group">
                        <div id="showMsgBt" data-toggle="modal" data-target="#alertModal"
                             type="button" hidden="hidden">
                        </div>

                    </div>
                </form>
                <span class="pull-right text-muted"><a
                        href="http://sunghere.github.io">Github Blog by Sunghere</a> ©2017 Yoon Sung Hee</span>

            </div>
            <div class="col-xs-12 col-sm-3 column">
                <div class="panel panel-danger">
                    <div class="panel-heading">Warning
                        <button class="btn" id="showAboutBt" data-toggle="modal" data-target="#aboutModal"
                                type="button">
                            more..
                        </button>
                    </div>
                    <div class="panel-body waring-text"> Crowd Funding은 원금을 보장하지 못합니다.<br> 투자 전에 투자위험에 대한 내용을 꼭 확인해
                        주세요

                    </div>

                </div>

            </div>
        </div>
        <br/>

    </div>
</footer>
<%--사진을 나타내기위한 갤러리모달--%>
<div id="galleryModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <img src="" id="galleryImage" class="img-responsive"/>
                <p>
                    <br/>
                    <button type="button" class="btn btn-warning btn-lg center-block" data-dismiss="modal"
                            aria-hidden="true">Close <i
                            class="ion-android-close"></i></button>
                </p>
            </div>
        </div>
    </div>
</div>
<%--경고창--%>
<div id="aboutModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" class="close" id="aboutModal_close" data-dismiss="modal">
                    <span class='loginexit' aria-hidden="true">x</span>
                    <span class="sr-only">Close</span>
                </button>
                <h3 class="title_Type">
                    투자 위험 경고
                </h3>
            </div>
            <div class="modal-body">
                <div class="crowd-fund-term">
                    <h4 class="aboutModal-title">원금손실의 위험이 있습니다.</h4>
                    <p class="aboutModal-text">모든 투자는 원금손실의 위험을 가지고 있습니다. 때문에 투자 시 한 곳에만 투자하지 아니하고 다양한 상품에 분산하여 투자하실 것을
                        권유 드립니다. Crowd funding은 온라인소액투자중개업자로 증권 모집을 중개하는 업을 영위하고 있으며, 원금손실에 대한 책임을 지지 않습니다. 모든 투자는 투자자
                        본인의 의사에 따라
                        결정되어야 합니다.</p>
                    <h4 class="aboutModal-title">환금성이 낮습니다.</h4>
                    <p class="aboutModal-text">비상장기업에 대한 투자는 환금성이 낮습니다. Crowd funding의 중개를 통해 모집된 증권은 1년 이내 전매가 제한되며,
                        매매가 가능한 시점이
                        되더라도 현금으로의 전환이 보장되지는 않습니다. 투자금을 회수하기 위하여 주식의 경우 스타트업 주식거래시장(KSM)에서 거래하거나, 기업의 M&amp;A 또는 주식시장 상장
                        등이 있을 때까지 기다려야 할 수 있습니다. 채무증권이나 주식 관련 채권의 경우에도 특별한 사정이나 조건이 없는 한 만기까지 기다려야 합니다.</p>
                    <h4 class="aboutModal-title">배당가능성이 낮습니다.</h4>
                    <p class="aboutModal-text">Crowd funding의 중개를 통해 증권을 발행하는 비상장 기업은 성장초기단계에 있는 경우가 많기 때문에, 아직 성장해야 하는
                        단계이기 때문에
                        정기 배당을 실시하는 경우가 매우 드뭅니다. 따라서 배당수익을 기대하고 투자를 할 경우 기대한 만큼의 수익을 얻지 못할 수 있습니다.</p>
                    <h4 class="aboutModal-title">지분 희석이 발생할 수 있습니다.</h4>
                    <p class="aboutModal-text">Crowd funding을 통하여 투자한 회사는 지속적으로 성장하기위하여 해당 기업의 정관에 근거하여 유상증자를 실시할 가능성이
                        높습니다. 유상증자로
                        인하여 투자자가 보유한 지분율은 감소될 수 있습니다.</p>
                    <p class="aboutModal-text">모든 투자에는 기대수익에 상응하는 투자위험이 있음을 유의하셔야 합니다. 투자자는 투자결과에 따라 높은 수익을 얻을 수도 있지만,
                        원금의 100%를 손실할 가능성도 있습니다. 해당 사이트에서 이루어지는 투자에 따른 손실 또는 그 위험을 보전해 드리지 못하며,
                        투자에 따른 모든 책임은 각 투자자에게 귀속됩니다. 따라서 투자자가 직접 습득한 정보와 자체적인 투자의 의사결정에 따라 투자에 임하실 것을 당부 드립니다.</p>
                </div>
                <button type="button" class="btn btn-danger btn-lg center-block" data-dismiss="modal"
                        aria-hidden="true">모든 내용을 확인하였습니다.
                </button>
            </div>
        </div>
    </div>
</div>
<%--이용약관 창--%>
<div id="term-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" class="close" id="term-modal-close" data-dismiss="modal">
                    <span class='loginexit' aria-hidden="true">x</span>
                    <span class="sr-only">Close</span>
                </button>
                <h3 class="title_Type">
                    개인정보 취급방침
                </h3>
            </div>
            <div class="modal-body">
                <div class="regi-term">
                    <p>
                    <p class="ls2 lh6 bs5 ts4">
                        <em class="emphasis">
                            &lt;doblue&gt;('www.doblue.ga'이하 'doblue')</em>은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고
                        개인정보와 관련한 이용자의 고충을 원활하게
                        처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.
                    </p>
                    <p class="ls2 lh6 bs5 ts4">
                        <em class="emphasis">&lt;doblue&gt;('doblue')</em> 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는
                        개별공지)을 통하여 공지할 것입니다.
                    </p>
                    <p class="ls2">○ 본 방침은부터 <em class="emphasis">2017</em>년 <em class="emphasis">6</em>월 <em
                            class="emphasis">1</em>일부터
                        시행됩니다.</p></br><p class='lh6 bs4'><strong>1. 개인정보의 처리 목적 <em class="emphasis">
                    &lt;doblue&gt;('www.doblue.ga'이하 'doblue')
                </em>은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할
                    예정입니다.</strong></p>
                    <p class="ls2">가. 홈페이지 회원가입 및 관리</p>
                    <p class="ls2">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지,
                        만14세 미만 아동 개인정보 수집 시 법정대리인 동의 여부 확인, 각종 고지·통지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를
                        처리합니다.</p></br><p class="ls2">나. 재화 또는 서비스 제공</p>
                    <p class="ls2">서비스 제공, 청구서 발송, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">
                    다. 마케팅 및 광고에의 활용</p>
                    <p class="ls2">이벤트 및 광고성 정보 제공 및 참여기회 제공 , 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를
                        처리합니다.</p></br></br></br><p class='lh6 bs4'><strong>2. 개인정보 파일 현황</br>('www.doblue.ga'이하
                    'doblue')가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.</strong></p></br>※ 기타('www.doblue.ga'이하
                    'doblue')의 개인정보파일 등록사항 공개는 행정안전부 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일
                    목록검색 메뉴를 활용해주시기 바랍니다.</br></br><p class='lh6 bs4'><strong>3. 개인정보의 처리 및 보유 기간</strong></br></br>①
                    <em class="emphasis">
                        &lt;doblue&gt;('doblue')
                    </em>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.</br></br>
                    ② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p>1.
                    &lt;홈페이지 회원가입 및 관리&gt;</br>
                    &lt;홈페이지 회원가입 및 관리&gt;와 관련한 개인정보는 수집.이용에 관한 동의일로부터
                    &lt;준영구&gt;까지 위 이용목적을 위하여 보유.이용됩니다.</br>-보유근거 : 비밀번호의 암호화</br>-관련법령 : </br>-예외사유
                    : </br></br></br></br><p class='lh6 bs4'><strong>4. 개인정보처리 위탁</strong></br></br> ①
                    <em class="emphasis">
                        &lt;doblue&gt;('doblue')
                    </em>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p>
                    <p class='ls2'>1.
                        &lt;Mailgun&gt;</br>- 위탁받는 자 (수탁자) : 메일발송(인증메일/ Certification)</br>- 위탁하는 업무의 내용 :
                        이메일</br>- 위탁기간 : 서비스 이용기간
                    </p>
                    </br></br>② <em class="emphasis">
                    &lt;doblue&gt;('www.doblue.ga'이하 'doblue')
                </em>은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에
                    대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</br></br>③
                    위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</br><br/><br/>
                    <p class='lh6 bs4'><strong>5. 정보주체의 권리,의무 및 그 행사방법 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수
                        있습니다.</strong></p>
                    <p class='ls2'>① 정보주체는 doblue(‘www.doblue.ga’이하 ‘doblue) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련
                        권리를 행사할 수 있습니다.</br>1. 개인정보 열람요구</br>2. 오류 등이 있을 경우 정정 요구</br>3. 삭제요구</br>4. 처리정지
                        요구</br>② 제1항에 따른 권리 행사는doblue(‘www.doblue.ga’이하 ‘doblue) 에 대해 개인정보 보호법 시행규칙 별지 제8호
                        서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며
                        &lt;기관
                        /회사명&gt;(‘사이트URL’이하 ‘사이트명) 은(는) 이에 대해 지체 없이 조치하겠습니다.</br>③ 정보주체가 개인정보의 오류 등에 대한 정정
                        또는 삭제를 요구한 경우에는
                        &lt;기관
                        /회사명&gt;(‘사이트URL’이하 ‘사이트명) 은(는) 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</br>④
                        제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지
                        제11호 서식에 따른 위임장을 제출하셔야 합니다.</p></br></br><p class='lh6 bs4'><strong>6. 처리하는 개인정보의 항목
                    작성 </strong></br></br> ①
                    <em class="emphasis">
                        &lt;doblue&gt;('www.doblue.ga'이하 'doblue')
                    </em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.</p>
                    <p class='ls2'>1
                        &lt;홈페이지 회원가입 및 관리&gt;</br>- 필수항목 : 이메일, 비밀번호, 로그인ID, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP
                        정보</br>-
                        선택항목 : -
                    </p>
                    </br></br></br><p class='lh6 bs4'><strong>7. 개인정보의 파기<em
                        class="emphasis">&lt;doblue&gt;('doblue')</em>은(는)
                    원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.</strong>
                </p>
                    <p class='ls2'>-파기절차이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라
                        일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지
                        않습니다.-파기기한이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당
                        서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를
                        파기합니다.</p>
                    <p class='ls2'>-파기방법</br>전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.</p></br></br><p
                        class='lh6 bs4'><strong>8. 개인정보의 안전성 확보 조치
                    <em class="emphasis">
                        &lt;doblue&gt;('doblue')
                    </em>은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</strong>
                </p>
                    <p class='ls2'>1. 개인정보 취급 직원의 최소화 및 교육</br> 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를
                        관리하는 대책을 시행하고 있습니다.</br></br>2. 내부관리계획의 수립 및 시행</br> 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고
                        시행하고 있습니다.</br></br>3. 해킹 등에 대비한 기술적 대책</br> <<em class="emphasis">doblue</em>>('<em
                                class="emphasis">doblue</em>')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여
                        보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고
                        있습니다.</br></br>4. 개인정보의 암호화</br> 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며
                        중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</br></br>5.
                        개인정보에 대한 접근 제한</br> 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여
                        필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</br></br>6. 문서보안을 위한 잠금장치
                        사용</br> 개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.</br></br>7. 비인가자에 대한 출입
                        통제</br> 개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</br></br>
                    </p></br></br><p class='lh6 bs4'><strong>9. 개인정보 보호책임자 작성 </strong></p><br/> ①
                    doblue(‘www.doblue.ga’이하 ‘doblue) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의
                    불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<p class='ls2'><br/>▶ 개인정보 보호책임자
                    <br/>성명 :윤성희<br/>직책 :책임자<br/>직급 :admin<br/>연락처 :010|4694|516O, cisisn@naver.com,
                    <br/>※ 개인정보 보호 담당부서로 연결됩니다.<br/>
                    <br/>▶ 개인정보 보호 담당부서<br/>부서명 : doblue<br/>담당자 : 윤성희<br/>연락처 :010|4694|516O
                    <br/>② 정보주체께서는 doblue(‘www.doblue.ga’이하 ‘doblue) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호
                    관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. doblue(‘www.doblue.ga’이하
                    ‘doblue) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p></br></br><p class='lh6 bs4'>
                    <strong>10. 개인정보 처리방침 변경 </strong></p>
                    <p>①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터
                        공지사항을 통하여 고지할 것입니다.</p></p>

                </div>
                <button type="button" class="btn btn-danger btn-lg center-block term-btn" data-dismiss="modal"
                        aria-hidden="true">모든 내용을 확인하였습니다.
                </button>
            </div>
        </div>
    </div>
</div>
<%--메시지를 띄우는용도의 창 showMsg사용--%>
<div id="alertModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">


        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" class="close" id="showMsg-close"
                        data-dismiss="modal">
                    <span class='showMsg-close' aria-hidden="true">x</span> <span
                        class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-center" id="myMsg"></p>
            </div>
        </div>
    </div>
</div>
<%--펀드모달--%>
<div id="fund-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-body">
                <div class="pay-agree text-center"><h4 class="mini-warning-header">경고</h4>
                    <div class="text-center mini-warning-body">투자의 위험성을 <br>알고 계신가요?<br>
                        <button class="btn btn-danger" data-toggle="modal" data-target="#aboutModal" type="button">
                            자세히..
                        </button>
                        <br></div>
                    <div class="btn-group check-btn " data-toggle="buttons">
                        <label class="btn btn-danger"><input type="checkbox"><i class="fa fa-check"
                                                                                aria-hidden="true"></i>확인
                        </label></div>
                </div>

                <div class="pay-type" style="display:none">
                    <div class="pay-type-row row">
                        <h4 class="pay-type-header">결제방식을 선택 해 주세요</h4>
                        <div class="form-group" data-toggle="buttons">
                            <div class="btn-group">
                                <label for="kakao-type" class="btn btn-default pay-type-select active">
                                    <input type="radio" name="pay-type" id="kakao-type" autocomplete="off"/>
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span>&nbsp;</span>
                                </label>
                                <label for="kakao-type" id="kakao-label" class="btn btn-default" disabled>
                                    KaKao
                                </label>
                            </div>
                            <div class="btn-group">
                                <label for="app-type" class="btn btn-default pay-type-select">
                                    <input type="radio" name="pay-type" id="app-type" autocomplete="off"/>
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span>&nbsp;</span>
                                </label>
                                <label for="app-type" id="app-label" class="btn btn-default" disabled>
                                    App
                                </label>
                            </div>
                            <div class="btn-group active">
                                <label for="point-type" class="btn btn-default pay-type-select">
                                    <input type="radio" name="pay-type" id="point-type" autocomplete="off" checked/>
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span>&nbsp;</span>
                                </label>
                                <label for="point-type" class="btn btn-default" id="point-label" disabled>
                                    Point
                                </label>
                            </div>
                            <div class="pay-content">
                                <div class="center-block">
                                    <input type="text" class="black-control" placeholder="금액"
                                           onchange="getNumber_comma(this);" onkeyup="getNumber_comma(this);"
                                           name="fund-money">
                                    <button type="button" class="btn btn-info fund-btn" data-src="">확인</button>

                                </div>
                                <div class="kakao-content">
                                    <div class="text-center well">카카오톡으로 접속해서 주문코드를 입력해주세요.
                                        <br>주문 코드는
                                        <span class="cbox" id="kakao-order-code">&nbsp;&nbsp;&nbsp;</span>
                                        입니다
                                    </div>
                                </div>
                                <div class="app-content" hidden="hidden">
                                    <div class="well text-center">추후 지원 예정입니다.</div>
                                </div>
                                <div class="point-content" hidden="hidden">
                                    <div class="well text-center"><input type="text" class="black-control mypoint"
                                                                         value="잔액 :${login.point}" disabled></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--로그인창--%>
<div class="modal fade" id="shLogin" style="display: none;" aria-hidden="true">
    <div id="login_bg"
         style="background-color: rgba(0,0,0,0.5); position: fixed; top: 0; left: 0; width: 100%; height: 100%;"></div>
    <div class="modal-dialog login_popup" id="login_popup">
        <div class="modal-content login_popup_content">
            <div class="modal-header line_none">
                <button type="button" class="close" id="login_close" data-dismiss="modal">
                    <span class='loginexit' aria-hidden="true">x</span>
                    <span class="sr-only">Close</span>
                </button>
                <h2 class="title_Type">
                    SH Crowd Login
                </h2>
                <h3 class="subtitle_Type_mb50">
                    환영합니다. 로그인해주세요<i class=""></i>
                </h3>
            </div>
            <div class="modal-body">
                <form id="loginform">
                    <input type="text" id="login_userid" data-msg="ID" class="form-control input-sm"
                           placeholder="ID" value="demo"
                           name="id"
                           size="15">
                    <br>
                    <input type="password" id="login_pwd" data-msg="패스워드" title="패스워드" class="form-control"
                           placeholder="PASSWORD" name="pwd" value="test"
                           size="15"><br>

                    <div id='loginErrmsg' class="subtitle_Type_mb50"></div>
                    <br>
                    <button class="btn btn-primary btn-default" type="button" id="login_btnLogin" title="로그인">로그인
                    </button>
                    <button class="btn btn-primary btn-default" type="button" id="login_btnRegi" title="회원가입">회원가입
                    </button>
                    <button class="btn btn-primary btn-default" type="button" data-toggle="modal"
                            data-target="#term-modal" title="Privacy Policy">Privacy Policy
                    </button>


                </form>
            </div>
            <div class="modal-footer">
                <h5 class="subtitle_Type_mb_10">
                    SNS 간편 로그인 & 회원가입하기<br><br>
                </h5>
                <div class="text-center">
                    <a id="kakao-login-btn"></a>
                    <br>
                    <br>
                    <div class="fb-login-button" data-width="222px" data-max-rows="1" data-size="large"
                         data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false"
                         data-use-continue-as="false" onlogin="fb_logininit()"></div>
                </div>
                <br>
                <h5 class="subtitle_Type_mb_10">
                    개인 이메일로 회원가입하시겠어요?<br><br>
                </h5>
                <div class="btn_group_center">
                    <span class="btn btn-default btn_style find"><a href="regi.do"><i class="fa fa-user-plus"
                                                                                      aria-hidden="true"></i>회원가입 하러가기</a></span>
                </div>
                <h5 class="subtitle_Type_mb_10">
                    아이디/비밀번호를 잊으셨나요?<br><br>
                </h5>
                <div class="btn_group_center">
                    <span class="btn btn-default btn_style find" id="pwd-find-btn">비밀번호 찾기</span>
                </div>

            </div>
        </div>
    </div>
</div>

<%--1:1문의 모달--%>
<div id="chatModal" class="modal fade" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" id="chatModal_close" class="close"
                        data-dismiss="modal">
                    <span class='close' aria-hidden="true">x</span> <span
                        class="sr-only">Close</span>
                </button>
                <h3 class="title_Type" id='chat-title'>1:1 문의</h3>
            </div>
            <div class="modal-body">
                <div id="chatlist"></div>
                <input type="text" class="form-control input-lg" placeholder="문의내용을 입력해주세요. 빠른시일내 확인하여 연락드리겠습니다."
                       id="chat-text">
            </div>
        </div>
    </div>
</div>
<div id="last"></div>
<%--리모콘--%>
<div id="_sildebtn">
    <div class="sh-in-search sh-remote">
        <img src="image/shsearch.png" class="search-remote">
        <span hidden="hidden" data-target="#searchModal" data-toggle="modal" id="search-btn"></span>
    </div>
    <div class="sh-in-talk sh-remote">
        <img src="image/shtalk.png" class="chat"> <span hidden="hidden"
                                                        data-target='#chatModal' data-toggle="modal"
                                                        id="chatbtn"></span>
    </div>
    <div class="sh-out-remote sh-remote">
        <img src="image/shall.png"/>
    </div>
</div>
<style>
    .pwd-send-btn, .pwd-input {
        margin-top: 10px;
    }

    .detail-content {
        margin-bottom: 10%;
    }

    .crowd-reply {
        background: lavenderblush;
        padding: 10px 15px;
        border-radius: 15px;
        margin-bottom: 10px;
    }

    .crowd-reply-id {
        text-align: right;
    }

    .crowd-reply-content {
        padding: 5px 0;
        text-indent: 15px;
    }

    .crowd-reply-btn {
        border: 1px solid #e5e5e5;
    }
</style>
<%--디테일 모달--%>
<div id="detailModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-content-main">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">x</span>
                    <span class="sr-only">Close</span>
                </button>
                <h3 class="detail-title"></h3>
            </div>
            <div class="modal-body">
                <div class="row detail-body">
                    <div class="detail-summary col-sm-12 col-md-4"></div>
                    <div class="detail-detail col-sm-12 col-md-8"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<%--검색 모달--%>
<div id="searchModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md search-md">
        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" id="searchModal_close" class="close"
                        data-dismiss="modal">
                    <span class='close' aria-hidden="true">x</span> <span
                        class="sr-only">Close</span>
                </button>
                <h4 class="search-modal-title"><i class="fa fa-search" aria-hidden="true"></i>빠른
                    검색<span>모든 주제로 검색이 됩니다.</span></h4>
                <input type="text" class="form-control input-lg" id="modal-search-text" placeholder="Search For...">
            </div>
            <div class="modal-body">
                <div id="searchlist"></div>
                <div id="searchresult" hidden="hidden"></div>
            </div>
        </div>
    </div>
</div>

<%--리플--%>
<div id="replyModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content reply-modal-content">
            <div class="modal-header line_none">
                <button type="button" class="close"
                        data-dismiss="modal">
                    <span class='close' aria-hidden="true">x</span> <span
                        class="sr-only">Close</span>
                </button>
                <h3 class="title_Type">Reply Edit</h3>
            </div>
            <div class="modal-body">
                <div class="black-control col-xs-6 col-xs-offset-1 col-sm-offset-1">${login.name}</div>
                <br>

                <textarea
                        class="col-xs-12 col-md-12 col-lg-12 col-sm-12 black-control reply-modal-area"
                        rows="4"></textarea>
                <button class="btn btn-info col-xs-3 col-sm-3 reply-modal-btn" type="button"
                        datasrc="">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>쓰기
                </button>
            </div>
        </div>
    </div>
</div>

<input type="hidden" class="search_type" data-src="">
<input type="hidden" class="search" data-src="">
<!-- 리플 모달 버튼 -->
<input type="hidden" hidden="hidden" id="reply-modal-btn" data-toggle="modal" data-target="#replyModal">
<!-- 디테일 모달 버튼 -->
<input type="hidden" data-target='#detailModal' data-toggle='modal' id="detail-modal-btn">
<%-- 펀드 모달 버튼--%>
<input type="hidden" data-target='#fund-modal' data-toggle='modal' id="fund-modal-btn">
<script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5KvZP2PadHIlORT_ptWd&submodules=panorama,geocoder"></script>

<script>

    var myid = "${login.id}";
    if (myid == "") {
        myid = null;
    }

    /* 비밀번호 찾기 */
    $("#pwd-find-btn").click(function () {
        $('.loginexit').click();
        showMsg("<div><div>가입 시 입력하신 이메일로<br>인증메일이 발송됩니다.</div>" +
            "<div class='pwd-input'><input type='text' class='black-control pwd-send-text' placeholder='이메일을 입력해주세요'></div>" +
            "<div class='btn btn-default cbox pwd-send-btn'>인증메일 발송</div>" +
            "</div>");
    });

    /* 인증메일 발송 */
    $("#myMsg").on("click", ".pwd-send-btn", function () {
        var id = $(".pwd-send-text").val();
        var email_pattern = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        if (id.length <= 0 || id == "") {
            alert("이메일을 입력해주세요");
        } else if (!email_pattern.test(id)) {
            alert("이메일 형식을 지켜주세요")
        } else {
            $.ajax({
                type: "POST",
                url: "getID.do",
                data: {"id": id},
                success: function (msg) {
                    if (msg.message == "FAIL") {
                        alert("등록되지 않은 회원입니다");
                    } else {
                        $.ajax({
                            url: "pwdFindmail.do",
                            method: "POST",
                            data: {"id": id},
                            success: function (data) {
                                $('.showMsg-close').click();

                                if (data.message == "SUCS") {
                                    setTimeout("showMsg('메일이 발송되었습니다. 해당메일을 확인해주세요')", 500);
                                } else if (data.message == "SNS") {
                                    setTimeout("showMsg('SNS 계정은 <br>해당 기능을 지원하지 않습니다.')", 500);

                                } else {
                                    setTimeout("showMsg('메일서버 Error')", 500);

                                }
                            }
                        })
                    }
                }
            })
        }
    });


</script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.animateNumber.js"></script>
<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
<script src="<%=request.getContextPath()%>/js/shlogin.js"></script>
<script src="<%=request.getContextPath()%>/js/fblogin.js"></script>
<script src="<%=request.getContextPath()%>/js/chatscript.js"></script>
<script src="<%=request.getContextPath()%>/js/shdetail.js"></script>
<script src="<%=request.getContextPath()%>/js/shsearch.js"></script>
