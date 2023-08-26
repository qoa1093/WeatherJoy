package weather.joy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.Criteria;
import weather.joy.domain.PageDTO;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	//private UserService service;
	
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
	 * @PostMapping("/register") public String register(UserVO user,
	 * RedirectAttributes rttr) { log.info("register : " + user);
	 * service.register(user); rttr.addFlashAttribute("result", user.getUserid());
	 * 
	 * return "redirect:/user/list";
	 * 
	 * }
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
	public void signupGet(){
		//mv.addAttribute("title", "회원가입");
	    
	}
}
