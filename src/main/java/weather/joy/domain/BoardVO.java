package weather.joy.domain;

import java.util.Date;
import java.util.List;

import weather.joy.domain.BoardAttachVO;

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
	private int opStar; 
	
	/*
	 * public String getWriter() {
	 * 
	 * writer = new MemberVO().getId(opBdNum); return writer; }
	 */
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
	
}
