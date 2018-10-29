package app.models;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminRepository {

	@Autowired
	SqlSessionTemplate template;
	
	public int addAmin(Map map) {
		return template.insert("admin.addAdmin", map);
	}
	
	public Map getAdmininfo(Map map) {
		return template.selectOne("admin.getAdmininfo", map);
	}
}
