package weather.joy.domain;

import lombok.Data;

@Data
public class BoardAttachVO {
	private String fileName;
	private String filePath;
	private String fileOriName;
	private String fileValid;
	private String fileThValid;
	
	private long bdNum;
}
