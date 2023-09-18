package weather.joy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.extern.log4j.Log4j;
import weather.joy.domain.MemberVO;
import weather.joy.domain.SocialVO;

@Log4j
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		//log.info(user);//null값만 들어옴
		//log.info(social);
		return "home";
	}

	@GetMapping("/contentType")
	public String selectPage(@RequestParam("selectedValue") String selectedValue,
			@RequestParam("reCityName") String reCityName, Model model) {
		// 선택된 데이터를 모델에 담기
		
		  //String encodedSelectedValue =
		  //UriComponentsBuilder.fromPath(selectedValue).build().encode().toUriString();
		  //String encodedReCityName =
		  //UriComponentsBuilder.fromPath(reCityName).build().encode().toUriString();
		 
		model.addAttribute("selectedValue", selectedValue);
		model.addAttribute("reCityName", reCityName);

		log.info(reCityName + " " + selectedValue);
		return "contentType"; // 결과 페이지로 리다이렉트
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied:"+auth);
		model.addAttribute("msg", "Access Denied");
	}

}
