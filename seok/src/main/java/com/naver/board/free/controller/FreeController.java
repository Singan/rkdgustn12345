package com.naver.board.free.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.naver.board.comment.service.CommentService;
import com.naver.board.free.service.BoardService;
import com.naver.file.service.FileService;
import com.naver.repository.domain.Board;
import com.naver.repository.domain.Comment;
import com.naver.repository.domain.File;
import com.naver.repository.domain.Member;

@Controller
@RequestMapping("/board")
public class FreeController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/free.do")
	public String free(Model model) throws Exception{
		model.addAttribute("list",boardService.selectBoard(1));
		return "/board/freeMain";
	}
	
	@RequestMapping("/{boardNo}/freeDetail.do") 
	public String freeDetailForm(Model model, 
			@PathVariable int boardNo) throws Exception{
		// boardNo 로 comment 뽑는다.
		List<Comment> commentList = commentService.selectComment((int)boardNo);
		List<String> imageList = new ArrayList<>();
		List<String> fileList = new ArrayList<>();
		
		boardService.viewUpBoard(boardNo);
		
		Board board = boardService.detailBoard((int)boardNo);
		
		int fileGroupNo = board.getFileGroupNo();
		
		System.out.println("filegroupno : " + fileGroupNo);
		List<File> list = fileService.selectFileList(fileGroupNo);
		
		System.out.println(list.size());
		Iterator<File> it = list.iterator();

		while(it.hasNext()) {
			String cate = it.next().getFilePath(); // /image, /file
			//String path = it.next().getFileSystemName(); 
			System.out.println(it.next().getFileSystemName());
			
			/*if(cate.equals("/image")) {
				imageList.add(path);
			}
			else if(cate.equals("/file")) {
				fileList.add(path);
			}*/
		}
		/*System.out.println("1 :" + !commentList.isEmpty());
		System.out.println("2 :" + !imageList.isEmpty());
		System.out.println("3 :" + !fileList.isEmpty());
		*/
		if(!commentList.isEmpty()) {
			System.out.println("11 :" + !commentList.isEmpty());
			model.addAttribute("commentList", commentList);
		}
		if(imageList.size() == 0) {
			System.out.println("22 :" + !imageList.isEmpty());
			model.addAttribute("imageList", imageList);
		}	
		if(fileList.size() == 0) {
			System.out.println("33 :" + !fileList.isEmpty());
			model.addAttribute("fileList", fileList);
		}
		model.addAttribute("board", board);
		return "/board/freeDetailForm";
		
	}
	
	@RequestMapping("/freeWriteForm.do")
	public void freeWriteForm() {}
	
	@RequestMapping("/up.do") 
	@ResponseBody
	public void up(HttpServletRequest request) throws Exception {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		boardService.upBoard(boardNo);
	}
	
	@RequestMapping("/down.do") 
	@ResponseBody
	public void down(HttpServletRequest request) throws Exception {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		boardService.downBoard(boardNo);
	}
	
	@RequestMapping("/freeWrite.do")
	public String freeWrite(HttpSession session,
			Board board) throws Exception{
		int i = 1;
		// 파일 처리 관련 부분
		int fileGroupNo = fileService.selectGroupNo();
		
		String upImage = servletContext.getRealPath("/upload/image");
		String upFile = servletContext.getRealPath("/upload/file");
		
		java.io.File imageDir = new java.io.File(upImage);
		if(!imageDir.exists()) imageDir.mkdirs(); 
		
		java.io.File fileDir = new java.io.File(upFile);
		if(!fileDir.exists()) fileDir.mkdirs();
		
		for (MultipartFile mf : board.getImageFiles()) {
			if(mf.isEmpty()) continue;
			
			File file = new File();
			String fileOriginName = mf.getOriginalFilename();
			int t = fileOriginName.lastIndexOf(".");
			String ext = fileOriginName.substring(t+1);
			
			String fileSystemName = UUID.randomUUID().toString()+"."+ext;
			
			file.setFileSystemName(fileSystemName);
			file.setFileOriginName(fileOriginName);
			file.setFilePath("/image");
			file.setFileGroupNo(fileGroupNo);
			
			mf.transferTo(new java.io.File(upImage+"/"+fileSystemName+"."+ext));
			
			fileService.insertFile(file);
		}
		for (MultipartFile mf : board.getAttachFiles()) {
			if(mf.isEmpty()) continue;
			
			File file = new File();
			String fileOriginName = mf.getOriginalFilename();
			
			int t = fileOriginName.lastIndexOf(".");
			String ext = fileOriginName.substring(t+1);
			String fileSystemName = UUID.randomUUID().toString()+"."+ext;
			
			file.setFileSystemName(fileSystemName);
			file.setFileOriginName(fileOriginName);
			file.setFilePath("/file");
			file.setFileGroupNo(fileGroupNo);
			mf.transferTo(new java.io.File(upFile+"/"+fileSystemName+"."+ext));
			
			fileService.insertFile(file);
		}
		Member member = (Member)session.getAttribute("user");
		int categoryNo = 1;
		String boardWriter = member.getMemberName();
		int memberNo = member.getMemberNo();
		
		board.setFileGroupNo(fileGroupNo);
		board.setCategoryNo(categoryNo);
		board.setBoardWriter(boardWriter);
		board.setMemberNo(memberNo);
		
		boardService.insertBoard(board);
		
		return "redirect:/board/free.do";
	}
}
