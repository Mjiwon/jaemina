package app.models;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyRepository {
	
	@Autowired
	SqlSessionTemplate template;
	
	public int addBuy(Map data) {
		return template.insert("pay.addBuy", data);
	}
}
