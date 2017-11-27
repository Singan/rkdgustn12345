package com.naver.board.free;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class FreeController {
	
	@RequestMapping("/free")
	public void free() {}
	
	@RequestMapping("/freeDetailForm") 
	public void freeDetailForm() {}
	
	@RequestMapping("/freeWriteForm")
	public void freeWriteForm() {}
	
}
