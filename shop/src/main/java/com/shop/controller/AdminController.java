package com.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReplyListVO;
import com.shop.service.AdminService;
import com.shop.utils.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 관리자화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index");
	}
	
	// 카테고리
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
		logger.info("get goods register");
		
		List<CategoryVO> category = null;
		category = adminService.category();
		
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {
		// 이미지를 업로드할 폴더
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		// 위의 폴더를 기준으로 연월일 폴더 생성
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		// 기본 경로와 별개로 작성되는 경로 + 파일 이름
		String fileName = null;
		
		// 파일 인풋박스에 첨부파일이 있다면(=첨부된 파일 이름이 있다면)
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			// goodsImg에 원본 파일 경로 + 파일명 저장
			vo.setGoodsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// goodsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setGoodsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			// 첨부된 파일이 없으면, 미리 준비된 none.jpg 파일을 대신 출력함
			fileName = File.separator + "images" + File.separator + "none.jpg";
			
			vo.setGoodsImg(fileName);
			vo.setGoodsThumbImg(fileName);
		}
		
		adminService.register(vo);
		
		return "redirect:/admin/goods/list";
	}
	
	// 상품 목록
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception {
		logger.info("get goods list");
		
		List<GoodsViewVO> list = adminService.goodsList();
		
		model.addAttribute("list", list);
	}
	
	// 상품 조회
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void getGoodsView(@RequestParam("n") int goodsNum, Model model) throws Exception {
		logger.info("get goods view");
		
		GoodsViewVO goods = adminService.goodsView(goodsNum);
		
		model.addAttribute("goods", goods);
	}
	
	// 상품 수정 GET (상품 수정 뷰)
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int goodsNum, Model model) throws Exception {
		logger.info("get goods modify");
		
		GoodsViewVO goods = adminService.goodsView(goodsNum);
		model.addAttribute("goods", goods);
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	// 상품 수정 POST (상품 수정 수행)
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo, @RequestParam("n") int goodsNum, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("post goods modify");

		 // 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("gdsImg")).delete();
		  new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  vo.setGoodsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  vo.setGoodsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
		  vo.setGoodsImg(req.getParameter("goodsImg"));
		  vo.setGoodsThumbImg(req.getParameter("goodsThumbImg"));
		  
		 }
		 
		 adminService.goodsModify(vo);
		
		return "redirect:/admin/goods/view?n=" + goodsNum;
	}
	
	// 상품 삭제
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int goodsNum) throws Exception {
		logger.info("post goods delete");
		
		adminService.goodsDelete(goodsNum);
		
		return "redirect:/admin/goods/list";
	}
	
	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req,
	          HttpServletResponse res,
	          @RequestParam MultipartFile upload) throws Exception {
	 logger.info("post CKEditor img upload");
	 
	 // 랜덤 문자 생성
	 UUID uid = UUID.randomUUID();
	 
	 OutputStream out = null;
	 PrintWriter printWriter = null;
	 JsonObject json = new JsonObject();
	   
	 // 인코딩
	 res.setCharacterEncoding("utf-8");
	 res.setContentType("text/html;charset=utf-8");
	 
	 try {
	  
	  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	  byte[] bytes = upload.getBytes();
	  
	  // 업로드 경로
	  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	  
	  out = new FileOutputStream(new File(ckUploadPath));
	  out.write(bytes);
	  out.flush();  // out에 저장된 데이터를 전송하고 초기화
	  
	  String callback = req.getParameter("CKEditorFuncNum");
	  printWriter = res.getWriter();
	  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
	  
	  // 업로드시 메시지 출력
//	  printWriter.println("<script type='text/javascript'>"
//	     + "window.parent.CKEDITOR.tools.callFunction("
//	     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
//	     +"</script>");
	  // 업데이트 되면서 Json 형태로 리턴하게끔 바뀜.
	  // {"upload" : 1, "fileName" : "test.jsp", "url" : /img/test.jsp"}
	  json.addProperty("uploaded", 1);
	  json.addProperty("fileName", fileName);
	  json.addProperty("url", fileUrl);
	  
	  printWriter.println(json);
	  
	  printWriter.flush();
	  System.out.println("test url : "+req.getSession().getServletContext().getRealPath("resouces/ckUpload"));
	  System.out.println("url : "+fileUrl);
	  System.out.println("ckUploadPath : "+ckUploadPath);
	  
	 } catch (IOException e) { e.printStackTrace();
	 } finally {
	  try {
	   if(out != null) { out.close(); }
	   if(printWriter != null) { printWriter.close(); }
	  } catch(IOException e) { e.printStackTrace(); }
	 }
	 
	 return; 
	}
	
	// 주문 목록
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		logger.info("get order list");
		
		List<OrderVO> orderList = adminService.orderList();
		
		model.addAttribute("orderList", orderList);
	}
	
	// 주문 상세 목록
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderView(@RequestParam("n") String orderId,
							OrderVO order, Model model) throws Exception {
		logger.info("get order view");
		
		order.setOrderId(orderId);
		List<OrderListVO> orderView = adminService.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
	// 주문 상세 목록 + 상태 변경 + 재고 변경
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		logger.info("post order view");
		
		// 상품(배송) 상태 변경
		adminService.delivery(order);

		// 배송 상태를 변경할 때마다, 재고가 줄어드는 현상 발생
		// 사용자가 주문시 재고 빼는 걸로 변경
//		// orderId와 일치하는 정보를 저장하고
//		List<OrderListVO> orderView = adminService.orderView(order);
//		GoodsVO goods = new GoodsVO();
//		// 하나 씩 반복해서, 값을 세팅한 다음 해당하는 제품의 재고를 뺌
//		for(OrderListVO i : orderView) {
//			goods.setGoodsNum(i.getGoodsNum());
//			goods.setGoodsStock(i.getCartStock());
//			adminService.changeStock(goods);
//		}
		
		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}
	
	// 모든 소감(댓글)
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.GET)
	public void getAllReply(Model model) throws Exception {
		logger.info("get all reply");
		
		List<ReplyListVO> reply = adminService.allReply();
		
		model.addAttribute("reply", reply);
	}
	
	// 댓글(소감) 삭제
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.POST)
	public String deleteReply(ReplyListVO reply) throws Exception {
		logger.info("delete reply");
		
		adminService.deleteReply(reply.getReplyNum());
		
		return "redirect:/admin/shop/allReply";
	}
	
}
