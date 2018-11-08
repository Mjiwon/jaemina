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
	
	public List<Map> getMysellList(String seller) {
		return template.selectList("pay.getMysellList", seller);
	}
}
