package weather.joy.domain;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import weather.joy.domain.AuthVO;

import lombok.Data;

@Data
public class MemberVO {
	private long memNum;//
	private String memId;
	private String memName;
	private String memPw;
	private int memAge;
	private String memPhone;
	private String memAddr;
	private String memHobby;
	private String memAValid;
	private Date memDate;//
	private String username;
	private String memValid;
	private String memEmail;
	
	private List<AuthVO> authList;
	
	
	  public String getId(long memNum) { return this.memId; }
	 
}
