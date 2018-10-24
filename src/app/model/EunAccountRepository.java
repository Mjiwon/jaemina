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
}