package weather.joy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
//import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.SocialVO;
import weather.joy.security.domain.CustomUser;
import weather.joy.service.MemberService;

@Log4j
@Controller
@RequestMapping("/oauth/*")
@AllArgsConstructor
public class SignController {
	
	private MemberService service;
	
	@GetMapping("/kakao")
	public String socialKaKao(String code, RedirectAttributes rttr,HttpServletRequest request) {
		log.info(code);
		SocialVO kakaoLogin = service.getSocialData(code);
		//new ResponseEntity<>(kakaoLogin, HttpStatus.OK);
		//OAuth2User
		String user = kakaoLogin.getSoEmail();
		if(kakaoLogin.getSoEmail() != "") {
            // 사용자 정보로 UserDetails 객체를 생성
            UserDetails userDetails = new CustomUser(kakaoLogin);

            // 스프링 시큐리티의 Authentication 객체를 생성하여 인증
            Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());

            // SecurityContext에 인증 정보를 저장
            SecurityContext securityContext = SecurityContextHolder.getContext();
            securityContext.setAuthentication(authentication);

            // HttpSession에 SecurityContext를 저장
            HttpSession session = request.getSession(true);
            session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, securityContext);
            // 로그인 성공 후 리다이렉트할 경로
            return "redirect:/";
        } else {
            // 사용자 정보가 없으면 가입 페이지로 리다이렉트
            return "redirect:/member/signin";
        }
		/*
		 * rttr.addFlashAttribute("user", user); return "redirect:/";
		 */
	}
}
