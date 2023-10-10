package weather.joy.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


import lombok.Setter;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.MemberVO;
import weather.joy.domain.SocialVO;
import weather.joy.mapper.MemberMapper;
import weather.joy.security.domain.CustomUser;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("username : "+username);
		MemberVO vo = mapper.readMember(username);
		SocialVO so = mapper.getSocial(username, "K");
		log.warn("맵퍼에 의해 요청됨 : "+vo);
		//String password = vo.getMemPw();
		
		return vo == null? so==null? null: new CustomUser(so): new CustomUser(vo);
	}
	
	
}
