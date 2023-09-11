package weather.joy.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.SocialVO;
import weather.joy.service.MemberService;

@Log4j
@Controller
@RequestMapping("/oauth/*")
@AllArgsConstructor
public class SignController {
	
	private MemberService service;
	
	@GetMapping("/kakao")
	public String socialKaKao(String code, RedirectAttributes rttr) {
		log.info(code);
		SocialVO kakaoLogin = service.getSocialData(code);
		//new ResponseEntity<>(kakaoLogin, HttpStatus.OK);
		String user = kakaoLogin.getSoEmail();
		rttr.addFlashAttribute("user", user);
		return "redirect:/";
	}
}
