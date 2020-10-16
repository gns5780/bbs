package org.spring.service;


import java.io.File;
import java.io.IOException;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/*
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
*/
@Service
public class FileServiceImpl implements FileService{
	@Resource(name="testDir")
	private String dir;
	//private String dir = "/bbs/resources/upload";
	
	public String filename(MultipartFile file) {
		return file.getOriginalFilename();
	}
	public int fileupload(MultipartFile file) {
		
		System.out.println(dir);
		String filename = filename(file);
		System.out.println(filename);
		
		File savefile = new File(dir,filename);
		try {
			file.transferTo(savefile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int filedelete(String file) {
		
		System.out.println(dir);
		
		File savefile = new File(dir,file);
		try {
			if(savefile.exists()) savefile.delete();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
}
