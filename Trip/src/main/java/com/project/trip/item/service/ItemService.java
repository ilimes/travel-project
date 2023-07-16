package com.project.trip.item.service;

import java.util.List;

import com.project.trip.board.vo.BoardReplyVO;
import com.project.trip.board.vo.BoardVO;
import com.project.trip.board.vo.PageVO;
import com.project.trip.buy.vo.BookViewVO;
import com.project.trip.item.vo.ImageVO;
import com.project.trip.item.vo.ItemVO;
import com.project.trip.item.vo.ReviewLikeVO;
import com.project.trip.item.vo.ReviewReplyVO;
import com.project.trip.item.vo.ReviewVO;

public interface ItemService {
	
	//상품 목록 조회
	List<ItemVO> selectItemList(ItemVO itemVO);
	
	//상품 이미지 조회
	List<ImageVO> selectImageList(ItemVO itemVO);
	
	//상품 상세조회
	ItemVO selectItemDetail(ItemVO itemVO);
	
	//후기 등록
	void insertReview(ReviewVO reviewVO);
	
	//후기 리스트 조회
	List<ReviewVO> selectReviewList(ReviewVO reviewVO);
	
	//후기 상세 조회
	ReviewVO selectReviewDetail(ReviewVO reviewVO);
	
	//페이징 처리 위해서 리뷰 개수 세기
	int selectReviewListCnt(ReviewVO reviewVO);
	
	//조회수 증가 시키기
	void updateReadCnt(ReviewVO reviewVO);
	
	//리뷰삭제
	void deleteReview(ReviewVO reviewVO);
	
	//리뷰수정
	void updateReview(ReviewVO reviewVO);
	
	//리뷰썼는지 체크
	int selectMyReviewLikeCnt(ReviewLikeVO reviewLikeVO);
	
	//리뷰추천
	void insertMyReviewLike(ReviewLikeVO reviewLikeVO);
	
	//리뷰 추천 삭제
	void deleteMyReviewLike(ReviewLikeVO reviewLikeVO);
	
	//베스트 리뷰 조회
	List<ReviewVO> selectBestReview(ReviewVO reviewVO);
	
	//리뷰에 댓글 달기
	void insertReviewReply(ReviewReplyVO reviewReplyVO);
	
	//리뷰에 있는 댓글 목록 조회
	List<ReviewReplyVO> selectReplyList(ReviewReplyVO reviewReplyVO);
	
	//댓글 삭제
	void deleteReviewReply(ReviewReplyVO reviewReplyVO);
	
	//예약한 패키지 조회
	List<BookViewVO> selectBookList(BookViewVO bookViewVO);
	
	//댓글 수정
	void updateReviewReply(ReviewReplyVO reviewReplyVO);
	
	//예약 카운트
	int selectBookItemCnt(ItemVO itemVO);
	
}
