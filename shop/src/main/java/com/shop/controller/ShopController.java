package com.shop.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.MemberVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;
import com.shop.service.AdminService;
import com.shop.service.ShopService;

@Controller
@RequestMapping("/market/*")
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Inject
	ShopService service;
	
	@Inject
	AdminService adminService;
	
	// 카테고리별 상품 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,
						@RequestParam("l") int level, Model model) throws Exception {
		logger.info("get shop list");
		
		List<GoodsViewVO> list = null;
		list = service.list(cateCode, level);
		
		model.addAttribute("list", list);
		model.addAttribute("level", level);
	}
	
	// 상품 조회(goodsView)
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int goodsNum, Model model) throws Exception {
		logger.info("get view");
		
		// 상품 조회
		GoodsViewVO view = service.goodsView(goodsNum);
		model.addAttribute("view", view);

//		// 상품 소감 리스트
//		List<ReplyListVO> reply = service.replyList(goodsNum);
//		model.addAttribute("reply", reply);
	
	}
	
	/*
	// 상품 조회 - 소감 작성(registReply)
	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String registReply(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("regist reply");
		
		// 댓글 작성자를 세팅하기 위해, 세션에 있는 로그인 정보를 불러와 저장
		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setUserId(member.getUserId());
		
		service.registReply(reply);
		
		return "redirect:/market/view?n=" + reply.getGoodsNum();
		
	}
	*/
	// 상품 소감(댓글) 작성(registReply)
	@ResponseBody
	@RequestMapping(value= "/view/registReply", method = RequestMethod.POST)
	public void registReply(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("regist reply");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setUserId(member.getUserId());
		
		service.registReply(reply);
	}
	
	// 상품 소감 리스트(replyList)
	@ResponseBody
	@RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(@RequestParam("n") int goodsNum) throws Exception {
		logger.info("get reply list");
		
		List<ReplyListVO> reply = service.replyList(goodsNum);
		
		return reply;
	}
	
	// 상품 소감(댓글) 삭제(deleteReply)
	@ResponseBody
	@RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("post delete reply");
		
		int result = 0;
		
		// 세션에 있는 사용자 정보를 불러옴
		MemberVO member = (MemberVO) session.getAttribute("member");
		// 해당 댓글 작성자의 아이디를 변수에 저장
		String userId = service.idCheck(reply.getReplyNum());
		
		// 세션 사용자 아이디와 댓글 작성자 아이디가 일치한다면
		if(member.getUserId().equals(userId)) {
			// 댓글 작성자를 세팅하고
			reply.setUserId(member.getUserId());
			// 댓글 삭제를 실행
			service.deleteReply(reply);
			
			result = 1;
		}
		
		return result;
		
	}
	
	// 상품 소감(댓글) 수정(modifyReply)
	@ResponseBody
	@RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("modify reply");
		
		int result = 0;
		
		// 세션에 있는 사용자 정보를 불러옴
		MemberVO member = (MemberVO) session.getAttribute("member");
		// 해당 댓글 작성자의 아이디를 변수에 저장
		String userId = service.idCheck(reply.getReplyNum());
		
		// 세션 사용자 아이디와 댓글 작성자 아이디가 일치한다면
		if(member.getUserId().equals(userId)) {
			// 댓글 작성자를 세팅하고
			reply.setUserId(member.getUserId());
			// 댓글 수정을 실행
			service.modifyReply(reply);
			
			result = 1;
		}
		
		return result;
	}
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {
		logger.info("add Cart");
		
		int result = 0;
		
		// 세션에 있는 사용자 정보를 불러옴
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member != null) {
			// 해당 아이디를 cart에 세팅
			cart.setUserId(member.getUserId());
			service.addCart(cart);
			
			result = 1;
		}
		
		return result;
	}
	
	// 카트 리스트
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
		logger.info("get cart list");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		List<CartListVO> cartList = service.cartList(userId);
		
		model.addAttribute("cartList", cartList);
	}
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(@RequestParam(value = "checkArr[]") List<String> checkArr,
							HttpSession session,  CartVO cart) throws Exception {
		logger.info("delete cart");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		int result = 0;
		int cartNum = 0;
		
		if(member != null) {
			cart.setUserId(userId);
			// 리스트에 담긴 카트번호를 반복시켜 int로 변환 후 삭제
			for(String i : checkArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			
			result = 1;
		}
		
		return result;
	}
	
	// 주문 + 재고 변경
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail,
						@RequestParam(value = "chk[]") List<String> ckArr) throws Exception {
		logger.info("order");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		// 달력 메서드(Calendar)로 연/월/일 추출
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		// 6자리 랜덤 숫자 생성
		for(int i=0; i<=6; i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		// 날짜_랜덤숫자 로 이루어진, 최대한 중복되지 않는 고유한 문자열 생성
		String orderId = ymd + "_" + subNum; // ex) 20210119_542316
		
		// 주문 정보
		order.setOrderId(orderId);
		order.setUserId(userId);
		service.orderInfo(order);
		
		int cartNum = 0;
		HashMap<String, Object> map;
		CartVO cart;
		
		for(String i: ckArr) {
			// - 해당 카트 주문하기
			cartNum = Integer.parseInt(i);
			map = new HashMap<String, Object>();
			
			map.put("orderId", orderId);
			map.put("userId", userId);
			map.put("cartNum", cartNum);
			
			service.orderInfoDetails(map);
			
			// - 주문 하고 난 뒤 해당 카트 삭제하기
			cart = new CartVO();
			cart.setUserId(userId);
			cart.setCartNum(cartNum);
			
			service.deleteCart(cart);
		}
		
		// - 주문한 상품 재고 빼기
		// orderId와 일치하는 정보를 저장하고
		List<OrderListVO> orderView = adminService.orderView(order);
		GoodsVO goods = new GoodsVO();
		// 하나 씩 반복해서, 값을 세팅한 다음 해당하는 제품의 재고를 뺌
		for(OrderListVO i : orderView) {
			goods.setGoodsNum(i.getGoodsNum());
			goods.setGoodsStock(i.getCartStock());
			adminService.changeStock(goods);
		}
		
		return "redirect:/market/orderList";
	}
	
	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception{
		logger.info("get order list");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		
		List<OrderVO> orderList = service.orderList(order);
		
		model.addAttribute("orderList", orderList);
	}
	
	// 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderView(@RequestParam("n") String orderId,
							HttpSession session, OrderVO order, Model model) throws Exception {
		logger.info("get order view");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
	// 주문 취소
	@RequestMapping(value = "/orderCancel", method = RequestMethod.POST)
	public String orderCancel(@RequestParam("orderId") String orderId) throws Exception {
		logger.info("orderCancel");
		
		// orderId만 변수에 저장
		//String orderId = orderView.getOrderId();
		// 굳이 OrderVO로 받아서 할 필요가 있나 싶어서, @RequestParam으로 받음
		
		// 1. orderId를 넣어 [주문 취소] 실행
		// -> where orderId = orderId, delivery = '주문 완료' 일 때에만 [주문 취소] 실행
		service.orderCancel(orderId);
		
		// 2. 해당 주문상세 페이지로 이동
		return "redirect:/market/orderView?n=" + orderId;
	}
	
	// 주문 수정
	@RequestMapping(value = "/orderEdit", method = RequestMethod.POST)
	public String orderEdit(OrderVO order) throws Exception {
		logger.info("orderEdit");
		
		service.orderEdit(order);
		
		return "redirect:/market/orderView?n=" + order.getOrderId();
	}
 }
