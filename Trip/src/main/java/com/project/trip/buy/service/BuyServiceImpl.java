package com.project.trip.buy.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.trip.buy.vo.BookItemVO;
import com.project.trip.buy.vo.BuyVO;
import com.project.trip.cart.vo.CartVO;
import com.project.trip.member.vo.TempMemberVO;

@Service("buyService")
public class BuyServiceImpl implements BuyService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	//상품 구매시 구매정보 등록
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void bookItem(BuyVO buyVO, TempMemberVO tempMemberVO) {
		if(buyVO.getTemp().equals("1")) {
			sqlSession.insert("memberMapper.bookTempItem", tempMemberVO);
		}
		sqlSession.insert("buyMapper.bookItem", buyVO);
		if(buyVO.getTemp().equals("0")) {
			sqlSession.insert("buyMapper.plusMemPoint", buyVO);
			sqlSession.update("buyMapper.updateMemPoint", buyVO);
			sqlSession.update("buyMapper.updateMemRank", buyVO);
		}
		
	}
	
	//선택 상품 구매
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void selectedBuyCartList(BuyVO buyVO, CartVO cartVO) {
		sqlSession.insert("buyMapper.selectedBuyCartList", buyVO);
		sqlSession.delete("cartMapper.deleteCarts", cartVO);
		sqlSession.insert("buyMapper.plusPointList", buyVO);
		sqlSession.update("buyMapper.updateMemPoint", buyVO);
		sqlSession.update("buyMapper.updateMemRank", buyVO);
	}

	//비회원 구매 상품 조회
	@Override
	public BookItemVO selectTempMemberBookInfo(TempMemberVO tempMemberVO) {
		return sqlSession.selectOne("buyMapper.selectTempMemberBookInfo", tempMemberVO);
	}

	@Override
	public int findBookInfo(TempMemberVO tempMemberVO) {
		return sqlSession.selectOne("buyMapper.findBookInfo", tempMemberVO);
	}

	@Override
	public void deleteTempBook(TempMemberVO tempMemberVO) {
		sqlSession.delete("buyMapper.deleteTempBook", tempMemberVO);
	}

}
