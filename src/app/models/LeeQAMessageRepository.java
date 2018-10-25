package app.models;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class LeeQAMessageRepository {
	@Autowired
	SqlSessionTemplate template;
	
	public int addMsg(Map data) {
		return template.insert("message.addMsg", data);
	}
}
