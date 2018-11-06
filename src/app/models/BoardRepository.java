package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {

	@Autowired
	SqlSessionTemplate template;
	
	
	
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
	
	public List<Map> getmyboard(String id){
		return template.selectList("board.get_myboard",id);
	}
	

	// 카테고리에 맞는 ㄱㅔ시글 불러오기
	public List<Map> getCateBoard(int bigcate){
		return template.selectList("board.getCateBoard",bigcate);
	}
	
	
	public List<Map> getSearchListByString(String searchKey) {
		return template.selectList("board.getSearchListByString", "%"+searchKey+"%");
	}
	
	public List<Map> getSearchListByList(List<String> li) {
		return template.selectList("board.getSearchListByList", li);
	}
	
	
	// 인덱스에서 사용할 것 (게시판 총갯수 불러오기 )
	public int boardCount() {
		return template.selectOne("board.boardCount");
	}
	
	
	
	// 방번호 가져오기
	public Integer getSequenceVal() {
		Integer i = template.selectOne("board.getSequenceVal");
		return i;
	}
	
	
	public List<Map> getBoardListBySeller(String writer) {
		return template.selectList("board.getBoardListBySeller", writer);
	}
	
	public List<Map> getSmallCateBoard(Map map){
		return template.selectList("board.getsmallcatelist",map);
	}
	
	
	
	// paging
	public List<Map> getBigCateListForPasing(Map map){
		return template.selectList("board.getbigcatelistforpaging",map);
	}
	
	public List<Map> getSmallCateListForPasing(Map map){
		return template.selectList("board.getsmallcatelistforpaging",map);
	}
	
	public List<Map> getBoardListBySellerForPasing(Map map) {
		return template.selectList("board.getBoardListBySellerForPasing", map);
	}
	
	

	public int updateDetailBoard(Map data) {
		return template.update("board.updateDetailBoard", data);
	}
	
	public int deleteDetailBoard(int no) {
		return template.delete("board.deleteDetailBoard", no);
	}
	
	
	
	
	
	
	
	
	
	
	


		
	
}
