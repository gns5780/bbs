package org.spring.service;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class SliderServiceImpl implements SliderService{
	@Resource(name="sliderDir")
	private String dir;
	public void mainsliderupload(int cnt,MultipartFile file) {
		
		System.out.println(file.getOriginalFilename());
		String filename ="mainslider"+cnt+".jpg";
		System.out.println(filename);
		File savefile = new File(dir,filename);
		
		try {
			if(savefile.exists()) savefile.delete();
			file.transferTo(savefile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
