package weather.joy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memId;
	private long memNum;
	private String memName;
	private String memPw;
	private int memAge;
	private String memPhone;
	private String memAddr;
	private String memHobby;
	private String memAValid;
	private Date memDate;
	
	public String getId(long memNum) {
		return this.memId;
	}
}
