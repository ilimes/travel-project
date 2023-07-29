package com.project.trip.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.trip.admin.service.AdminService;
import com.project.trip.admin.vo.BookSearchVO;
import com.project.trip.admin.vo.SideMenuVO;
import com.project.trip.admin.vo.SlideImageVO;
import com.project.trip.board.service.BoardService;
import com.project.trip.board.vo.BoardReplyVO;
import com.project.trip.board.vo.BoardVO;
import com.project.trip.buy.service.BuyService;
import com.project.trip.buy.vo.BookViewVO;
import com.project.trip.buy.vo.BuyVO;
import com.project.trip.item.service.ItemService;
import com.project.trip.item.vo.ImageVO;
import com.project.trip.item.vo.ItemVO;
import com.project.trip.member.vo.MemberVO;
import com.project.trip.util.TripUtil;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/admin")
public class AdminController {
		
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Resource(name = "itemService")
	private ItemService itemService;
	
	@Resource(name = "buyService")
	private BuyService buyService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	
	//관리자 메뉴 클릭시 나오는 페이지 -> 상품등록 페이지
	@GetMapping("/itemManage")
	public String adminMenu() {
		
		return "redirect:/admin/regItem";
	}

	//상품목록 페이지
	@GetMapping("/itemList")
	public String itemList(Model model, ItemVO itemVO) {
		
		// 1. 전체 데이터의 개수 조회
		int listCnt = adminService.selectItemListCnt();
		
		itemVO.setTotalCnt(listCnt);
		
		// 2. 페이징 처리를 위한 세팅 메소드 호출
		itemVO.setPageInfo();
		
		model.addAttribute("itemList", adminService.selectPageItemList(itemVO));
		
		return "admin/item_list_manage";
	}
	
	//상품등록 페이지 이동
	@GetMapping("/regItem")
	public String regItem(Model model, BookSearchVO bookSearchVO) {
		
		
		//이달의 1일과 오늘 날짜를 구함
		String firstDate = TripUtil.getStartDateToString();
		String nowDate = TripUtil.getNowDateToString();
		
		if(bookSearchVO.getSearchFromDate() == null) {
			bookSearchVO.setSearchFromDate(firstDate);
		}
		
		if(bookSearchVO.getSearchToDate() == null) {
			bookSearchVO.setSearchToDate(nowDate);
		}

		model.addAttribute("areaList", adminService.selectItemCategory());
		
		return "admin/reg_item";
	}
	
