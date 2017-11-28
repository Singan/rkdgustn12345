package com.naver.board.free.service;

import java.util.List;

import com.naver.repository.domain.Board;

public interface BoardService {
	
	public List<Board> selectBoard(int CategoryNo) throws Exception;
	
	public void insertBoard(Board board) throws Exception;
	
}
