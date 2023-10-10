package weather.joy.domain;

import java.util.List;

import lombok.Data;

@Data
public class SocialVO {
	String soId;
	long memNum;
	String soEmail;
	String soToken;
	String snsType;
	
	private List<AuthVO> authList;
	
}
