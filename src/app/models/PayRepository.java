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

	public Map getMysellno(int postno) {
		return template.selectOne("pay.getMysellno", postno);
	}

	public int updateSelling(Map data) {
		return template.update("pay.updateSelling", data);
	}

}
