package weather.joy.controller;

import java.util.List;

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
import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;
import weather.joy.domain.PageDTO;
import weather.joy.service.MemberService;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	 private MemberService service;

	/*
	 * @GetMapping("/list") public void list(Model model, Criteria cri) {
	 * log.info("list"); model.addAttribute("list", service.getList(cri)); int total
	 * = service.getTotal(cri); log.info("total : "+ total);
	 * model.addAttribute("pageMaker", new PageDTO(cri, total));
	 * 
	 * }
	 * 
	 * @GetMapping("/register") public void registerGet() {
	 * 
	 * }
	 * 
	 * 
	 * 
	 * @PostMapping("/modify") public String modify(UserVO
	 * user, @ModelAttribute("cri") Criteria cri ,RedirectAttributes rttr) {
	 * log.info("modify : " + user); if(service.modify(user)==1) {
	 * rttr.addFlashAttribute("result", user.getUserid()); }
	 * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
	 * cri.getAmount()); rttr.addAttribute("type", cri.getType());
	 * rttr.addAttribute("keyword", cri.getKeyword()); return "redirect:/user/list";
	 * }
	 * 
	 * @PostMapping("/remove") public String remove(@RequestParam("userid") String
	 * userid,@ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
	 * log.info("remove...."+userid); if(service.delete(userid)==1) {
	 * rttr.addFlashAttribute("result","success"); } rttr.addAttribute("pageNum",
	 * cri.getPageNum()); rttr.addAttribute("amount", cri.getAmount());
	 * rttr.addAttribute("type", cri.getType()); rttr.addAttribute("keyword",
	 * cri.getKeyword()); return "redirect:/user/list"; }
	 * 
	 * @GetMapping({"/get","/modify"}) public void get(@RequestParam("userid")
	 * String userid, @ModelAttribute("cri")Criteria cri,Model model) {
	 * log.info("/get or modify"); model.addAttribute("user",
	 * service.getRead(userid)); }
	 */
	@GetMapping("/signup")
	public void signupGet(Model model) throws Exception{
		List<MemberVO> userList = service.getUserList();
		//log.info(userList);
		model.addAttribute("List", userList);
		// mv.addAttribute("title", "회원가입");
		//log.info("회원가입창 출력");
	}

	@GetMapping("/signin")
	public void signinGet() {
	
	}

	@PostMapping("/signup")
	public String signupPost(MemberVO user/* ,RedirectAttributes rttr */) {
		if(user==null) return "redirect:/member/signup";
		log.info("유저:"+user);
		//log.info("찍혀라~~~");
		//service.register(user);
		//rttr.addFlashAttribute("result", user.getMemId());
		
		
		return "redirect:/"/* "home" */;
		
	}
	@PostMapping("/signin")
	public String signinPost(MemberVO user) {
		log.info("유저:"+user);
		if(user.getMemId()==""|user.getMemPw()=="") return "redirect:/member/signin";
		
		//service.(user);
				
		return "redirect:/";
		
	}
	@ResponseBody
	@PostMapping(value="/idCheck")
	public String idCheck(String memId) {
		return service.getMemId(memId) != null ? "FAIL" : "OK";
	}
	
}
