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
	
	public Map getCate(Map cates) {
		return template.selectOne("board.getCate",cates);
	}
	
	// 인덱스에서 사용할 것 (게시판 총갯수 불러오기 )
	public int boardCount() {
		return template.selectOne("board.boardCount");
	}
	
	// 카테고리에 맞는 ㄱㅔ시글 불러오기
	public List<Map> getCateBoard(int bigcate){
		return template.selectList("board.getCateBoard",bigcate);
	}
	

	public List<Map> getBigCateListForPasing(Map map){
		return template.selectList("board.getbigcatelistforpaging",map);
	}
	
	public List<Map> getSmallCateBoard(Map map){
		return template.selectList("board.getsmallcatelist",map);
	}
	
	public List<Map> getSmallCateListForPasing(Map map){
		return template.selectList("board.getsmallcatelistforpaging",map);
	}

	// 방번호 가져오기
	public Integer getSequenceVal() {
		Integer i = template.selectOne("board.getSequenceVal");
		return i;
	}

	
	//댓글
		public int WriteReply(Map map){
			return template.insert("board.WriteReply",map);
		}
		public List<Map> ReplyLIst(int bno){
			
			return template.selectList("board.ReplyList",bno);
		}
		public List<Map> onlyreply(Map map){
			return template.selectList("board.onlyreply",map);
		}
		public int Modify_Reply(Map data) {
			return template.update("board.modify_reply",data);
		}
		public int deletereply(Map data) {
			return template.delete("board.deletereply",data);
		}
	// 위시리스트 추가
	public int addWishlist(Map map) {
		return template.insert("board.addWishlist", map);
	}
	
	// 위시리스트 가져오기
	public List<Map> getWishlist(String buyer) {
		return template.selectList("board.getWishlist", buyer);
	}
	
	public List<Map> getBoardListBySeller(String writer) {
		return template.selectList("board.getBoardListBySeller", writer);
	}
	
	public int deleteWishList(Map map) {
		return template.delete("board.deleteWishList", map);
	}
	 

}
