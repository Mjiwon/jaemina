package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminRepository {

	@Autowired
	SqlSessionTemplate template;
	
	public int addAdmin(Map data) {
		return template.insert("admin.addAdmin", data);
	}
	
	public Map getAdmininfo(Map data) {
		return template.selectOne("admin.getAdmininfo", data);
	}
	
	public Map getAdmindepart(int did) {
		return template.selectOne("admin.getAdmindepart", did);
	}
	
	public Map getAdminposition(int pid) {
		return template.selectOne("admin.getAdminposition", pid);
	}
	
	public List<Map> getAllDeparts() {
		return template.selectList("admin.getAllDeparts");
	}
	
	 public List<Map> getAllPositions() {
		return template.selectList("admin.getAllPositions");
	}
	
}
