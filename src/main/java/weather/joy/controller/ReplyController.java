package weather.joy.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.Criteria;
import weather.joy.domain.ReplyPageDTO;
import weather.joy.domain.ReplyVO;
import weather.joy.service.ReplyService;

@RestController
@Log4j
@RequestMapping("/replies/")
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;
	

	//댓글리스트 조회
	@GetMapping(value="/pages/{bdNum}/{page}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("bdNum") long bdNum){
				Criteria cri = new Criteria(page, 10);
				//log.info(service.getListPage(cri, bdNum));
				return new ResponseEntity<>(service.getListPage(cri, bdNum), HttpStatus.OK);
	}
	
		@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		int insertCount = service.register(vo);
		
		return insertCount ==1?
				new ResponseEntity<>("success", HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
		/*
	//댓글조회
	@GetMapping(value="/{rno}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> get(
			@PathVariable("rno") long rno){
				return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	//댓글삭제
	@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping(value="/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody ReplyVO vo, @PathVariable("rno") long rno){
		
		return service.remove(rno) == 1?
				new ResponseEntity<>("success", HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//댓글수정
	@PreAuthorize("principal.username == #vo.replyer")
	@RequestMapping(value="/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH}, consumes= "application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("rno") long rno){
			vo.setRno(rno);
		return service.modify(vo) == 1?
				new ResponseEntity<>("success", HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
		*/	
	
	
}
