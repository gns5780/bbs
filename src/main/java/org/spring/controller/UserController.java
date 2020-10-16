package org.spring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.spring.dao.UserDAO;
import org.spring.dto.UserDTO;
import org.spring.service.MailService;
import org.spring.service.SecurityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/User",produces = "application/text; charset=utf-8")
public class UserController {
	
	@Resource
	private SecurityService securityservice;
	@Resource
	private MailService mailservice;
	
	@Resource
	private UserDAO dao;
	
	
	@Resource
	private UserDTO dto;
	
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login() {
		return "view/login";
	}
	@RequestMapping(value = "/login",method = RequestMethod.POST,produces = "application/text; charset=utf-8")
	public String login(@RequestParam("id")String id,@RequestParam("pw") String pw,HttpSession session,RedirectAttributes rattb) {
		if(securityservice.pwcheck(pw,dao.selectpw(id))) {
			session.setAttribute("loginCheck",id);
			session.setMaxInactiveInterval(60*60*4);
			return "redirect:/Item/selectall";
		}else {
			rattb.addFlashAttribute("msg","아이디와 비밀번호를 확인해주세요!");
			return "redirect:/User/login";
		}
	}
	@RequestMapping(value = "/selectid",produces = "application/text; charset=utf-8")
	public String selectid(@RequestParam("phonenum") String phonenum,Model model) {
		List<String> list = dao.selectid(phonenum);
		model.addAttribute("list",list);
		String msgg ="";
		if(list.size()==0) msgg="계정이 없습니다.";
		else msgg="휴대폰 번호로 조회한 계정 목록입니다.<br>\n";
		model.addAttribute("msgg",msgg);
		
		return "view/login";
	}
	@RequestMapping(value = "/selectpw",produces = "application/text; charset=utf-8")
	public String selectpw(String id,String phonenum,Model model) {
		Random random = new Random();
		
		//임시 비밀번호 생성
		String pw ="";
		for(int i=0;i<4;i++) {
			pw += String.valueOf((char) ((int) (random.nextInt(26)) + 97));
			pw += String.valueOf((char) ((int) (random.nextInt(26)) + 65));
			pw += String.valueOf(random.nextInt(10));
		}
		dto = dao.selectmy(id);
		if(dto.getPhonenum().equals(phonenum)) {
			try {
				mailservice.pwfind(dto.getEmail(),pw);
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dto.setPw(securityservice.trans(pw));
			dao.updatemy(dto);
			model.addAttribute("msg","메일로 임시 비밀번호를 전송했습니다.");
			return "view/login";
		}
		else {
			model.addAttribute("msg","정보가 일치하지않습니다.");
			return "view/login";
		}
	}
	
	@RequestMapping(value = "/logout",produces = "application/text; charset=utf-8")
	public String logout(HttpSession session) {
		session.setAttribute("loginCheck",null);
		return "redirect:/Item/selectall";
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET,produces = "application/text; charset=utf-8")
	public String join() {
		return "view/join";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST,produces = "application/text; charset=utf-8")
	public String join(UserDTO dto,Model model) {
		dto.setPw(securityservice.trans(dto.getPw()));
		dto.setRepw(securityservice.trans(dto.getRepw()));
		dao.insert(dto);
		return "view/login";
	}
	@RequestMapping(value = "/idcheck",produces = "application/text; charset=utf-8")
	public String idcheck(UserDTO dto,String answer2,Model model) {
		
		model.addAttribute("answer",dao.selectone(dto.getId()));
		model.addAttribute("dto",dto);
		if(dao.selectone(dto.getId()) == 1) model.addAttribute("msg","중복된 아이디입니다.");
		else model.addAttribute("msg","사용가능합니다!");
		
		model.addAttribute("answer2",answer2);
		return "view/join";
	}
	@RequestMapping(value = "/mailcheck",produces = "application/text; charset=utf-8")
	public String mailcheck(UserDTO dto,String answer,Model model) {
		
		
		Random random = new Random();
		//임시 키
		String keynum ="";
		for(int i=0;i<6;i++) {
			keynum += String.valueOf(random.nextInt(10));
		}
		System.out.println("mailcheck :"+dto.toString());
		try {
			mailservice.emailCheck(dto.getEmail(),keynum);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(answer=="") answer = "1";
		System.out.println("answer :"+answer);
		model.addAttribute("answer",answer);
		model.addAttribute("answer2",keynum);
		model.addAttribute("dto",dto);
		model.addAttribute("msg","메일로 인증번호를 전송했습니다.");
		
		return "view/join";
		
	}
	@RequestMapping(value = "/selectmy",produces = "application/text; charset=utf-8")
	public String selectmy(HttpSession session,Model model) {
		String id =(String)session.getAttribute("loginCheck");
		dto = dao.selectmy(id);
		model.addAttribute("dto",dto);
		return "view/myselect";
	}
	@RequestMapping(value = "/deletemy",produces = "application/text; charset=utf-8")
	public String deletemy(String pw,HttpSession session,Model model,RedirectAttributes rdab) {
		String id = (String)session.getAttribute("loginCheck");
		System.out.println(id);
		System.out.println(securityservice.pwcheck(pw,dao.selectpw(id)));
		
		if(securityservice.pwcheck(pw,dao.selectpw(id))) {
			session.setAttribute("loginCheck",null);
			dao.deletemy(id);
			
			rdab.addFlashAttribute("msg","삭제되었습니다.");
			return "redirect:/Item/selectall";
		}else {
			rdab.addFlashAttribute("msg","비밀번호가 다릅니다.");
			return "redirect:selectmy";
		}
	}
	@RequestMapping(value = "/updatemy",method = RequestMethod.GET,produces = "application/text; charset=utf-8")
	public String updatemy(HttpSession session,Model model) {
		dto = dao.selectmy((String)session.getAttribute("loginCheck"));
		model.addAttribute("dto",dto);
		return "view/myupdate";
	}
	@RequestMapping(value = "/updatemy",method = RequestMethod.POST,produces = "application/text; charset=utf-8")
	public String updatemy(@RequestParam("lodpw")String pw,UserDTO dto,Model model,RedirectAttributes rdab) {
		if(securityservice.pwcheck(pw,dao.selectpw(dto.getId()))) {
			dto.setPw(securityservice.trans(dto.getPw()));
			dao.updatemy(dto);
			//rdab.addFlashAttribute("msg","수정되었습니다.");
			rdab.addFlashAttribute("msg",dto.getAddress());
			return "redirect:/Item/selectall";
		}
		else {
			rdab.addFlashAttribute("msg","수정에 실패하였습니다.");
			return "redirect:/Item/selectall";
		}

	}
	
	@RequestMapping(value = "/selectall",produces = "application/text; charset=utf-8")
	public String selectall(Model model) {
		List<UserDTO> list = new ArrayList<>();
		list = dao.selectall();
		model.addAttribute("list",list);
		return "admin_view/userselectall";
	}
}