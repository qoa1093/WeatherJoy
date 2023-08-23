package weather.joy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private long bdNum;
	private long memNum;
	private long opBdNum;
	private String bdTitle;
	private String bdContent;
	private String writer;
	private long bdView;
	private String bdValid;
	private String bdRegion;
	private Date bdRegdate;
	private Date bdDate;
	
	public String getWriter() {
		
		writer = new MemberVO().getId(opBdNum);
		return writer;
	}
	
	
}
