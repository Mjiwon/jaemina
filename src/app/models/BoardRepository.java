﻿package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {

	@Autowired
	SqlSessionTemplate template;
	
	// category ajax 용 
	public List<Map> getBigCate(){
		return template.selectList("bigcate.getBigCate");
	}
	public List<Map> getSmallCate(int bigno){
		return template.selectList("smallcate.getSmallCate", bigno);
	}
	
	// 게시판용
	public int addBoard1(Map data) {
		return template.insert("board.addBoard1", data);
	}
	
	public int addBoard2(Map data) {
		return template.insert("board.addBoard2",data);
	}
	
	public List<Map> getBoardList(){
		return template.selectList("board.getBoardList");
	}
	
	public Map getDetailBoard(int no) {
		return template.selectOne("board.getDetailBoard",no);
	}
	
	public List<Map> getSearchListByList(List<String> li) {
		return template.selectList("board.getSearchListByList", li);
	}
	
	public List<Map> getSearchListByString(String searchKey) {
		return template.selectList("board.getSearchListByString", "%"+searchKey+"%");
	}
	
	public int updateDetailBoard(Map data) {
		return template.update("board.updateDetailBoard", data);
	}
	
	public int deleteDetailBoard(int no) {
		return template.delete("board.deleteDetailBoard", no);
	}
}
