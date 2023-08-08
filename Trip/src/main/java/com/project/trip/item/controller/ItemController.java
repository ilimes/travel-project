package com.project.trip.item.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.project.trip.admin.service.AdminService;
import com.project.trip.admin.vo.MenuVO;
import com.project.trip.admin.vo.SideMenuVO;
import com.project.trip.board.service.BoardService;
import com.project.trip.board.vo.BoardReplyVO;
import com.project.trip.board.vo.BoardVO;
import com.project.trip.board.vo.PageVO;
import com.project.trip.buy.vo.BookViewVO;
import com.project.trip.item.service.ItemService;
import com.project.trip.item.vo.ItemVO;
import com.project.trip.item.vo.ReviewLikeVO;
import com.project.trip.item.vo.ReviewReplyVO;
import com.project.trip.item.vo.ReviewVO;
import com.project.trip.member.vo.MemberVO;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@Resource(name="itemService")
	private ItemService itemService;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@GetMapping("/mainPage")
	public String mainPage(Model model, ReviewVO reviewVO) {
		reviewVO.setRowNum(5);
		model.addAttribute("reviewList", itemService.selectBestReview(reviewVO));
		
		return "template/main";
	}
	
	@GetMapping("/itemList")
	public String itemList(Model model, ItemVO itemVO) {
		
		//아이템 리스트 보내기
		model.addAttribute("itemList", itemService.selectItemList(itemVO));
		
		return "item/item_list";
	}
	
	@GetMapping("/itemDetail")
	public String itemDetail(Model model, ItemVO itemVO, PageVO pageVO, ReviewVO reviewVO) {
		
		//아이템 상세정보 보내기
		model.addAttribute("itemInfo", itemService.selectItemDetail(itemVO));
		//1. 페이징 처리 위해서 게시글 세기
		int totalCnt = itemService.selectReviewListCnt(reviewVO);
		reviewVO.setTotalCnt(totalCnt);
		// -- 모든 게시글을 가져오기 위해서 displayCnt를 totalCnt로 설정.
		reviewVO.setDisplayCnt(totalCnt);
		// 2. 페이징 처리를 위한 세팅 메소드 호출
		reviewVO.setPageInfo();   
		//리뷰 리스트 보내기
		model.addAttribute("reviewList", itemService.selectReviewList(reviewVO));
		
		return "item/item_detail";
	}
	
	@GetMapping("/tripReview")
	public String tripReview() {
		return "redirect:/item/review?menuCode=MENU_002";
	}
	
	@GetMapping("/bestReview")
	public String bestReview(Model model, PageVO pageVO, ReviewVO reviewVO) {
		reviewVO.setRowNum(10);
		model.addAttribute("reviewList", itemService.selectBestReview(reviewVO));
		return "item/best_review";
	}
	
	@GetMapping("/review")
	public String review(Model model, PageVO pageVO, ReviewVO reviewVO) {
		//1. 페이징 처리 위해서 게시글 세기
		reviewVO.setTotalCnt(itemService.selectReviewListCnt(reviewVO));
		// 2. 페이징 처리를 위한 세팅 메소드 호출
		reviewVO.setPageInfo();    
		
		model.addAttribute("reviewList", itemService.selectReviewList(reviewVO));
		return "item/review";
	}
	
	@GetMapping("/tripInfo")
	public String tripInfo() {
		return "item/weather";
	}
	
	@GetMapping("/weather")
	public String weather() {
		return "item/weather";
	}
	
	@GetMapping("/needs")
	public String needs() {
		return "item/needs";
	}
	
	@GetMapping("/reviewWriteForm")
	public String reviewWriteForm(Model model, BookViewVO bookViewVO, HttpSession session) {
		//memId 받아오기 - 세션에서 & 채워주기
		String loginId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		bookViewVO.setMemId(loginId);
		//예약 리스트 보내기
		model.addAttribute("bookList", itemService.selectBookList(bookViewVO));
		return "item/review_write_form";
	}
	
	@PostMapping("/insertReview")
	public String insertReview(HttpSession session, ReviewVO reviewVO) {
		//memId 받아오기 - 세션에서
		String loginId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		//memId 채워주기
		reviewVO.setWriter(loginId);
		
		itemService.insertReview(reviewVO);
		
		return "redirect:/item/review?menuCode=MENU_002&selectedMenu=MENU_002";
	}
	
	// 이미지 업로드
    @RequestMapping(value="/fileupload", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception{
    	// 랜덤 문자 생성
    	UUID uid = UUID.randomUUID();
    	
    	OutputStream out = null;
    	PrintWriter printWriter = null;
    	
    	//인코딩
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
    	try{
    		//파일 이름 가져오기
    		String fileName = upload.getOriginalFilename();
    		byte[] bytes = upload.getBytes();

			ServletContext ctx = request.getSession().getServletContext();
			String webPath = "/resources/ckeditor/images/";
			String path = ctx.getRealPath(webPath);

    		//이미지 경로 생성
//    		String path = "D:/Git/workspaceSTS/Trip/src/main/webapp/resources/ckeditor/images/";	// 이미지 경로 설정(폴더 자동 생성)
    		String ckUploadPath = path + uid + "_" + fileName;
    		File folder = new File(path);
    		System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
    		//해당 디렉토리 확인
    		if(!folder.exists()){
    			try{
    				folder.mkdirs(); // 폴더 생성
    		}catch(Exception e){
    			e.getStackTrace();
    		}
    	}
    	
    	out = new FileOutputStream(new File(ckUploadPath));
    	out.write(bytes);
    	out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
    	
    	String callback = request.getParameter("CKEditorFuncNum");
    	printWriter = response.getWriter();
    	String fileUrl = "/item/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면
    	
    	// 업로드시 메시지 출력
    	printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
    	printWriter.flush();
    	
    	}catch(IOException e){
    		e.printStackTrace();
    	} finally {
    		try {
    		if(out != null) { out.close(); }
    		if(printWriter != null) { printWriter.close(); }
    	} catch(IOException e) { e.printStackTrace(); }
    	}
    	return;
    }
	
 // 서버로 전송된 이미지 뿌려주기
    @RequestMapping(value="/ckImgSubmit")
    public void ckSubmit(@RequestParam(value="uid") String uid
    		, @RequestParam(value="fileName") String fileName
    		, HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
    	
    	//서버에 저장된 이미지 경로
		ServletContext ctx = request.getSession().getServletContext();
		String webPath = "/resources/ckeditor/images/";
		String path = ctx.getRealPath(webPath);
//    	String path = "D:/Git/workspaceSTS/Trip/src/main/webapp/resources/ckeditor/images/";	// 저장된 이미지 경로
    	System.out.println("path:"+path);
    	String sDirPath = path + uid + "_" + fileName;
    	
    	File imgFile = new File(sDirPath);
    	
    	//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
    	if(imgFile.isFile()){
    		byte[] buf = new byte[1024];
    		int readByte = 0;
    		int length = 0;
    		byte[] imgBuf = null;
    		
    		FileInputStream fileInputStream = null;
    		ByteArrayOutputStream outputStream = null;
    		ServletOutputStream out = null;
    		
    		try{
    			fileInputStream = new FileInputStream(imgFile);
    			outputStream = new ByteArrayOutputStream();
    			out = response.getOutputStream();
    			
    			while((readByte = fileInputStream.read(buf)) != -1){
    				outputStream.write(buf, 0, readByte); 
    			}
    			
    			imgBuf = outputStream.toByteArray();
    			length = imgBuf.length;
    			out.write(imgBuf, 0, length);
    			out.flush();
    			
    		}catch(IOException e){
    			e.printStackTrace();
    		}finally {
    			outputStream.close();
    			fileInputStream.close();
    			out.close();
    			}
    		}
    }
    
	@GetMapping("/reviewDetail")
	public String reviewDetail(Model model, HttpSession session, MenuVO menuVO, ReviewVO reviewVO, ReviewLikeVO reviewLikeVO, ReviewReplyVO reviewReplyVO) {
		//조회수 증가시키기
		itemService.updateReadCnt(reviewVO);
		
		//memId 받아오기 - 세션에서, 없는 경우 emptyID로 설정
		String memId = "";
		if(session.getAttribute("loginInfo") == null) {
			memId = "emptyID";
		}
		else {
			memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		}
		
		reviewLikeVO.setReviewNum(reviewVO.getReviewNum());
		reviewLikeVO.setMemId(memId);
		
		model.addAttribute("myReviewLikeCnt", itemService.selectMyReviewLikeCnt(reviewLikeVO));

		//리뷰 정보 보내기
		model.addAttribute("reviewInfo", itemService.selectReviewDetail(reviewVO));
		//댓글 리스트 보내기
		model.addAttribute("reviewReplyList", itemService.selectReplyList(reviewReplyVO));
		
		return "item/review_detail";
	}
	
	@GetMapping("/deleteReview")
	public String deleteBoard(Model model, MenuVO menuVO, ReviewVO reviewVO) {
		itemService.deleteReview(reviewVO);
		return "redirect:/item/review?menuCode=" + menuVO.getMenuCode();
	}
	
	@ResponseBody
	@PostMapping("/updateReview")
	public ReviewVO updateBoard(ReviewVO reviewVO) {
		itemService.updateReview(reviewVO);
		return reviewVO;
	}
	
	@PostMapping("/insertMyReviewLike")
	public String insertMyReviewLike(ReviewLikeVO reviewLikeVO) {
		itemService.insertMyReviewLike(reviewLikeVO);
		return "redirect:/item/reviewDetail?menuCode=MENU_002&reviewNum=" + reviewLikeVO.getReviewNum();
	}
	
	@PostMapping("/deleteMyReviewLike")
	public String deleteMyReviewLike(ReviewLikeVO reviewLikeVO) {
		itemService.deleteMyReviewLike(reviewLikeVO);
		return "redirect:/item/reviewDetail?menuCode=MENU_002&reviewNum=" + reviewLikeVO.getReviewNum();
	}
	
	@PostMapping("/insertReviewReply")
	public String insertReviewReply(ReviewReplyVO reviewReplyVO, HttpSession session) {
		//memId 받아오기 - 세션에서 & 채워주기
		String loginId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		reviewReplyVO.setWriter(loginId);
		
		itemService.insertReviewReply(reviewReplyVO);
		return "redirect:/item/reviewDetail?menuCode=MENU_002&reviewNum=" + reviewReplyVO.getReviewNum();
	}
	
	@PostMapping("/deleteReviewReply")
	public String deleteReviewReply(ReviewReplyVO reviewReplyVO) {
		itemService.deleteReviewReply(reviewReplyVO);
		return "redirect:/item/reviewDetail?menuCode=MENU_002&reviewNum=" + reviewReplyVO.getReviewNum();
	}
	
	@GetMapping("/popUp")
    public ModelAndView popupGet(Model model, ReviewReplyVO reviewReplyVO, HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/item/modify_reply");
        
		//memId 받아오기 - 세션에서 & 채워주기
		String loginId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		reviewReplyVO.setWriter(loginId);
        
        return mav;
    }
	
	@PostMapping("/modifyReviewReply")
	public void modifyReviewReply(ReviewReplyVO reviewReplyVO) {
		itemService.updateReviewReply(reviewReplyVO);
	}
	
	@GetMapping("/chatting")
	public String goChat() {
		return "redirect:/chat/login?menuCode=MENU_003";
	}
	
	@GetMapping("/mapRoute")
	public String mapRoute() {
		return "item/map_route";
	}
	
}
