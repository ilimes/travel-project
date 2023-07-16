package com.project.trip.admin.service;

import java.util.List;

import com.project.trip.admin.vo.AdminMenuVO;
import com.project.trip.admin.vo.BookSearchVO;
import com.project.trip.admin.vo.MenuVO;
import com.project.trip.admin.vo.SideMenuVO;
import com.project.trip.admin.vo.SlideImageVO;
import com.project.trip.admin.vo.SubMenuVO;
import com.project.trip.board.vo.BoardVO;
import com.project.trip.buy.vo.BookViewVO;
import com.project.trip.buy.vo.BuyVO;
import com.project.trip.item.vo.ImageVO;
import com.project.trip.item.vo.ItemCateVO;
import com.project.trip.item.vo.ItemVO;
import com.project.trip.member.vo.MemberVO;

public interface AdminService {
	
	//상품목록(지역) 카테고리
	List<ItemCateVO> selectItemCategory();
	
	//상품 등록
	void regItem(ItemVO itemVO, ImageVO imageVO);
	
	//상품 수정
	void updateItem(ItemVO itemVO);
	
	//상단 메뉴리스트 조회
	List<MenuVO> selectMenuList();
	
	//사이드 메뉴리스트 조회
	List<SideMenuVO> selectSideMenuList(SideMenuVO sideMenuVO);
	
	//관리자 메뉴리스트 조회
	List<AdminMenuVO> selectAdminMenuList();
	
	//회원 목록 조회
	List<MemberVO> selectMemberList();
	
	//회원 상세정보 조회
	MemberVO selectMemberDetail(MemberVO memberVO);
	
	//다음에 올 아이템 코드
	String selectNextItemCode();
	
	//다음에 올 이미지 코드
	int selectNextImgCode();
	
	//전체 상품 수
	int selectItemListCnt();
	
	//한 페이지당 상품목록 조회
	List<ItemVO> selectPageItemList(ItemVO itemVO);
	
	//전체 패키지 예약 수
	int selectBookListCnt();
	
	//한 페이지당 예약된 패키지 조회
	List<BookViewVO> selectBookList(BookViewVO bookViewVO);
	
	//선택 상품 삭제
	void deleteSelectedItem(ItemVO itemVO);
	
	//메인 슬라이드 이미지 등록
	void regSlideImage(SlideImageVO slideImageVO);
	
	//슬라이드 이미지 목록 조회
	List<SlideImageVO> selectSlideList();
	
	//슬라이드 이미지 인덱스
	int selectImageIndex();
	
	//슬라이드 이미지 수정
	void updateSlideImage(SlideImageVO slideImageVO);
	
	//서브 메뉴 리스트 조회
	List<SubMenuVO> selectSubMenuList(SubMenuVO subMenuVO);
	
	//예약 취소
	void deleteBook(BuyVO buyVO);
	
	//1:1문의 전체 목록
	List<BoardVO> selectEnquiryList();
	
	//월별 매출액
	List<BuyVO> selectMonthSales();
	
	//연별 매출액
	List<BuyVO> selectYearSales(BookSearchVO bookSearchVO);
	
	//회원탈퇴 신청 목록
	List<MemberVO> selectDeactiveList();
	
	//회원탈퇴 승인
	void selectMemberSecession(MemberVO memberVO);
		
	
}
