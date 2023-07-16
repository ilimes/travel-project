package com.project.trip.cart.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trip.cart.vo.CartVO;
import com.project.trip.cart.vo.CartViewVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertCart(CartVO cartVO) {
		return sqlSession.insert("cartMapper.insertCart", cartVO);
	}

	@Override
	public List<CartViewVO> selectCartList(String memId) {
		return sqlSession.selectList("cartMapper.selectCartList", memId);
	}

	@Override
	public int deleteCart(CartVO cartVO) {
		return sqlSession.delete("cartMapper.deleteCart", cartVO);
	}

	@Override
	public int deleteCarts(CartVO cartVO) {
		return sqlSession.delete("cartMapper.deleteCarts", cartVO);
	}

	@Override
	public int updateItemCnt(CartVO cartVO) {
		return sqlSession.update("cartMapper.updateItemCnt", cartVO);
	}

}
