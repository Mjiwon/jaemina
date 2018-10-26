package app.models;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QAMessageRepository {
	@Autowired
	SqlSessionTemplate template;
	
	public int addMsg(Map data) {
		return template.insert("message.addMsg", data);
	}
}
