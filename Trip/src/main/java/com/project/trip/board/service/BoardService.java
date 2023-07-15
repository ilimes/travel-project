package com.project.trip.board.service;

import java.util.List;

import com.project.trip.admin.vo.SideMenuVO;
import com.project.trip.board.vo.BoardReplyVO;
import com.project.trip.board.vo.BoardVO;
import com.project.trip.item.vo.ReviewReplyVO;

public interface BoardService {
	//게시글 목록 조회 - 페이지 처리된 리스트
	List<BoardVO> selectBoardList(BoardVO boardVO);
	
	//모든 게시글 목록 조회
	List<BoardVO> selectAllBoardList(BoardVO boardVO);
	
	//공지사항 리스트 조회
	List<BoardVO> selectNoticeList();
	
	//게시글 상세조회
	BoardVO selectBoard(BoardVO boardVO);
	
	//게시글 카운트
	int selectBoardListCnt(BoardVO boardVO);
	
	//글 등록
	void insertBoard(BoardVO boardVO);
	
	//조회수 증가
	void updateReadCnt(BoardVO boardVO);
	
	//글 삭제
	void deleteBoard(BoardVO boardVO);
	
	//글 수정
	void updateBoard(BoardVO boardVO);
	
	//댓글 달기
	void insertBoardReply(BoardReplyVO boardReplyVO);
	
	//댓글 목록 조회
	List<BoardReplyVO> selectReplyList(BoardReplyVO boardReplyVO);
	
	//댓글 삭제
	void deleteBoardReply(BoardReplyVO boardReplyVO);
	
	//댓글 수정
	void updateBoardReply(BoardReplyVO boardReplyVO);
}
