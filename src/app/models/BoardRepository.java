package app.models;

import java.math.BigDecimal;
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
	
	
	public Integer getDetailAvg(int no) {
		Map st = template.selectOne("board.getDetailAvg",no);
		if(st!=null) {
			return (Integer)st.get("S");			
		}else {
			return 0;
		}
	}
	
	
	
	public List<Map> getmyboard(String id){
		return template.selectList("board.get_myboard",id);
	}
	
	// 카테고리에 맞는 ㄱㅔ시글 불러오기
	public List<Map> getCateBoard(int bigcate){
		return template.selectList("board.getCateBoard",bigcate);
	}
	
	public List<Map> getSearchListByList(List<String> li) {
		return template.selectList("board.getSearchListByList", li);
	}
	
	public List<Map> getSearchListByMap(Map map) {
		return template.selectList("board.getSearchListByMap", map);
	}
	
	
	// 인덱스에서 사용할 것 (게시판 총갯수 불러오기 )
	public int boardCount() {
		return template.selectOne("board.boardCount");
	}
	
	public List<Map> getRankCate(){
		return template.selectList("board.RankCate");
	}
	
	public List<Map> getRankBoard(int bigcate){
		
		return template.selectList("board.RankBoard",bigcate);
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
	
	
	
	public int updateDetailBoard1(Map data) {
		return template.update("board.updateDetailBoard1", data);
	}
	
	public int updateDetailBoard2(Map data) {
		return template.update("board.updateDetailBoard2", data);
	}
	
	public int updateDetailBoard3(Map data) {
		return template.update("board.updateDetailBoard3", data);
	}
	
	public int updateDetailBoard4(Map data) {
		return template.update("board.updateDetailBoard4", data);
	}
	
	public int addBoardsearchcount(int no) {
		return template.update("board.addBoardsearchcount", no);
	}
	
	public int deleteDetailBoard(int no) {
		return template.delete("board.deleteDetailBoard", no);
	}
	
	
	
	
	
	
	
	
	
	
	


		
	
}
