package weather.joy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private long rno;
	private long bdNum;
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;
}
