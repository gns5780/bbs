package org.spring.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class SecurityServiceImpl implements SecurityService{
	@Resource
	private BCryptPasswordEncoder encoder;
	
	public String trans(String passwd) {
		String encoderpw = encoder.encode(passwd);
		System.out.println(encoderpw);
		
		return encoderpw;
	}
	public boolean pwcheck(String passwd,String lodpasswd) {
		System.out.println(encoder.matches(passwd,lodpasswd));
		return encoder.matches(passwd,lodpasswd);
	}
}