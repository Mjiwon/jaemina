package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerRepository {

	@Autowired
	SqlSessionTemplate template;

	/*public int addSeller(Map map) {

		return template.insert("seller.addSeller", map);
	}*/

	
	
	public Map getSeller(String id) {
		return template.selectOne("seller.getSeller", id);
	}

	public List<Map> dayproceeds(Map data){ 
		return template.selectList("seller.dayprices",data);
	}
	
	public List<Map> Moonprices(Map data){ 
		return template.selectList("seller.Moonprices",data);
	}
	
	//----------------------------------
	//��Ʈ
	public List<Map> yearprices(Map data){ 
		return template.selectList("seller.yearprices",data);
	}
	
	
	
	public int updateSeller1(Map map) {
		return template.update("seller.updateSeller1",map);
	}
	
	public int updateSeller2(Map map) {
		return template.update("seller.updateSeller2",map);
	}
	
	
	
	public String myboardcount(String id) {
		return template.selectOne("seller.myboardcount",id);
	}
	public String wishcount(String id) {
		return template.selectOne("seller.wishcount",id);
	}
	
	public String staravg(String id) {
		return template.selectOne("seller.staravg",id);
	}
	
	



}
