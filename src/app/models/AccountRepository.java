package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountRepository {

	@Autowired
	SqlSessionTemplate template;
	
	
	// insert
	public int addUser(Map map) {
		return template.insert("account.addUser", map);
	}
	
	
	// select
	public List<Map> getAccountList(){
		return template.selectList("account.getAccountList");
	}
	
	public Map Myinfo(String data) {
		return template.selectOne("account.Myinfo", data);
	}
	
	public Map getAccount(Map map) {
		return template.selectOne("account.getAccount", map);
	}
	
	public Map FindUser(String email) {
		return template.selectOne("account.finduser",email);
	}
	
	public Map getAccountById(String id) {
		return template.selectOne("account.getAccountById", id);
	}
	
	public Map getAccountByEmail(String email) {
		return template.selectOne("account.getAccountByEmail", email);
	}
	
	public List<Map> getSellerpermitlist(){
		return template.selectList("account.getSellerpermitlist");
	}
	
	
	// update
	public int FindPass(Map data) {
		return template.update("account.findpass",data);
	}
	
	public int changeuser(Map data) {
		System.out.println("여긴와야지요");
		return template.update("account.changeuser",data);
	}
	
	public int addbank(Map data) {
		 
		return template.update("account.addbank",data);
	}
	
	public int permitSeller(String id) {
		return template.update("account.permitSeller", id);
	}
	
	// delete
	
	public int deleteUser(String id) {
		return template.delete("account.deleteUser", id);
	}
	
	
	
}
