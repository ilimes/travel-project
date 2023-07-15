package com.project.trip.item.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trip.board.vo.BoardReplyVO;
import com.project.trip.board.vo.BoardVO;
import com.project.trip.board.vo.PageVO;
import com.project.trip.buy.vo.BookViewVO;
import com.project.trip.item.vo.ImageVO;
import com.project.trip.item.vo.ItemVO;
import com.project.trip.item.vo.ReviewLikeVO;
import com.project.trip.item.vo.ReviewReplyVO;
import com.project.trip.item.vo.ReviewVO;

@Service("itemService")
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//상품 목록 조회
	@Override
	public List<ItemVO> selectItemList(ItemVO itemVO) {
		return sqlSession.selectList("itemMapper.selectItemList", itemVO);
	}
	
	//상품 이미지 조회
	@Override
	public List<ImageVO> selectImageList(ItemVO itemVO) {
		return sqlSession.selectList("itemMapper.selectImageList", itemVO);
	}

	@Override
	public ItemVO selectItemDetail(ItemVO itemVO) {
		return sqlSession.selectOne("itemMapper.selectItemDetail", itemVO);
	}

	@Override
	public void insertReview(ReviewVO reviewVO) {
		sqlSession.insert("itemMapper.insertReview", reviewVO);
	}

	@Override
	public List<ReviewVO> selectReviewList(ReviewVO reviewVO) {
		return sqlSession.selectList("itemMapper.selectReviewList", reviewVO);
	}

	@Override
	public ReviewVO selectReviewDetail(ReviewVO reviewVO) {
		return sqlSession.selectOne("itemMapper.selectReviewDetail", reviewVO);
	}

	@Override
	public int selectReviewListCnt(ReviewVO reviewVO) {
		return sqlSession.selectOne("itemMapper.selectReviewListCnt", reviewVO);
	}

	@Override
	public void updateReadCnt(ReviewVO reviewVO) {
		sqlSession.update("itemMapper.updateReadCnt", reviewVO);
	}
	
	@Override
	public void deleteReview(ReviewVO reviewVO) {
		sqlSession.delete("itemMapper.deleteReview", reviewVO);
	}

	@Override
	public void updateReview(ReviewVO reviewVO) {
		sqlSession.update("itemMapper.updateReview", reviewVO);
	}

	@Override
	public int selectMyReviewLikeCnt(ReviewLikeVO reviewLikeVO) {
		return sqlSession.selectOne("itemMapper.selectMyReviewLikeCnt", reviewLikeVO);
	}

	@Override
	public void insertMyReviewLike(ReviewLikeVO reviewLikeVO) {
		sqlSession.insert("itemMapper.insertMyReviewLike", reviewLikeVO);
	}

	@Override
	public void deleteMyReviewLike(ReviewLikeVO reviewLikeVO) {
		sqlSession.delete("itemMapper.deleteMyReviewLike", reviewLikeVO);
	}

	@Override
	public List<ReviewVO> selectBestReview(ReviewVO reviewVO) {
		return sqlSession.selectList("itemMapper.selectBestReview", reviewVO);
	}
	
	@Override
	public void insertReviewReply(ReviewReplyVO reviewReplyVO) {
		sqlSession.insert("itemMapper.insertReviewReply", reviewReplyVO);
	}

	@Override
	public List<ReviewReplyVO> selectReplyList(ReviewReplyVO reviewReplyVO) {
		return sqlSession.selectList("itemMapper.selectReplyList", reviewReplyVO);
	}

	@Override
	public void deleteReviewReply(ReviewReplyVO reviewReplyVO) {
		sqlSession.delete("itemMapper.deleteReviewReply", reviewReplyVO);
	}
	
	//예약한 패키지 조회
	@Override
	public List<BookViewVO> selectBookList(BookViewVO bookViewVO) {
		return sqlSession.selectList("itemMapper.selectBookList", bookViewVO);
	}

	@Override
	public void updateReviewReply(ReviewReplyVO reviewReplyVO) {
		sqlSession.update("itemMapper.updateReviewReply", reviewReplyVO);
	}

	@Override
	public int selectBookItemCnt(ItemVO itemVO) {
		return sqlSession.selectOne("itemMapper.selectBookItemCnt", itemVO);
	}
	
	
}
