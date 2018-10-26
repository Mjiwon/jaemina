package app.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HoSellerRepository {

	@Autowired
	SqlSessionTemplate template;

	public Map getSeller(String id) {
		return template.selectOne("seller.getSeller", id);
	}

	public int addSeller(Map map) {

		return template.insert("seller.addSeller", map);
	}
	
	public int updateSeller1(Map map) {
		return template.update("seller.updateSeller1",map);
	}
	
	public int updateSeller2(Map map) {
		return template.update("seller.updateSeller2",map);
	}


}
