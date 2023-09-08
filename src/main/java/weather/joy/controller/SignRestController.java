package weather.joy.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.SocialVO;
import weather.joy.service.MemberService;

@Log4j
@RestController
@RequestMapping("/oauth/*")
@AllArgsConstructor
public class SignRestController {
	
	private MemberService service;
	
	@GetMapping("/kakao")
	public SocialVO socialKaKao(String code) {
		log.info(code);
		SocialVO kakaoLogin = service.getSocialData(code);
		return kakaoLogin;
	}
}
