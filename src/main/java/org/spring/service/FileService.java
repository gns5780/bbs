package org.spring.service;

import org.springframework.web.multipart.MultipartFile;


public interface FileService {
	
	public String filename(MultipartFile file);
	public int fileupload(MultipartFile file);
	public int filedelete(String file);
}
