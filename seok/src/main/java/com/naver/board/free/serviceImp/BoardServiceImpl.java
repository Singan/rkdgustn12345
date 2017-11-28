package com.naver.board.free.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.board.free.service.BoardService;
import com.naver.repository.domain.Board;
import com.naver.repository.mapper.BoardMapper;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper; 
	
	@Override
	public void insertBoard(Board board) throws Exception {
		boardMapper.insertBoard(board);
	}
	
	@Override
	public List<Board> selectBoard(int categoryNo) throws Exception {
		return boardMapper.selectBoard(categoryNo);
	}
	
}