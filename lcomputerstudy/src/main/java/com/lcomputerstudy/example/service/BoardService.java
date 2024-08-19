package com.lcomputerstudy.example.service;

import java.util.List;
import com.lcomputerstudy.example.domain.Board;

public interface BoardService {
	// 게시글 목록 불러오기
	public List<Board> selectBoardList();
	
	// 게시글 작성 기능
	public void insertBoard(Board board);
	
	// 게시글 상세보기
	public Board selectBoardBid(int bId);
}
