package org.spring.service;

public interface SecurityService {
	public String trans(String passwd);
	public boolean pwcheck(String passwd,String lodpasswd);
	
}
