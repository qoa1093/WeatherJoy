package weather.joy.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.BoardAttachVO;
import weather.joy.domain.BoardVO;
import weather.joy.domain.Criteria;
import weather.joy.domain.PageDTO;
import weather.joy.service.BoardService;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	
	/*@GetMapping("/reviewlist")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", "list");
		
	}*/
	//여기서부터 풀기
	@GetMapping("/reviewlist")
	public void list(Model model, Criteria cri) {
		log.info("list" + cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total : "+ total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	/*
	//어노테이션 라이브러리내에 존재
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerGet() {
		
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		
		if(board.getAttachList() !=null) { board.getAttachList().forEach(attach->log.info(attach));}
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBdNum());
		
		return "redirect:/board/reviewlist";
		
	}
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri ,RedirectAttributes rttr) {
		log.info("modify : " + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") long bno,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("remove...."+bno);
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)==1) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/reviewlist"+cri.getListLink();
	}
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") long bno, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAtttachList(Long bno){
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
	
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null|| attachList.size()==0) {
			return;
		}
		
		attachList.forEach(attach->{
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getFilePath()+"\\"
									+attach.getFileName()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbnail = Paths.get("C:\\upload\\"+attach.getFilePath()+"\\s_"+attach.getFileName()+"_"+attach.getFileOriName());
					Files.delete(thumbnail);
				}
				
			}catch(Exception e) {
				e.getMessage();
				
			}//end catch
		});//end foreach
	}*/
}
