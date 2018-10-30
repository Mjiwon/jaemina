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
	
	public List<Map> getAccountList(){
		return template.selectList("account.getAccountList");
	}
	
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
		System.out.println("여긴와야지요 이미지 등록");
		return template.insert("account.addSeller1",map);
	}
	
	public int addSeller2(Map map) {
		System.out.println("여긴와야지요 이미지 안됨");
		return template.insert("account.addSeller2",map);
	}
	public int changeuser(Map data) {
		System.out.println("여긴와야지요");
		return template.update("account.changeuser",data);
	}
	
	public Map Myinfo(String data) {
		return template.selectOne("account.Myinfo", data);
	}
	public Map Sellerinfo(String data) {
		return template.selectOne("account.Sellerinfo", data);
	}
	
	public Map FindUser(String email) {
		return template.selectOne("account.finduser",email);
	}
	public int FindPass(Map data) {
		return template.update("account.findpass",data);
	}
}