	//상품등록 페이지에서 등록버튼 클릭
	@PostMapping("/regItem")
	public String regItem(ItemVO itemVO, MultipartHttpServletRequest multi, Model model) {

		//이미지 정보를 세팅할 공간(List) 생성
		List<ImageVO> imgList = new ArrayList<ImageVO>();
		
		//이미지 삽입 쿼리 실행 시 빈값을 채워줄 객체
		ImageVO imageVO = new ImageVO();
		
		//다음에 들어갈 IMG_CODE 값을 조회
		int nextImgCode = adminService.selectNextImgCode();
		
		//다음에 들어갈 ITEM_CODE 값을 조회
		String NextItemCode = adminService.selectNextItemCode();
		
		//이미지 파일 업로드
		Iterator<String> inputTagNames = multi.getFileNames();
		
		//첨부파일이 저장될 위치 지정
		String uploadPath = "D:\\Git\\workspaceSTS\\Trip\\src\\main\\webapp\\resources\\images\\";
		
		while(inputTagNames.hasNext()) {
			//"mainImg", "subImg"
			String inputTagName = inputTagNames.next();
			
			//다중 첨부...
			if(inputTagName.equals("subImg")) {
				List<MultipartFile> fileList = multi.getFiles(inputTagName);
				
				for(MultipartFile file : fileList) {
					
					//첨부하고자 하는 파일명 (원본파일명)
					String originFileName = file.getOriginalFilename();
					
					if(!originFileName.equals("")) {
						//첨부할 파일명
						String attachedFileName = System.currentTimeMillis() + "_" + originFileName;
						
						try {
							file.transferTo(new File(uploadPath + attachedFileName));
							
							ImageVO vo = new ImageVO();
							vo.setImgCode(nextImgCode++);
							vo.setOriginImgName(originFileName);
							vo.setAttachedImgName(attachedFileName);
							vo.setIsMain("N");
							vo.setItemCode(NextItemCode);
							imgList.add(vo);
							
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
			//단일 첨부...
			else {
				//name이 "mainImg"인 input태그의 파일 정보를 가져 옴.
				MultipartFile file = multi.getFile(inputTagName);
				
				//첨부하고자 하는 파일명 (원본파일명)
				String originFileName = file.getOriginalFilename();
				
				if(!originFileName.equals("")) {
					//첨부할 파일명
					String attachedFileName = System.currentTimeMillis() + "_" + originFileName;
					
					//파일 업로드
					//매개변수로 경로 및 파일명을 넣어줌
					try {
						file.transferTo(new File(uploadPath + attachedFileName));
						
						ImageVO vo = new ImageVO();
						vo.setImgCode(nextImgCode++);
						vo.setOriginImgName(originFileName);
						vo.setAttachedImgName(attachedFileName);
						vo.setIsMain("Y");
						vo.setItemCode(NextItemCode);
						
						
						imgList.add(vo);
						
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		itemVO.setItemCode(NextItemCode);
		imageVO.setImageList(imgList);
		adminService.regItem(itemVO, imageVO);
		
		return "redirect:/admin/itemManage";
	}
			
	//선택 상품 삭제
	@GetMapping("deleteSelectedItem")
	public String deleteSelectedItem(ItemVO itemVO, SideMenuVO sideMenuVO) {
		
		//폴더에 있는 이미지 삭제
		String filePath = "D:\\Git\\workspaceSTS\\Trip\\src\\main\\webapp\\resources\\images\\";
		List<ImageVO> image = itemService.selectImageList(itemVO);
		
		for(ImageVO img : image) {
			img.getAttachedImgName();
			File file = new File(filePath + img.getAttachedImgName());
			System.out.println(img.getAttachedImgName());
			if(file.exists()) {
				file.delete();
			}
		}
		
		adminService.deleteSelectedItem(itemVO);
		
		return "redirect:/admin/itemList";
	}
	
	//상품 변경	
	@GetMapping("/itemUpdate")
	public String itemUpdate(Model model, ItemVO itemVO) {
		
		model.addAttribute("itemInfo", itemService.selectItemDetail(itemVO));
		
		return "admin/update_item";
	}
	@PostMapping("updateItem")
	public String updateItem(ItemVO itemVO) {
		
		adminService.updateItem(itemVO);
		
		return "redirect:/admin/itemList";
	}
		
	//메인화면 이미지 등록 페이지 이동
	@GetMapping("/regImage")
	public String regImage(SlideImageVO slideImageVO) {
		return "admin/reg_image";
	}
	
	//메인화면 슬라이드 이미지 등록
	@PostMapping("/regImage")
	public String regImage(MultipartHttpServletRequest multi, Model model, SlideImageVO slideImageVO) {
		
		//이미지 파일 업로드
		Iterator<String> inputTagNames = multi.getFileNames();
		
		//첨부파일이 저장될 위치 지정
		String uploadPath = "D:\\Git\\workspaceSTS\\Trip\\src\\main\\webapp\\resources\\images\\slide\\";
		
		String inputTagName = inputTagNames.next();
		
		List<SlideImageVO> imageSize = adminService.selectSlideList();
		
		int index = adminService.selectImageIndex();
		
		if(imageSize.size() < 4) {
		
			
		if(inputTagName.equals("slideImage")) {
	
			MultipartFile file = multi.getFile(inputTagName);
			
			//첨부하고자 하는 파일명 (원본파일명)
			String originFileName = file.getOriginalFilename();
			
			String extension = originFileName.substring(originFileName.length()-4);
			
			if(!originFileName.equals("")) {
				
				//첨부할 파일명
				String attachedFileName = "slideImage" + index + extension;
				
				//파일 업로드
				try {
					file.transferTo(new File(uploadPath + attachedFileName));
					
					slideImageVO.setOriginImgName(originFileName);
					slideImageVO.setAttachedImgName(attachedFileName);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
		}
		adminService.regSlideImage(slideImageVO);
		}
		return "redirect:/admin/regImage";
	}
	
	//슬라이드 이미지 수정 페이지
	@GetMapping("/updateImage")
	public String updateImage(Model model) {
		model.addAttribute("imageList", adminService.selectSlideList());
		return "admin/update_image";
	}
	
	//슬라이드 이미지 수정
	@PostMapping("/updateImage")
	public String updateImage(SlideImageVO slideImageVO, MultipartHttpServletRequest multi) {
		
		//이미지 파일 업로드
		Iterator<String> inputTagNames = multi.getFileNames();
		
		//첨부파일이 저장될 위치 지정
		String uploadPath = "D:\\Git\\workspaceSTS\\Trip\\src\\main\\webapp\\resources\\images\\slide\\";
		
		String inputTagName = inputTagNames.next();
		String imgCode = slideImageVO.getImgCode();
		
		String index = imgCode.substring(imgCode.length()-1);
		
		if(inputTagName.equals("updateImg")) {
	
			MultipartFile file = multi.getFile(inputTagName);
			
			//첨부하고자 하는 파일명 (원본파일명)
			String originFileName = file.getOriginalFilename();
		
			String extension = originFileName.substring(originFileName.length()-4);
			
			if(!originFileName.equals("")) {
				//첨부할 파일명
				String attachedFileName = "slideImage" + index + extension;
				
			//파일 업로드
			try {
					file.transferTo(new File(uploadPath + attachedFileName));
					
					slideImageVO.setOriginImgName(originFileName);
					slideImageVO.setAttachedImgName(attachedFileName);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
		}
		
		adminService.updateSlideImage(slideImageVO);
		
		return "redirect:/admin/updateImage";
	}
	
	//회원관리 페이지 이동
	@GetMapping("/memberManage")
	public String memberManage(Model model) {
		
		model.addAttribute("memberList", adminService.selectMemberList());
		return "admin/member_manage";
	}
	
	//회원 상세정보 페이지
	@GetMapping("memberDetail")
	public String memberDetail(Model model, MemberVO memberVO) {
		model.addAttribute("member", adminService.selectMemberDetail(memberVO));
		return "admin/member_detail";
	}
	
	//회원탈퇴 신청 목록
	@GetMapping("/memberSecession")
	public String memberSecession(Model model) {
		
		model.addAttribute("memSecession", adminService.selectDeactiveList());
		
		return "admin/member_secession";
	}
	@GetMapping("/SelectMemberSecession")
	public String selectedMemberSecession(MemberVO memberVO) {
		
		adminService.selectMemberSecession(memberVO);
		
		return "redirect:/admin/memberSecession";
	}
	
	//예약관리 페이지 이동
	@GetMapping("/bookManage")
	public String bookManage(Model model, BookViewVO bookViewVO) {
		
		// 1. 전체 데이터의 개수 조회
		int listCnt = adminService.selectBookListCnt();
		
		bookViewVO.setTotalCnt(listCnt);
		
		// 2. 페이징 처리를 위한 세팅 메소드 호출
		bookViewVO.setPageInfo();
		
		model.addAttribute("bookList", adminService.selectBookList(bookViewVO));
		
		return "admin/book_list";
	}
	
	//예약 취소
	@PostMapping("/bookCancel")
	@ResponseBody
	public void bookCancel(BuyVO buyVO) {
		
		adminService.deleteBook(buyVO);
		
	}
	
	//상담 및 문의관리 페이지
	@GetMapping("/helpManage")
	public String helpManage(Model model) {
		
		model.addAttribute("enquiryList", adminService.selectEnquiryList());
		
		return "admin/enquiry_list";
	}
	
	//1:1 문의 상세보기
	@GetMapping("/enquDetail")
	public String enquDetail(BoardVO boardVO, Model model, SideMenuVO sideMenuVO, BoardReplyVO boardReplyVO) {
		 
	model.addAttribute("adminMenuList", adminService.selectAdminMenuList());
	model.addAttribute("sideMenuList" ,adminService.selectSideMenuList(sideMenuVO));
	model.addAttribute("selectedSideMenu", sideMenuVO.getSideMenuCode());
	model.addAttribute("boardInfo", boardService.selectBoard(boardVO));
	
	//댓글 리스트 보내기
	model.addAttribute("boardReplyList", boardService.selectReplyList(boardReplyVO));
	 
		return "admin/enquiry_detail";
	}
	
	//1:1 문의 답글 달기
	@PostMapping("/boardReply")
	public String boardReply(BoardReplyVO boardReplyVO, HttpSession session) {
		String loginId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		boardReplyVO.setWriter(loginId);
		
		boardService.insertBoardReply(boardReplyVO);
		
		return "redirect:/admin/enquDetail?sideMenuCode=SIDE_MENU_401&boardNum=" + boardReplyVO.getBoardNum();
	}
	
	//연월별 매출
	@GetMapping("/dateSales")
	public String dateSales(Model model, BookSearchVO bookSearchVO) {
		String defaultDate = TripUtil.getDefaultDate();
		
		//월별 매출
		List<BuyVO> list = adminService.selectMonthSales();

		Gson gson = new Gson();
		JsonArray jsonArray = new JsonArray();
		
		Iterator<BuyVO> it = list.iterator();
		while(it.hasNext()) {
			BuyVO buyVO = it.next();
			JsonObject object = new JsonObject();
			int buyPrice = buyVO.getBuyPrice();
			
			object.addProperty("totalPrice", buyPrice);
			jsonArray.add(object);
		}
		
		
		//연별 매출
		if(bookSearchVO.getSearchFromDate() == null) {
			bookSearchVO.setSearchFromDate(defaultDate);
		}
		List<BuyVO> yearList = adminService.selectYearSales(bookSearchVO);

		Gson gson1 = new Gson();
		JsonArray jsonArray1 = new JsonArray();
		
		Iterator<BuyVO> it1 = yearList.iterator();
		while(it1.hasNext()) {
			BuyVO buyVO = it1.next();
			JsonObject object = new JsonObject();
			int buyPrice = buyVO.getBuyPrice();
			String bookYear = buyVO.getBookDate();
			
			object.addProperty("bookYear", bookYear);
			object.addProperty("totalPrice", buyPrice);
			jsonArray1.add(object);
		}
		
		
		String json = gson.toJson(jsonArray);
		String json1 = gson1.toJson(jsonArray1);
		
		
		model.addAttribute("month", json);
		model.addAttribute("year", json1);

		
		return "admin/date_sales";
	}
	
	@GetMapping("/mapTest")
	public String mapTest() {
		
		return "admin/map_test";
	}
	@GetMapping("/mapTest2")
	public String mapTest2() {
		
		return "admin/map_test2";
	}
	
	@PostMapping("/calculation")
	@ResponseBody
	public List<Map<String, String>> calculation(String data) {
		
		int index= 0;
		List<Map<String, String>> list = JSONArray.fromObject(data);
		//위도 및 경도가 담길 배열
		String[] lng = new String[list.size()];
		String[] lat = new String[list.size()];
		for(Map<String, String> map : list) {
			System.out.println("lat : " + map.get("lat") + " / lng=" + map.get("lng"));
			lng[index] = map.get("lng");
			lat[index] = map.get("lat");
			index++;
		}
		
		List<Map<String, String>> resultList = new ArrayList<Map<String,String>>();
		
		// 미터(Meter) 단위로 거리계산 -> 위도1, 경도1, 위도2, 경도2
			List<Double> distanceList = new ArrayList<Double>();
			Map<Integer, Double> map = new HashMap<>();
			int distanceIndex = 0;
			for(int i = 0 ; i < lng.length - 1 ; i++) {
				distanceList.add(distance(Double.parseDouble(lat[distanceIndex]), Double.parseDouble(lng[distanceIndex]), Double.parseDouble(lat[i + 1]), Double.parseDouble(lng[i + 1]), "meter"));
				map.put(i + 1, distance(Double.parseDouble(lat[distanceIndex]), Double.parseDouble(lng[distanceIndex]), Double.parseDouble(lat[i + 1]), Double.parseDouble(lng[i + 1]), "meter"));
			}
			
			Map<Integer, Double> sort_map_by_value = map.entrySet().stream()
					.sorted(Map.Entry.comparingByValue())
					.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));

			
			List<Map.Entry<Integer, Double>> entries =
			        map.entrySet().stream()
			                      .sorted(Map.Entry.comparingByKey())
			                      .collect(Collectors.toList());
			// sort by value
			System.out.println();
			entries = map.entrySet().stream()
			        .sorted(Map.Entry.comparingByValue())
			        .collect(Collectors.toList());
			
			Map<String, String> resultMapFirst = new HashMap<String, String>();
			resultMapFirst.put("lat", lat[0]);
			resultMapFirst.put("lng", lng[0]);
			resultList.add(resultMapFirst);
			
			for (Map.Entry<Integer, Double> entry : entries) {
				Map<String, String> resultMap = new HashMap<String, String>();
			    resultMap.put("lat", lat[entry.getKey()]);
			    resultMap.put("lng", lng[entry.getKey()]);
			    resultList.add(resultMap);
			}
		System.out.println(resultList);
		
		return resultList;
	}
	
	//거리계산
	private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        }
 
        return (dist);
    }
 
    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

	
}
