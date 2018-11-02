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
	public List<Map> getmyboard(String id){
		return template.selectList("seller.get_myboard",id);
	}
	//----------------------------------
	//Â÷Æ®
	public List<Map> yearproceeds(Map data){ 
		System.out.println(data+"repository");
		return template.selectList("seller.yearproceeds",data);
	}
	
	public List<Map> Moonproceeds(Map data){ 
		System.out.println(data+"repository");
		return template.selectList("seller.Moonproceeds",data);
	}
	public List<Map> dayproceeds(Map data){ 
		System.out.println(data+"repository");
		return template.selectList("seller.dayproceeds",data);
	}
	
	
	


}
