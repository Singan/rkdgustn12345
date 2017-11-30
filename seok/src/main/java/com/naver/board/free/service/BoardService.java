package com.naver.board.free.service;

import java.util.List;

import com.naver.repository.domain.Board;

public interface BoardService {
	
	public List<Board> selectBoard(int CategoryNo) throws Exception;
	public List<Board> selectBoardByMemberNo(int memberNo) throws Exception;
	
	public void insertBoard(Board board) throws Exception;
	
	public Board detailBoard(int boardNo) throws Exception;
	
	public void upBoard(int boardNo) throws Exception;
	public void downBoard(int boardNo) throws Exception;
	
	public int countBoard(int memberNo) throws Exception;
}

