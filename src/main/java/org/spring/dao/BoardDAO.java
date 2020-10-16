package org.spring.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.spring.dto.BoardDTO;
import org.spring.dto.PageDTO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO{
	@Resource
	SqlSession session;
	
	public int insert(BoardDTO dto) {
		return session.insert("boardMapper.insert",dto);
	}
	public void replyinsert(BoardDTO dto) {
		session.update("boardMapper.replycheck",dto.getRef());
		session.insert("boardMapper.replyinsert",dto);
	}
	public int totCount(PageDTO dto) {
		return session.selectOne("boardMapper.totcount",dto);
	}
	public List<BoardDTO> selectall(PageDTO dto){
		return session.selectList("boardMapper.selectall",dto);
	}
	public List<BoardDTO> selectallread(PageDTO dto){
		return session.selectList("boardMapper.selectallread",dto);
	}
	public BoardDTO selectone(int num) {
		session.update("boardMapper.countup",num);
		return session.selectOne("boardMapper.selectone",num);
	}
	public BoardDTO selectonereply(int num) {
		return session.selectOne("boardMapper.selectonereply",num);
	}public void delete(int num) {
		session.delete("boardMapper.delete",num);
		session.delete("boardMapper.replydelete",num);
	}
	public void replydelete(int num) {
		session.delete("boardMapper.replydelete",num);
		session.update("boardMapper.deletereplycheck",num);
	}
}