package com.sung.hee.controller;

import com.sung.hee.help.BoardParam;
import com.sung.hee.pds.help.FUpUtil;
import com.sung.hee.shboard.dao.SHBoardService;
import com.sung.hee.shboard.model.SHBoard;
import com.sung.hee.user.model.SHUser;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    private static final Logger logger =
            LoggerFactory.getLogger(BoardController.class);

    @Autowired
    private SHBoardService shBoardService;


    @RequestMapping(value = "boarddetail.do", method = RequestMethod.GET)
    public String boarddetail(HttpServletRequest request, SHBoard shBoard, Model model,
                              HttpServletResponse response) throws Exception {
        logger.info("Welcome BoardController boarddetail!");
        SHBoard myBoard = shBoardService.getBoard(shBoard);
        SHUser user = (SHUser) request.getSession().getAttribute("login");

        if (myBoard.getHidden() == 1)
            if (!(user.getAuth() == 1) && !(myBoard.getId().equals(user.getId()))) {

                return "redirect:/boardlist.do";
            }

        // 저장된 쿠키 불러오기
        Cookie cookies[] = request.getCookies();
        Map map = new HashMap();
        if (request.getCookies() != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie obj = cookies[i];
                map.put(obj.getName(), obj.getValue());
            }
        }
        // 저장된 쿠키중에 read_count 만 불러오기
        String readCount = (String) map.get("read_count");
        // 저장될 새로운 쿠키값 생성
        String newReadCount = "|" + myBoard.getSeq();

        // 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
        if (StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1) {
            // 없을 경우 쿠키 생성
            Cookie cookie = new Cookie("read_count", readCount + newReadCount);

            response.addCookie(cookie);
            shBoardService.updateReadCount(myBoard); // 업데이트 실행
        }


        model.addAttribute("head", myBoard.getTitle());
        model.addAttribute("board", myBoard);
        return "boarddetail.tiles";
    }

    @RequestMapping(value = "boardreply.do",
            method = {RequestMethod.POST})
    public String boardreply(SHBoard shboard, Model model) {
        logger.info("Welcome BoardController boardreply! " + new Date());
        model.addAttribute("doc_title", "Board 답글달기");
        model.addAttribute("board",
                shBoardService.getBoard(shboard));
        return "boardreply.tiles";
    }//


    @RequestMapping(value = "boardupdate.do",
            method = {RequestMethod.POST})
    public String boardupdate(SHBoard shboard, HttpServletRequest request, Model model) {
        logger.info("Welcome BoardController boardupdate! " + new Date());

        SHUser user = (SHUser) request.getSession().getAttribute("login");
        if (user == null) {
            return "redirect:/boardlist.do";

        } else {
            model.addAttribute("board",
                    shBoardService.getBoard(shboard));

            return "boardupdate.tiles";
        }
    }//


    @RequestMapping(value = "boardreplyAf.do",
            method = {RequestMethod.POST})
    public String boardreplyAf(SHBoard shboard, HttpServletRequest request,
                               @RequestParam(value = "fileload", required = false) MultipartFile fileload,
                               Model model) {
        logger.info("Welcome BoardController boardreplyAf! " + shboard);
        boolean isS = false;

        if (fileload.getOriginalFilename() == null || fileload.getOriginalFilename().equals("")) {

            try {
                shBoardService.reply(shboard);
                isS = true;
            } catch (Exception e) {

            }
        } else {

            shboard.setFilename(fileload.getOriginalFilename());
            String fupload = "/usr/local/upload";

            logger.info(": " + fupload);
            String f = shboard.getFilename();
            String newFile = FUpUtil.getNewFile(f);
            shboard.setFilename(newFile);//
            try {
                File file = new File(fupload + "/" + newFile);
                //logger.info(fupload+"\\"+newFile);
                FileUtils.writeByteArrayToFile(file, fileload.getBytes());
                shBoardService.reply(shboard);


                logger.info("Welcome boardwriteAf success! ");
            } catch (IOException e) {
                logger.info("Welcome boardwriteAf fail! ");
            } catch (Exception e) {

            }
        }//
        return "redirect:/boardlist.do";
    }

    @RequestMapping(value = "fileDownload.do", method = {RequestMethod.POST})
    public String fileDownload(int seq, HttpServletRequest request,
                               String filename, Model model) throws Exception {
        String fupload = "/usr/local/upload";
        //String fupload = request.getServletContext().getRealPath("/upload");
        File downloadFile = new File(fupload + "/" + filename);
        logger.info("Welcome fileDownload! ");
        model.addAttribute("downloadFile", downloadFile);
        model.addAttribute("seq", seq);
        return "downloadView";
    }

    @RequestMapping(value = "boardwrite.do",
            method = RequestMethod.GET)
    public String boardwrite(Model model) {
        logger.info("Welcome BoardController boardwrite! " + new Date());
        model.addAttribute("doc_title", "Board 글쓰기");
        return "boardwrite.tiles";
    }//

    @RequestMapping(value = "boardwriteAf.do",
            method = RequestMethod.POST)
    public String boardwriteAf(SHBoard board, HttpServletRequest request,
                               @RequestParam(value = "fileload", required = false) MultipartFile fileload,
                               Model model) throws Exception {
        logger.info("Welcome BoardController boardwriteAf! qeqe" + fileload.getOriginalFilename());
        if (fileload.getOriginalFilename() == null || fileload.getOriginalFilename().equals("")) {

            shBoardService.writeBoard(board);
        } else {

            board.setFilename(fileload.getOriginalFilename());

            String fupload = "/usr/local/upload";

            logger.info(": " + fupload);
            String f = board.getFilename();
            String newFile = FUpUtil.getNewFile(f);
            board.setFilename(newFile);//
            try {
                File file = new File(fupload + "/" + newFile);
                //logger.info(fupload+"\\"+newFile);
                FileUtils.writeByteArrayToFile(file, fileload.getBytes());
                shBoardService.writeBoard(board);

                logger.info("Welcome boardwriteAf success! ");
            } catch (IOException e) {
                logger.info("Welcome boardwriteAf fail! ");
            }
        }

        return "redirect:/boardlist.do";
    }//

    @RequestMapping(value = "boardupdateAf.do",
            method = RequestMethod.POST)
    public String boardupdateAf(SHBoard board, String namefile,
                                HttpServletRequest request,
                                @RequestParam(value = "fileload", required = false) MultipartFile fileload,
                                Model model) throws Exception {
        board.setFilename(fileload.getOriginalFilename());
        logger.info("Welcome BoardController boardupdateAf! " + new Date());

        if ((namefile != null && !namefile.equals(""))) {

            String fupload = "/usr/local/upload";

            String f = board.getFilename();
            String newFile = FUpUtil.getNewFile(f);
            board.setFilename(newFile);
            try {
                File file = new File(fupload + "/" + newFile);
                FileUtils.writeByteArrayToFile(file, fileload.getBytes());
            } catch (IOException e) {
            }
        } else {
            if ((namefile != null && !namefile.equals(""))) {
                board.setFilename(namefile);
            } else {
                board.setFilename("");

            }
        }
        shBoardService.updateBoard(board);

        return "redirect:/boardlist.do";
    }//

    @RequestMapping(value = "boarddel.do",
            method = RequestMethod.POST)
    public String boarddelete(SHBoard board, Model model) throws Exception {
        logger.info("Welcome BoardController boarddelete! " + new Date());
        shBoardService.boarddelete(board);
        return "redirect:/boardlist.do";
    }//

    @RequestMapping(value = "boardlist.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String boardlist(BoardParam param, Model model) throws Exception {
        logger.info("Welcome BoardController boardlist! " + new Date());

        int sn = param.getPageNumber();
        int start = (sn) * param.getRecordCountPerPage() + 1;
        int end = (sn + 1) * param.getRecordCountPerPage();

        param.setStart(start);
        param.setEnd(end);
        int totalRecordCount =
                shBoardService.getBoardTotalCount(param);
        List<SHBoard> boardlist =
                shBoardService.getBoardPageList(param);
        model.addAttribute("boardlist", boardlist);

        model.addAttribute("pageNumber", sn);
        model.addAttribute("pageCountPerScreen", 10);
        model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
        model.addAttribute("totalRecordCount", totalRecordCount);

        model.addAttribute("s_category", param.getS_category());
        model.addAttribute("s_keyword", param.getS_keyword());

        model.addAttribute("entcheck", 0);

        return "boardlist.tiles";
    }//


    /*내 글 리스트 */
    @RequestMapping(value = "myBoardList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SHBoard> myBoardList(SHUser shUser, HttpServletRequest request, Model model) throws Exception {
        logger.info("Board myBoardList--!");


        return shBoardService.getMyBoardlist(shUser);
    }
}