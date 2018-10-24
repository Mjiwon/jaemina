package app.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EunAccountRepository{

	@Autowired
	SqlSessionTemplate template;

	public int addbank(Map data) {
	 
		return template.update("account.addbank",data);
}
	
	public int addSeller1(Map map) {
		return template.insert("account.addSeller1",map);
	}
	
	public int addSeller2(Map map) {
		return template.insert("account.addSeller",map);
	}
}
