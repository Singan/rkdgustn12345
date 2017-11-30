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
	
	@Override
	public List<Board> selectBoardByMemberNo(int memberNo) throws Exception {
		return boardMapper.selectBoardByMemberNo(memberNo);
	};
	
	@Override
	public Board detailBoard(int boardNo) throws Exception {
		return boardMapper.detailBoard(boardNo);
	}
	
	@Override
	public void upBoard(int boardNo) throws Exception {
		boardMapper.upBoard(boardNo);
	}
	@Override
	public void downBoard(int boardNo) throws Exception {
		boardMapper.downBoard(boardNo);
	}
	
	@Override
	public int countBoardByMemberNo(int memberNo) throws Exception {
		return boardMapper.countBoardByMemberNo(memberNo);
	};
	@Override
	public int sumViewsByMemberNo(int memberNo) throws Exception {
		return boardMapper.sumViewsByMemberNo(memberNo);
	};
	@Override
	public int sumVotesByMemberNo(int memberNo) throws Exception {
		return boardMapper.sumVotesByMemberNo(memberNo);
	};
}
