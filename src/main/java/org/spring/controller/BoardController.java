package org.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.spring.dao.BoardDAO;
import org.spring.dto.BoardDTO;
import org.spring.dto.PageDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

@Controller
@RequestMapping("/Board")
public class BoardController{
	
	
	@Resource
	private BoardDTO dto;
	@Resource
	private BoardDAO dao;
	@Resource
	private PageDTO pdto;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "board/board_insert";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(String subject,String content,HttpSession session,Model model) {
		dto.setUserid((String)session.getAttribute("loginCheck"));
		dto.setSubject(subject);
		dto.setContent(content);
		System.out.println(dto.toString());
		dao.insert(dto);
		return "redirect:selectall";
	}
	@RequestMapping("/selectall")
	public String selectall(HttpSession session,PageDTO pdto,Model model) {
		
		
		if(pdto.getCurPage()==0) pdto.setCurPage(1);
		if(pdto.getFindKey()==null) pdto.setFindKey("subject");
		if(pdto.getFindValue()==null) pdto.setFindValue("");;
		String userid = (String)session.getAttribute("loginCheck");
		
		//전체 페이지 수 구하기
		int totCnt = dao.totCount(pdto);
		int perPage = pdto.getPerPage();
		int totPage;
		if (totCnt % perPage == 0) {
			totPage = totCnt / perPage; 
		}else {
			totPage = totCnt / perPage + 1; 
		}
		pdto.setTotPage(totPage);
		//시작번호
		int startNo = (pdto.getCurPage()-1) * perPage + 1;
		pdto.setStartNo(startNo-1);
		//끝번호
		int endNo = startNo + perPage -1 ;
		pdto.setEndNo(endNo);
		
		int startPage =pdto.getCurPage()-((pdto.getCurPage()-1)%5);
		pdto.setStartPage(startPage);
		int endPage = startPage + pdto.getPerBlock()-1;
		
		if(endPage <= pdto.getTotPage()) pdto.setEndPage(endPage);
		else pdto.setEndPage(pdto.getTotPage());
		
		
		List<BoardDTO> list = dao.selectall(pdto);
		model.addAttribute("pdto",pdto);
		model.addAttribute("list",list);
		
		System.out.println(pdto.toString());
		System.out.println(list);
		
		return "/board/board_main";
	}
	@RequestMapping("/selectallmy")
	public String selectallmy(HttpSession session,PageDTO pdto,Model model) {
		
		
		if(pdto.getCurPage()==0) pdto.setCurPage(1);
		if(pdto.getFindValue()==null) pdto.setFindValue("");;
		
		String userid = (String)session.getAttribute("loginCheck");
		pdto.setFindKey("userid");
		pdto.setFindValue(userid);
		
		//전체 페이지 수 구하기
		int totCnt = dao.totCount(pdto);
		int perPage = pdto.getPerPage();
		int totPage;
		if (totCnt % perPage == 0) {
			totPage = totCnt / perPage; 
		}else {
			totPage = totCnt / perPage + 1; 
		}
		pdto.setTotPage(totPage);
		//시작번호
		int startNo = (pdto.getCurPage()-1) * perPage + 1;
		pdto.setStartNo(startNo-1);
		//끝번호
		int endNo = startNo + perPage -1 ;
		pdto.setEndNo(endNo);
		
		int startPage =pdto.getCurPage()-((pdto.getCurPage()-1)%5);
		pdto.setStartPage(startPage);
		int endPage = startPage + pdto.getPerBlock()-1;
		
		if(endPage <= pdto.getTotPage()) pdto.setEndPage(endPage);
		else pdto.setEndPage(pdto.getTotPage());
		
		List<BoardDTO> list = new ArrayList<>();
		list = dao.selectall(pdto);
		
		model.addAttribute("pdto",pdto);
		model.addAttribute("list",list);
		
		System.out.println(list);
		System.out.println(pdto);
		
		return "/board/board_selectallmy";
	}
	@RequestMapping("/selectallread")
	public String selectallread(HttpSession session,PageDTO pdto,Model model) {
		
		System.out.println("findkey: "+pdto.getFindKey());
		System.out.println("findvalue: "+pdto.getFindValue());
		
		if(pdto.getCurPage()==0) pdto.setCurPage(1);
		if(pdto.getFindValue()==null) pdto.setFindValue("");;
		
		String userid = (String)session.getAttribute("loginCheck");
		pdto.setFindKey("userid");
		pdto.setFindValue(userid);
		
		System.out.println("userid :" + userid);
		System.out.println("curPage :"+pdto.getCurPage());
		System.out.println("findkey : "+ pdto.getFindKey());
		System.out.println("findValue  : "+ pdto.getFindValue());
		
		System.out.println(pdto.toString());
		
		//전체 페이지 수 구하기
		int totCnt = dao.totCount(pdto);
		int perPage = pdto.getPerPage();
		int totPage;
		if (totCnt % perPage == 0) {
			totPage = totCnt / perPage; 
		}else {
			totPage = totCnt / perPage + 1; 
		}
		pdto.setTotPage(totPage);
		//시작번호
		int startNo = (pdto.getCurPage()-1) * perPage + 1;
		pdto.setStartNo(startNo-1);
		//끝번호
		int endNo = startNo + perPage -1 ;
		pdto.setEndNo(endNo);
		
		int startPage =pdto.getCurPage()-((pdto.getCurPage()-1)%5);
		pdto.setStartPage(startPage);
		int endPage = startPage + pdto.getPerBlock()-1;
		
		if(endPage <= pdto.getTotPage()) pdto.setEndPage(endPage);
		else pdto.setEndPage(pdto.getTotPage());
		
		
		System.out.println(pdto);
		List<BoardDTO> list = new ArrayList<>();
		list = dao.selectallread(pdto);
		
		model.addAttribute("pdto",pdto);
		model.addAttribute("list",list);
		
		System.out.println(list);
		System.out.println(list.size());
		
		return "/board/board_readmain";
	}
	
	@RequestMapping("/delete")
	public String delete(int num) {
		dao.delete(num);
		return "redirect:selectall";
	}
	@RequestMapping("/replydelete")
	public String replydelete(int num) {
		dao.replydelete(num);
		return "redirect:selectall";
	}
	@RequestMapping("/selectone")
	public String selectone(int num,Model model) {
		dto = dao.selectone(num);
		BoardDTO redto = dao.selectonereply(num);
		model.addAttribute("dto",dto);
		model.addAttribute("redto",redto);
		
		return "/board/board_selectone";
	}
	@RequestMapping("replyinsert")
	public String replyinsert(String content,String subject,int num,HttpSession session) {
		String userid =(String)session.getAttribute("loginCheck");
		dto.setContent(content);
		dto.setSubject(subject);
		dto.setUserid(userid);
		dto.setRef(num);
		dao.replyinsert(dto);
		
		return "redirect:selectall";
	}
}
