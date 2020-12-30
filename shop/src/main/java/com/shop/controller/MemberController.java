package com.shop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.domain.MemberVO;
import com.shop.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// 회원가입 GET
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		logger.info("get signup");
	}
	
	// 회원가입 POST
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
		logger.info("post signup");
		
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		
		service.signup(vo);
		
		return "redirect:/";
	}
	
	// 로그인 GET
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
		logger.info("get signin");
	}
	
	// 로그인 POST
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post signin");
		
		MemberVO login = service.signin(vo);
		HttpSession session = req.getSession();
		boolean passMatch = false;
		
		// null 체크 안하고 matches하면 Exception 발생 (주의하자.)
		if(login != null) {
			// 입력된 비밀번호와 DB에 있는 비밀번호 비교
			passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		}
		
		if(passMatch) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			
			return "redirect:/member/signin";
		}
		
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("get logout");
		
		service.signout(session);
		
		return "redirect:/";
	}
}
