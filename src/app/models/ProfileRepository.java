package app.models;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileRepository {

	@Autowired
	SqlSessionTemplate template;
	
		
		public Map Sellerinfo(String data) {
			return template.selectOne("profile.Sellerinfo", data);
		}
		
		public int addSeller1(Map map) {
			return template.insert("profile.addSeller1",map);
		}
		
		public int addSeller2(Map map) {
			return template.insert("profile.addSeller2",map);
		}

	
	public int updateProfileBank(Map map) {
		return template.update("profile.updateProfileBank", map);
	}
	
	public int updateProfile(Map map) {
		return template.update("profile.updateProfileBank", map);
	}
}
