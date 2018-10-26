package app.models;

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
	
	public int addbank(Map data) {
		 
		return template.update("account.addbank",data);
	}	
	
	public int addSeller1(Map map) {
		return template.insert("account.addSeller1",map);
	}
	
	public int addSeller2(Map map) {
		return template.insert("account.addSeller2",map);
	}
}
