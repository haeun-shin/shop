package com.shop.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
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
		
		// 파일 인풋박스에 첨부파일이 없다면(=첨부된 파일 이름이 없다면)
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			// 첨부된 파일이 없으면, 미리 준비된 none.png 파일을 대신 출력함
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		// goodsImg에 원본 파일 경로 + 파일명 저장
		vo.setGoodsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		// goodsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
		vo.setGoodsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		adminService.register(vo);
		
		return "redirect:/admin/goods/list";
	}
	
	// 상품 목록
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception {
		logger.info("get goods list");
		
		List<GoodsVO> list = adminService.goodsList();
		
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
		  vo.setGoodsImg(req.getParameter("gdsImg"));
		  vo.setGoodsThumbImg(req.getParameter("gdsThumbImg"));
		  
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
}
