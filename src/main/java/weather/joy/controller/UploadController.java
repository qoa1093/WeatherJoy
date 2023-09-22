package weather.joy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import weather.joy.domain.AttachFileDTO;


@Log4j
@Controller
public class UploadController {

		String uploadFolder = "C:\\upload";
		@GetMapping("/uploadForm")
		public void uploadForm() {
			log.info("uploadForm");
		}
		
		@PostMapping("/uploadFormAction")
		public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
			for(MultipartFile file : uploadFile) {
				log.info(file.getOriginalFilename());
				log.info(file.getSize());
				
				File saveFile = new File(uploadFolder, file.getOriginalFilename());
				
				try {
					file.transferTo(saveFile);
				}catch(Exception e){
					log.error(e);
				}//end catch
			}//end for
		}
		
		//ajax를 이용한 파일 업로드
		
		@GetMapping("/uploadAjax")
		public void uploadAjax() {
			log.info("uploadajax");
		}
		@PreAuthorize("isAuthenticated()")
		@PostMapping(value= "/uploadAjaxAction",produces = MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
			
			List<AttachFileDTO> list = new ArrayList<AttachFileDTO>();
			//make folder
			File uploadPath = new File(uploadFolder, getFolder());
			
			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			for(MultipartFile file : uploadFile) {
				log.info(file.getOriginalFilename());
				log.info(file.getSize());
				AttachFileDTO attachDTO = new AttachFileDTO();
				attachDTO.setFileName(file.getOriginalFilename());
				UUID uuid = UUID.randomUUID();
				
				
				String uploadFileName = uuid.toString()+"_"+file.getOriginalFilename();
				
				
				try {
					File saveFile = new File(uploadPath, uploadFileName);
					file.transferTo(saveFile);
					
					attachDTO.setUuid(uuid.toString());
					attachDTO.setUploadPath(getFolder());
					
					if(checkImageType(saveFile)) {
						attachDTO.setImage(true);
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
						Thumbnailator.createThumbnail(file.getInputStream(), thumbnail, 100,100);
						thumbnail.close();
					}
					list.add(attachDTO);
				}catch(Exception e){
					log.error(e.getMessage());
				}//end catch
			}//end for
			return new ResponseEntity<>(list, HttpStatus.OK);
		}
		
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date = new Date();
			
			String str = sdf.format(date);
			
			return str.replace("-", File.separator);
		}
		private boolean checkImageType(File file) {
			try {
				String contentType = Files.probeContentType(file.toPath());
				return contentType.startsWith("image");
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return false;
		}
		
		@GetMapping("/display")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName){
			log.info("filename:"+fileName);
			File file = new File("C:\\upload\\"+fileName);
			log.info("file"+file);
			ResponseEntity<byte[]> result = null;
			
			try {
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
						header, HttpStatus.OK);
				
			}catch(IOException e) {
				e.printStackTrace();
			}
			return result;
			
		}
		
		@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
		@ResponseBody
		public ResponseEntity<Resource> downloadFile(String fileName){
			log.info("downloadfilename:"+fileName);
			Resource resource = new FileSystemResource("c:\\upload\\"+fileName);
			log.info("resource:"+resource);
			  String resourceName = resource.getFilename(); 
			  //remove UUID
			  String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
			 
			  
			  HttpHeaders headers = new  HttpHeaders(); 
			  try { 
				  headers.add("Content-Disposition",
						  	"attachment; filename=" 
						  	+new String(resourceOriginalName.getBytes("UTF-8"),
						  	"ISO-8859-1"));
			  
			  }catch(UnsupportedEncodingException e) { 
				  e.printStackTrace(); 
			  } 
			  return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
			 
			
		}
		@PreAuthorize("isAuthenticated()")
		@PostMapping("/deleteFile")
		@ResponseBody
		public ResponseEntity<String> deleteFile(String fileName, String type){
			File file;
			try{
				file = new File("C:\\upload\\"+URLDecoder.decode(fileName, "UTF-8"));
				file.delete();
				if(type.equals("image")) {
					String largeFileName = file.getAbsolutePath().replace("s_", "");
					file = new File(largeFileName);
					file.delete();
				}
				
			}catch(UnsupportedEncodingException e) {
				e.printStackTrace();
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<String>("deleted",HttpStatus.OK);
		}
		
}

