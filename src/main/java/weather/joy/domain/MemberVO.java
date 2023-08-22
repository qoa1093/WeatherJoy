package weather.joy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memId;
	private long memNum;
	private String username;
	private String password;
	private String addr;
	private String phone;
	private Date regdate;
	private Date updateDate;
	
	public String getId(long memNum) {
		return this.memId;
	}
}
