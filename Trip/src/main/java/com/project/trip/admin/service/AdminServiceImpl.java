package com.project.trip.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	//세션 사용하기 위해 객체 생성
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//상품목록(지역) 카테고리
	@Override
	public List<ItemCateVO> selectItemCategory() {
		return sqlSession.selectList("adminMapper.selectItemCategory");
	}
	
	//상품 등록
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void regItem(ItemVO itemVO, ImageVO imageVO) {
		sqlSession.insert("adminMapper.regItem", itemVO);
		
		if(imageVO.getImageList().size() != 0) {
			sqlSession.insert("adminMapper.insertImages", imageVO);
		}
	}
	
	//상품 수정
	@Override
	public void updateItem(ItemVO itemVO) {
		sqlSession.update("adminMapper.updateItem", itemVO);
	}
	
	//한 페이지당 상품 목록 조회
	@Override
	public List<ItemVO> selectPageItemList(ItemVO itemVO) {
		return sqlSession.selectList("adminMapper.selectPageItemList", itemVO);
	}
	
	//상단 메뉴리스트 조회
	@Override
	public List<MenuVO> selectMenuList() {
		return sqlSession.selectList("adminMapper.selectMenuList");
	}

	//사이드 메뉴리스트 조회
	@Override
	public List<SideMenuVO> selectSideMenuList(SideMenuVO sideMenuVO) {
		return sqlSession.selectList("adminMapper.selectSideMenuList", sideMenuVO);
	}
	
	//관리자 메뉴리스트 조회
	@Override
    public List<AdminMenuVO> selectAdminMenuList() {
		return sqlSession.selectList("adminMapper.selectAdminMenuList");
    }
	
	//회원 목록 조회
	@Override
	public List<MemberVO> selectMemberList() {
		return sqlSession.selectList("adminMapper.selectMemberList");
	}
	
	//회원 상세정보 조회
	@Override
	public MemberVO selectMemberDetail(MemberVO memberVO) {
		return sqlSession.selectOne("adminMapper.selectMemberDetail", memberVO);
	}
	
	//다음에 올 아이템 코드
	@Override
	public String selectNextItemCode() {
		return sqlSession.selectOne("adminMapper.selectNextItemCode");
	}
	
	//다음에 올 이미지 코드
	@Override
	public int selectNextImgCode() {
		return sqlSession.selectOne("adminMapper.selectNextImgCode");
	}
	
	//전체 상품 수
	@Override
	public int selectItemListCnt() {
		return sqlSession.selectOne("adminMapper.selectItemListCnt");
	}
	
	//전체 패키지 예약 수
	@Override
	public int selectBookListCnt() {
		return sqlSession.selectOne("adminMapper.selectBookListCnt");
	}
	
	//한 페이지당 예약된 패키지 조회
	@Override
	public List<BookViewVO> selectBookList(BookViewVO bookViewVO) {
		return sqlSession.selectList("adminMapper.selectBookList", bookViewVO);
	}
	
	//선택 상품 삭제
	@Override
	public void deleteSelectedItem(ItemVO itemVO) {
		sqlSession.delete("adminMapper.deleteSelectedItem", itemVO);
	}
	
	//메인 슬라이드 이미지 등록
	@Override
	public void regSlideImage(SlideImageVO slideImageVO) {
		sqlSession.insert("adminMapper.regSlideImage", slideImageVO);
		
	}
	
	//메인 슬라이드 이미지 목록
	@Override
	public List<SlideImageVO> selectSlideList() {
		return sqlSession.selectList("adminMapper.selectSlideList");
	}
	
	//슬라이드 이미지 인덱스
	@Override
	public int selectImageIndex() {
		return sqlSession.selectOne("adminMapper.selectImageIndex");
	}
	
	//슬라이드 이미지 수정
	@Override
	public void updateSlideImage(SlideImageVO slideImageVO) {
		sqlSession.update("adminMapper.updateSlideImage", slideImageVO);
	}

	//서브 메뉴 리스트 조회
	@Override
	public List<SubMenuVO> selectSubMenuList(SubMenuVO subMenuVO) {
		return sqlSession.selectList("adminMapper.selectSubMenuList", subMenuVO);
	}
	
	//예약 취소
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void deleteBook(BuyVO buyVO) {
		sqlSession.delete("adminMapper.deleteBook",buyVO);
		sqlSession.update("buyMapper.updateMemPoint", buyVO);
		sqlSession.update("buyMapper.updateMemRank", buyVO);
	}
	
	//1:1문의 전체조회
	@Override
	public List<BoardVO> selectEnquiryList() {
		return sqlSession.selectList("adminMapper.selectEnquiryList");
	}
	
	//월별 매출
	@Override
	public List<BuyVO> selectMonthSales() {
		return sqlSession.selectList("adminMapper.selectMonthSales");
	}
	
	//연별 매출
	@Override
	public List<BuyVO> selectYearSales(BookSearchVO bookSearchVO) {
		return sqlSession.selectList("adminMapper.selectYearSales", bookSearchVO);
	}
	
	//회원 탈퇴 신청 목록
	@Override
	public List<MemberVO> selectDeactiveList() {
		return sqlSession.selectList("adminMapper.selectDeactiveList");
	}
	
	@Override
	public void selectMemberSecession(MemberVO memberVO) {
		sqlSession.delete("selectMemberSecession", memberVO);
	}

	



	

	
	
	

	
	

	
}
