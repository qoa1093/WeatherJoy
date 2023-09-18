package weather.joy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private long rno;
	private long bno;
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;
}
