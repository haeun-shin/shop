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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String userId) throws Exception {
		logger.info("memberIdChk()");
		
		int result = service.idCheck(userId);
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
		
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
	
	// 회원정보 상세조회
	@RequestMapping(value = "/memberinfo", method = RequestMethod.GET)
	public void memberinfo(MemberVO vo, HttpSession session) throws Exception {
		logger.info("get member info");
		
		// 세션에 있는 member 정보를 불러와
		MemberVO member = (MemberVO) session.getAttribute("member");
		// userId를 넣어 쿼리 실행
		MemberVO memberInfo = service.viewMember(member.getUserId());
		
		session.setAttribute("memberInfo", memberInfo);
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/memberinfo", method = RequestMethod.POST)
	public String updateMember(MemberVO vo, HttpSession session,  RedirectAttributes rttr) throws Exception {
		logger.info("update Member");
		
		service.updateMember(vo);
		// url 뒤에 붙지 않으며, 리프레시할 경우 데이터가 소멸된다.
		rttr.addFlashAttribute("msg", "true");
		
		return "redirect:/member/memberinfo";
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/outMember", method = RequestMethod.POST)
	@ResponseBody
	public int outMember(MemberVO vo, HttpSession session) throws Exception {
		logger.info("out Member");
		
		// 암호화된 비밀번호를 변수에 저장
		String passCheck = service.passCheck(vo.getUserId());
		boolean passMatch = false;
		
		// null 체크 안하고 matches하면 Exception 발생 (주의하자.)
		if(passCheck != null) {
			// 입력된 비밀번호와 DB에 있는 비밀번호 비교
			passMatch = passEncoder.matches(vo.getUserPass(), passCheck);
		}
		
		if(passMatch) {
			// 비밀번호를 vo에 저장 (삭제할 때, 아이디/비밀번호 값을 넣기 때문)
			vo.setUserPass(passCheck);
			// 삭제 실행
			service.outMember(vo);
			// 로그아웃(세션 삭제)
			service.signout(session);
			
			return 1;
			
		} else {
			return 0;
		}
		
	}
	
}
