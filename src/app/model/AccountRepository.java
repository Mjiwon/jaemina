package app.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountRepository {

	@Autowired
	SqlSessionTemplate template;
	
	public Map getAccount(Map map) {
		return template.selectOne("account.getAccount", map);
	}
	
	public int addUser(Map map) {
		return template.insert("account.addUser", map);
	}
	
	public Map getAccountById(String id) {
		return template.selectOne("account.getAccountById", id);
	}
	
	public Map getAccountByEmail(String email) {
		return template.selectOne("account.getAccountByEmail", email);
	}
}
