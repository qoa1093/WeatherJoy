package weather.joy.security.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;


import lombok.Getter;
import weather.joy.domain.MemberVO;

@Getter
public class CustomUser extends User{

	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	public CustomUser(String username, String password,
							Collection<? extends GrantedAuthority> authorities) {
		super(username, password,authorities);
		
		
	}
	public CustomUser(MemberVO vo) {
		super(vo.getMemId(),vo.getMemPw(),new ArrayList<>());
		this.member = vo;
	}
}
