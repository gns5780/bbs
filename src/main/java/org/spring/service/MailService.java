package org.spring.service;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;


public interface MailService {
	public void pwfind(String sendaddress,String sendpassword)throws AddressException, MessagingException;
	public void emailCheck(String sendaddress,String keynum) throws AddressException, MessagingException;
	public void test() throws AddressException, MessagingException;
	public int leehun();
	
}
