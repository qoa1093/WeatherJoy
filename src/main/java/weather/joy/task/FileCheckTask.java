package weather.joy.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import lombok.Setter;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.BoardAttachVO;
import weather.joy.mapper.BoardAttachMapper;

@Log4j
@Component
public class FileCheckTask {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardAttachMapper attachMapper;
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String str =sdf.format(cal.getTime());
		return str.replace("-", File.separator);
	}
	
	//@Scheduled(cron="0 * * * * *")// 601p
	public void checkFiles() throws Exception{
		log.warn("File check task run.........");
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get("C:\\upload", vo.getFilePath(),
						vo.getFileName()+"_"+vo.getFileOriName()))
				.collect(Collectors.toList());
		
		fileList.stream().filter(vo -> vo.getFileValid() == "T")
		.map(vo->Paths.get("C:\\upload", vo.getFilePath(), "s_"+
				vo.getFileName()+"_"+vo.getFileOriName()))
			.forEach(p-> fileListPaths.add(p));
		
		fileListPaths.forEach(p->log.warn(p));
		
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		for(File file : removeFiles) {
			file.delete();
		}
		
		
	}
}
