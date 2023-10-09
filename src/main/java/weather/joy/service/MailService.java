package weather.joy.service;

import java.security.SecureRandom;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import weather.joy.mapper.MemberMapper;

@Service
public class MailService {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private JavaMailSender mailSender;
	// JavaMailSender라는 타입의 값을 Container에서 자동으로 찾아서 의존성 주입

	private String authPw;
	// 인증 번호 
	
	//비밀번호 작성
	public String getRamdomPassword(int size) {
        char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&' };

        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<size; i++) {
            // idx = (int) (len * Math.random());
            idx = sr.nextInt(len);    // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
            sb.append(charSet[idx]);
        }

        return sb.toString();
    }
	// 회원 가입 시 사용할 이메일 양식 
	public String pwEmail(String email) {
		authPw = getRamdomPassword(10);
		
		String setFrom = "ccchhhaaa113@naver.com";
		// email-config에서 입력한 이메일 주소 
		// 보내는 이메일 주소 
		
		String toMail = email;
		// 수신받을 이메일 
		
		String title = "날씨조이 비밀번호 안내 이메일 입니다.";
		String content = ""+
						 "<br><br>" +
						 "임시 비밀번호는 " + authPw + "입니다." + 
						 "<br>" +
						 
						 "해당 임시 비밀번호로 로그인 뒤 비밀번호를 바꿔주세요.";
						// 이메일 내용 
		
		
		//return mailSend(setFrom, toMail, title, content) == true? "Success":"Fail";
		
		if (mailSend(setFrom, email, title, content)) {
			//여기서 디비 비밀번호를 바꿔줘야 함. 업데이트 구문 생성하기.
			mapper.updatePw(pwencoder.encode(authPw), email);
            return authPw;
        } else {
            return null;
        }
	}
	
	// 이메일 전송 메서드 
	public boolean mailSend(String setFrom, String toMail, String title, String content) {
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			
			helper.setText(content, true);
			// true를 해야 html 형식으로 전송 
			
			mailSender.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
		
	}
}
