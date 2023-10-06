package weather.joy.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
	public String signupPost(MemberVO user) {
		if(user==null) return "redirect:/member/signup";
		log.info("유저:"+user);
		String memId = service.register(user);
		
			
		return "redirect:/"/* "home" */;
		
	}
	/*
	 * @PostMapping("/signin") public String signinPost(MemberVO user,
	 * RedirectAttributes rttr) { log.info("유저:"+user);
	 * user.setMemId(user.getUsername());
	 * if(user.getMemId().equals("")||user.getMemPw().equals("")) return
	 * "redirect:/member/signin"; log.info("아이디가 넘어오나요?:"+user.getMemId());
	 * //MemberVO member =service.signIn(user); rttr.addFlashAttribute("user",
	 * user.getMemId()); return "redirect:/";
	 * 
	 * }
	 */
	//a태그를 사용했기 때문에 post방식 대신 get으로 처리함
	@GetMapping("/signout")
	public String signupOut(HttpServletRequest request, HttpServletResponse response) {
		log.info("로그아웃~~~~~");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication != null) {
	        new SecurityContextLogoutHandler().logout(request, response, authentication);
	    }	
		return "redirect:/"/* "home" */;
		
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(String memId)throws Exception{
		//log.info("아이디 : "+memId);
		return service.getMemId(memId) == null ? "OK":"FAIL";
	}
	@PreAuthorize("principal.username == #memId")
	@GetMapping({"/mypage","/modify"})
	public void mypageGet(Model model, @RequestParam("memId")String memId) {
		MemberVO member = service.getRead(memId);
		log.info("멤버 ----"+member);
		model.addAttribute("member", member);
	}
	
	@PostMapping("/modify")
	public String modifyGet(Model model, MemberVO member) {
		log.info(member);
		service.modify(member);
		model.addAttribute("memId", member.getMemId());
		return "redirect:/member/mypage";
		
	
	}
}
