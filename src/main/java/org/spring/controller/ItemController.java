package org.spring.controller;


import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.dao.ItemDAO;
import org.spring.dto.ItemDTO;
import org.spring.dto.PageDTO;
import org.spring.dto.SearchDTO;
import org.spring.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/Item")
public class ItemController {
	private static final Logger logger =LoggerFactory.getLogger(ItemController.class);
	@Resource
	private FileService service;
	
	@Resource
	private ItemDAO dao;
	
	@Resource
	private ItemDTO dto;
	
	
	@RequestMapping("/selectall")
	public String memberList(PageDTO pdto,HttpSession session,Model model) {
		String findkey = pdto.getFindKey();
		String findvalue = pdto.getFindValue();
		if(findvalue !="" &&findvalue !=null && session.getAttribute("findkey") =="") {
			dao.searchcount(findvalue);
		}
		else if(findkey ==null) {
			findkey =(String) session.getAttribute("findkey");
			if(findkey ==null) findkey="";
		}
		else {
			session.setAttribute("findkey", findkey );
			session.setMaxInactiveInterval(60*60*4);
		}
		if(findvalue==null) findvalue="";
		
		int curPage= pdto.getCurPage();
		if(curPage == 0) curPage = 1;
		
		pdto.setFindKey(findkey);
		pdto.setFindValue(findvalue);
		pdto.setPerPage(12);
		pdto.setCurPage(curPage);
		//�쟾泥� �럹�씠吏� �닔 援ы븯湲�
		int totCnt = dao.totcount(pdto);
		int perPage = pdto.getPerPage();
		int totPage;
		if (totCnt % perPage == 0) {
			totPage = totCnt / perPage; 
		}else {
			totPage = totCnt / perPage + 1; 
		}
		pdto.setTotPage(totPage);
		//�떆�옉踰덊샇
		int startNo = (pdto.getCurPage()-1) * perPage + 1;
		pdto.setStartNo(startNo-1);
		//�걹踰덊샇
		int endNo = startNo + perPage -1 ;
		pdto.setEndNo(endNo);
		int startPage =pdto.getCurPage()-((pdto.getCurPage()-1)%5);
		pdto.setStartPage(startPage);
		int endPage = startPage + pdto.getPerBlock()-1;
		
		if(endPage <= pdto.getTotPage()) pdto.setEndPage(endPage);
		else pdto.setEndPage(pdto.getTotPage());
		
		
		List<ItemDTO> list = new ArrayList<>();
		list = dao.selectall(pdto);
		model.addAttribute("list",list);
		model.addAttribute("pdto",pdto);
		
		return "view/main";
	}
	@RequestMapping("/selectallup")
	public String memberList2(PageDTO pdto,HttpSession session,Model model) {
		String findkey = pdto.getFindKey();
		String findvalue= pdto.getFindValue();
		
		System.out.println("findKey  :"+findkey);
		System.out.println("findvalue :"+findvalue);
		if(findvalue !="" &&findvalue !=null && session.getAttribute("findkey") =="") {
			dao.searchcount(findvalue);
		}
		if(findkey ==null) {
			findkey =(String) session.getAttribute("findkey");
			if(findkey ==null) findkey="";
		}
		else {
			session.setAttribute("findkey", findkey );
			session.setMaxInactiveInterval(60*60*4); //�꽭�뀡�쑀�슚�떆媛� 4�떆媛�
		}
		System.out.println("find key : "+findkey);
		if(findvalue==null) findvalue="";
		
		///////////////////////////////////////////////////////////////
		
		int curPage= pdto.getCurPage();
		if(curPage == 0) curPage = 1;
		
		pdto.setFindKey(findkey);
		pdto.setFindValue(findvalue);
		pdto.setPerPage(12);
		pdto.setCurPage(curPage);
		//�쟾泥� �럹�씠吏� �닔 援ы븯湲�
		int totCnt = dao.totcount(pdto);
		int perPage = pdto.getPerPage();
		int totPage;
		if (totCnt % perPage == 0) {
			totPage = totCnt / perPage; 
		}else {
			totPage = totCnt / perPage + 1; 
		}
		pdto.setTotPage(totPage);
		//�떆�옉踰덊샇
		int startNo = (pdto.getCurPage()-1) * perPage + 1;
		pdto.setStartNo(startNo-1);
		//�걹踰덊샇
		int endNo = startNo + perPage -1 ;
		pdto.setEndNo(endNo);
		
		int startPage =pdto.getCurPage()-((pdto.getCurPage()-1)%5);
		pdto.setStartPage(startPage);
		int endPage = startPage + pdto.getPerBlock()-1;
		
		if(endPage <= pdto.getTotPage()) pdto.setEndPage(endPage);
		else pdto.setEndPage(pdto.getTotPage());
		
		
		System.out.println(pdto);
		//////////////////////////////////////////////
		
		List<ItemDTO> list = new ArrayList<>();
		
		System.out.println(findkey);
		System.out.println(findvalue);
		list = dao.selectall(pdto);
		
		System.out.println(list);
		model.addAttribute("list",list);
		model.addAttribute("pdto",pdto);
		
		
		return "admin_view/itemupdate";
	}
	@RequestMapping("search")
	public String Search(Model model) {
		List<SearchDTO> list =dao.searchselect();
		model.addAttribute("list",list);
		System.out.println(list);
		return"admin_view/search";
	}
	@RequestMapping(value = "iteminsert",method = RequestMethod.GET)
	public String iteminsert() {
		return "admin_view/iteminsert";
	}
	@RequestMapping(value ="iteminsert",method = RequestMethod.POST)
	public String iteminsert(ItemDTO dto,MultipartFile file) {
		dto.setItemimage(file.getOriginalFilename());
		System.out.println(dto.toString());
		service.fileupload(file);
		
		dao.insert(dto);
		return "redirect:selectall";
	}
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String itemupdate(ItemDTO dto,MultipartFile file,Model model) {
		
		System.out.println("file : "+file.getOriginalFilename());
		if(file.getOriginalFilename() != "") {
			service.fileupload(file);
			service.filedelete(dao.selectone(dto.getSeq()).getItemimage());
			dto.setItemimage(file.getOriginalFilename());
		}else {
			dto.setItemimage(dao.selectone(dto.getSeq()).getItemimage());
		}
		dao.update(dto);
		
		return "redirect:selectallup";
	}
	@RequestMapping("/selectone")
	public String selectone(int seq,Model model) {
		dto = dao.selectone(seq);
		model.addAttribute("dto",dto);
		return "admin_view/selectone";
	}
	@RequestMapping("/delete")
	public String delete(int seq) {
		System.out.println("seq : " + seq);
		service.filedelete(dao.selectone(seq).getItemimage());
		dao.delete(seq);
		return "redirect:selectallup";
	}
}
