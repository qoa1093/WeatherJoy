package weather.joy.security.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;


import lombok.Getter;
import weather.joy.domain.MemberVO;
import weather.joy.domain.SocialVO;

@Getter
public class CustomUser extends User{

	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	private SocialVO social;
	
	public CustomUser(String username, String password,
							Collection<? extends GrantedAuthority> authorities) {
		super(username, password,authorities);
		
		
	}
	public CustomUser(MemberVO vo) {
		super(vo.getMemId(),vo.getMemPw(),vo.getAuthList().stream().map(auth->
					new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.member = vo;
	}
	public CustomUser(SocialVO vo) {
		super(vo.getSoEmail(),vo.getSoId(),Arrays.asList(new SimpleGrantedAuthority("social")));
		this.social = vo;
	}
}
