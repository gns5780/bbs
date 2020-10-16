package org.spring.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.spring.dto.UserDTO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Resource
	private SqlSession session;
	public String selectpw(String id) {
		System.out.println((String)session.selectOne("UserMapper.selectpw",id));
		return session.selectOne("UserMapper.selectpw",id);
	}
	public List<String> selectid(String phonenum){
		return session.selectList("UserMapper.selectid",phonenum);
	}
	public int selectone(String id) {
		return session.selectOne("UserMapper.selectone",id);
	}
	public void insert(UserDTO dto) {
		session.insert("UserMapper.insert",dto);
	}
	public UserDTO selectmy(String id) {
		return session.selectOne("UserMapper.selectmy",id);
	}
	public void deletemy(String id) {
		session.delete("UserMapper.deleteboardmy",id);
		session.delete("UserMapper.deletemy",id);
	}
	public int updatemy(UserDTO dto) {
		return session.update("UserMapper.updatemy",dto);
	}
	public List<UserDTO> selectall(){
		return session.selectList("UserMapper.selectall");
	}
	
}
