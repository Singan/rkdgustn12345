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
	
	@RequestMapping("/{boardNo}/freeDelete.do")
	public String freeDelete(@PathVariable int boardNo) throws Exception {
		boardService.deleteBoard(boardNo);
		
		return "redirect:/board/free.do";
	}
	
	@RequestMapping("/free.do")
	public String free(Model model) throws Exception{
		model.addAttribute("list",boardService.selectBoard(1));
		return "/board/freeMain";
	}
	
	@RequestMapping("/{boardNo}/freeDetail.do") 
	public String freeDetailForm(Model model, 
			@PathVariable int boardNo) throws Exception{
		
		boardService.viewUpBoard(boardNo);

		List<Comment> commentList = commentService.selectComment((int)boardNo);

		Board board = boardService.detailBoard((int)boardNo);
		int fileGroupNo = board.getFileGroupNo();

		List<File> list = fileService.selectFileList(fileGroupNo);
		List<File> imageList = new ArrayList<>();
		List<File> fileList = new ArrayList<>();
		
		Iterator<File> it = list.iterator();

		while(it.hasNext()) {
			File file  = it.next();
			String cate = file.getFilePath();   // /image, /file
			String path = file.getFileSystemName();  // uuid.ext
			
			if(cate.equals("/image")) {
				imageList.add(file);
			}
			else if(cate.equals("/file")) {
				fileList.add(file);
			}
		}
		
		if(!commentList.isEmpty()) {
			model.addAttribute("commentList", commentList);
		}
		if(!imageList.isEmpty()) {
			model.addAttribute("imageList", imageList);
		}	
		if(!fileList.isEmpty()) {
			model.addAttribute("fileList", fileList);
		}
		
		model.addAttribute("board", board);
		model.addAttribute("imageList", imageList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("commentList",commentList);
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
	public String freeWrite(HttpSession session, Model model,
			Board board) throws Exception{
		int i = 1;
		// 파일 처리 관련 부분
		int fileGroupNo = fileService.selectGroupNo();
		
//		String upImage = servletContext.getRealPath("/upload/image");
//		System.out.println(upImage);
//		String upFile = servletContext.getRealPath("/upload/file");
		// 프로젝트
		
		String root = "C:/kang/upload";
		String imagePath = "/image";
		String upImage = root+imagePath;
		
		String filePath = "/file";
		String upFile = root + filePath;
		
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
			
			String imageRealPath = upImage+"/"+fileSystemName;
			mf.transferTo(new java.io.File(imageRealPath));
			
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

			String fileRealPath = upFile+"/"+fileSystemName;
			mf.transferTo(new java.io.File(fileRealPath));
			
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
