package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayRepository {

	@Autowired
	SqlSessionTemplate template;

	// 구매
	public List<Map> getMybuyList(String buyer) {
		return template.selectList("pay.getMybuyList", buyer);
	}

	public Map getMybuyno(Map data) {
		return template.selectOne("pay.getMybuyno", data);
	}

	public int updateBuying(Map data) {
		return template.update("pay.updateBuying", data);
	}

	// 판매
	public List<Map> getMysellList(String seller) {
		return template.selectList("pay.getMysellList", seller);
	}

	public Map getMysellno(Map data) {
		return template.selectOne("pay.getMysellno", data);
	}

	public int updateSelling(Map data) {
		return template.update("pay.updateSelling", data);
	}
	
	public int refundend(Map data) {
		return template.update("pay.refundend", data);
	}
	
	// 관리자 판매완료 리스트 가져오기
	public List<Map> payendlist(){
		return template.selectList("pay.payendlist");
	}
	// 관리자 환불 리스트 가져오기
	public List<Map> refundendlist(){
		return template.selectList("pay.refundendlist");
	}
	// 관리자 취소 리스트 가져오기
	public List<Map> cancelpaylist(){
		return template.selectList("pay.cancelpaylist");
	}
}
