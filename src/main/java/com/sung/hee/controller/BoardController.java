package com.sung.hee.controller;

import com.sung.hee.help.BoardParam;
import com.sung.hee.pds.help.FUpUtil;
import com.sung.hee.shboard.dao.SHBoardService;
import com.sung.hee.shboard.model.SHBoard;
import com.sung.hee.user.model.SHUser;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class BoardController {

    private static final Logger logger =
            LoggerFactory.getLogger(BoardController.class);

    @Autowired
    private SHBoardService shBoardService;


    @RequestMapping(value = "boarddetail.do", method = RequestMethod.GET)
    public String boarddetail(HttpServletRequest request, SHBoard shBoard, Model model) throws Exception {
        logger.info("Welcome BoardController boarddetail!");
        SHBoard myBoard = shBoardService.getBoard(shBoard);
        SHUser user = (SHUser) request.getSession().getAttribute("login");

        if (myBoard.getHidden() == 1)
            if (!(user.getAuth() == 1) && !(myBoard.getId().equals(user.getId()))) {

                return "redirect:/boardlist.do";
            }

        model.addAttribute("head", myBoard.getTitle());
        model.addAttribute("board", myBoard);
        return "boarddetail.tiles";
    }

    @RequestMapping(value = "boardreply.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String boardreply(SHBoard shboard, Model model) {
        logger.info("Welcome BoardController boardreply! " + new Date());
        model.addAttribute("doc_title", "Board 답글달기");
        model.addAttribute("board",
                shBoardService.getBoard(shboard));
        return "boardreply.tiles";
    }//


    @RequestMapping(value = "boardupdate.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String boardupdate(SHBoard shboard, HttpServletRequest request, Model model) {
        logger.info("Welcome BoardController boardupdate! " + new Date());

        SHUser user = (SHUser) request.getSession().getAttribute("login");
        if (user.getAuth() == 3) {
            return "redirect:/boardlist.do";

        } else {
            model.addAttribute("board",
                    shBoardService.getBoard(shboard));

            return "boardupdate.tiles";
        }
    }//


    @RequestMapping(value = "boardreplyAf.do",
            method = {RequestMethod.GET, RequestMethod.POST})
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

            String fupload = "c:\\upload";
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
        String fupload = "c:\\upload";
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

            String fupload = "c:\\upload";
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

            String fupload = "c:\\upload";
            String f = board.getFilename();
            String newFile = FUpUtil.getNewFile(f);
            board.setFilename(newFile);
            try {
                File file = new File(fupload + "/" + newFile);
                //logger.info(fupload+"\\"+newFile);
                FileUtils.writeByteArrayToFile(file, fileload.getBytes());
            } catch (IOException e) {
                logger.info("Welcome boardupdateAf if fail! =========================");
            }
        } else {
            if ((namefile != null && !namefile.equals(""))) {
                board.setFilename(namefile);
                //logger.info("Welcome pdsupdateAf else success! =======================");
            } else {
                board.setFilename("");

                logger.info("Welcome boardupdateAf no update ! =======================");
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
        logger.info("Welcome BoardController param! " + param);
        int totalRecordCount =
                shBoardService.getBoardTotalCount(param);
        logger.info("Welcome BoardController totalRecordCount! " + totalRecordCount);
        List<SHBoard> boardlist =
                shBoardService.getBoardPageList(param);
        logger.info("Welcome BoardController boardlist! " + boardlist.size());
        model.addAttribute("doc_title", "Board 글목록");
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

    /*
    *
    *
    * EBoard
    *
    *
    * */
    @RequestMapping(value = "eboarddetail.do", method = RequestMethod.GET)
    public String eboarddetail(HttpServletRequest request, SHBoard shBoard, Model model) throws Exception {
        logger.info("Welcome eboarddetail boarddetail!");
        SHBoard myBoard = shBoardService.getBoard(shBoard);
        SHUser user = (SHUser) request.getSession().getAttribute("login");

        if (myBoard.getHidden() == 1)
            if (!(user.getAuth() == 1) && !(myBoard.getId().equals(user.getId()))) {

                return "redirect:/eboardlist.do";
            }

        if (myBoard.getEnt() == 0) {


        } else {
            if (user.getIsent() == 0 || user.getEnt() != myBoard.getEnt()) {

                return "redirect:/eboardlist.do";
            }

        }
        model.addAttribute("head", myBoard.getTitle());
        model.addAttribute("board", myBoard);
        return "eboarddetail.tiles";
    }

    @RequestMapping(value = "eboardreply.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String eboardreply(SHBoard shboard, HttpServletRequest http, Model model) {
        logger.info("Welcome EBoardController boardreply! " + new Date());


        model.addAttribute("doc_title", "Board 답글달기");
        model.addAttribute("board",
                shBoardService.getBoard(shboard));

        return "eboardreply.tiles";
    }//


    @RequestMapping(value = "eboardupdate.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String eboardupdate(SHBoard shboard, Model model) {
        logger.info("Welcome BoardController eboardupdate! " + new Date());
        logger.info("Welcome BoardController SHBoard! " + shboard);
        model.addAttribute("doc_title", "Board 수정하기");
        model.addAttribute("board",
                shBoardService.getBoard(shboard));

        return "eboardupdate.tiles";
    }//


    @RequestMapping(value = "eboardreplyAf.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String eboardreplyAf(SHBoard shboard, HttpServletRequest request,
                                @RequestParam(value = "fileload", required = false) MultipartFile fileload,
                                Model model) {
        logger.info("Welcome eBoardController eboardreplyAf! " + shboard);
        boolean isS = false;

        if (fileload.getOriginalFilename() == null || fileload.getOriginalFilename().equals("")) {

            try {
                shBoardService.reply(shboard);
                isS = true;
            } catch (Exception e) {

            }
        } else {

            shboard.setFilename(fileload.getOriginalFilename());

            String fupload = "c:\\upload";
            logger.info(": " + fupload);
            String f = shboard.getFilename();
            String newFile = FUpUtil.getNewFile(f);
            shboard.setFilename(newFile);//
            try {
                File file = new File(fupload + "/" + newFile);
                //logger.info(fupload+"\\"+newFile);
                FileUtils.writeByteArrayToFile(file, fileload.getBytes());
                shBoardService.reply(shboard);


                logger.info("Welcome eboardwriteAf success! ");
            } catch (IOException e) {
                logger.info("Welcome eboardwriteAf fail! ");
            } catch (Exception e) {

            }
        }//
        return "redirect:/eboardlist.do";
    }


    @RequestMapping(value = "eboardwrite.do",
            method = RequestMethod.GET)
    public String eboardwrite(Model model) {
        logger.info("Welcome eBoardController boardwrite! " + new Date());
        model.addAttribute("doc_title", "Board 글쓰기");
        return "eboardwrite.tiles";
    }//

    @RequestMapping(value = "eboardwriteAf.do",
            method = RequestMethod.POST)
    public String eboardwriteAf(SHBoard board, HttpServletRequest request,
                                @RequestParam(value = "fileload", required = false) MultipartFile fileload,
                                Model model) throws Exception {
        logger.info("Welcome EBoardController eboardwriteAf! qeqe" + fileload.getOriginalFilename());
        if (fileload.getOriginalFilename() == null || fileload.getOriginalFilename().equals("")) {

            shBoardService.writeBoard(board);
        } else {

            board.setFilename(fileload.getOriginalFilename());

            String fupload = "c:\\upload";
            logger.info(": " + fupload);
            String f = board.getFilename();
            String newFile = FUpUtil.getNewFile(f);
            board.setFilename(newFile);//
            try {
                File file = new File(fupload + "/" + newFile);
                //logger.info(fupload+"\\"+newFile);
                FileUtils.writeByteArrayToFile(file, fileload.getBytes());
                shBoardService.writeBoard(board);

                logger.info("Welcome eboardwriteAf success! ");
            } catch (IOException e) {
                logger.info("Welcome eboardwriteAf fail! ");
            }
        }

        return "redirect:/eboardlist.do";
    }//

    @RequestMapping(value = "eboardupdateAf.do",
            method = RequestMethod.POST)
    public String eboardupdateAf(SHBoard board, String namefile,
                                 HttpServletRequest request,
                                 @RequestParam(value = "fileload", required = false) MultipartFile fileload,
                                 Model model) throws Exception {
        board.setFilename(fileload.getOriginalFilename());
        logger.info("Welcome BoardController eboardupdateAf! " + new Date());

        if ((namefile != null && !namefile.equals(""))) {

            String fupload = "c:\\upload";
            String f = board.getFilename();
            String newFile = FUpUtil.getNewFile(f);
            board.setFilename(newFile);
            try {
                File file = new File(fupload + "/" + newFile);
                //logger.info(fupload+"\\"+newFile);
                FileUtils.writeByteArrayToFile(file, fileload.getBytes());
            } catch (IOException e) {
                logger.info("Welcome eboardupdateAf if fail! =========================");
            }
        } else {
            if ((namefile != null && !namefile.equals(""))) {
                board.setFilename(namefile);
                //logger.info("Welcome pdsupdateAf else success! =======================");
            } else {
                board.setFilename("");

                logger.info("Welcome eboardupdateAf no update ! =======================");
            }
        }
        shBoardService.updateBoard(board);

        return "redirect:/eboardlist.do";
    }//

    @RequestMapping(value = "eboarddel.do",
            method = RequestMethod.POST)
    public String eboarddelete(SHBoard board, Model model) throws Exception {
        logger.info("Welcome BoardController boarddelete! " + new Date());
        shBoardService.boarddelete(board);
        return "redirect:/eboardlist.do";
    }//


    @RequestMapping(value = "eboardlist.do",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String entboard(BoardParam param, HttpServletRequest request, Model model) throws Exception {
        logger.info("Welcome BoardController entboard! ");
        SHUser user = (SHUser) request.getSession().getAttribute("login");
        param.setEnt(user.getEnt());
        int sn = param.getPageNumber();
        int start = (sn) * param.getRecordCountPerPage() + 1;
        int end = (sn + 1) * param.getRecordCountPerPage();

        param.setStart(start);
        param.setEnd(end);
        logger.info("Welcome eBoardController param! " + param);
        int totalRecordCount =
                shBoardService.getEntBoardTotalCount(param);
        logger.info("Welcome eBoardController totalRecordCount! " + totalRecordCount);
        List<SHBoard> boardlist =
                shBoardService.getEntBoardPageList(param);
        logger.info("Welcome eBoardController boardlist! " + boardlist.size());
        model.addAttribute("doc_title", "Board 글목록");
        model.addAttribute("boardlist", boardlist);

        model.addAttribute("pageNumber", sn);
        model.addAttribute("pageCountPerScreen", 10);
        model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
        model.addAttribute("totalRecordCount", totalRecordCount);

        model.addAttribute("s_category", param.getS_category());
        model.addAttribute("s_keyword", param.getS_keyword());
        model.addAttribute("entcheck", 1);
        return "eboardlist.tiles";
    }//
}