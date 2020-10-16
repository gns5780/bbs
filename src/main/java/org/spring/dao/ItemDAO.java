package org.spring.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.spring.dto.ItemDTO;
import org.spring.dto.PageDTO;
import org.spring.dto.SearchDTO;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAO{
	@Resource
	SqlSession session;
	public void searchcount(String findvalue){
		if(session.selectOne("ItemMapper.selectsearchcount",findvalue)==null)
			session.update("ItemMapper.insertsearchcount",findvalue);
		else 
		session.update("ItemMapper.searchcount",findvalue);
		//System.out.println("selectsearchcount :"+session.selectOne("ItemMapper.selectsearchcount",findvalue));
		
	}
	public List<SearchDTO> searchselect(){
		return session.selectList("ItemMapper.searchselect");
	}
	public void insert(ItemDTO dto) {
		session.insert("ItemMapper.insert",dto);
	}
	public void delete(int seq) {
		session.delete("ItemMapper.delete",seq);
	}
	public ItemDTO selectone(int seq) {
		return session.selectOne("ItemMapper.selectone",seq);
	}
	public void update(ItemDTO dto) {
		session.update("ItemMapper.update",dto);
	}
	public List<ItemDTO> selectall(PageDTO pdto){
		return session.selectList("ItemMapper.selectall",pdto);
	}
	public int totcount(PageDTO pdto) {
		return session.selectOne("ItemMapper.totcount",pdto);
	}
}