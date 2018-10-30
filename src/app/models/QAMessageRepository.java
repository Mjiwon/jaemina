package app.models;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class QAMessageRepository {

	@Autowired
	MongoTemplate template;
	
	public Map insertOne(Map map) {
		Map ret = template.insert(map,"chatlog");
		return ret;
	}
	
	public List<Map> getChatLog(String id1, String id2) {
		Criteria c = Criteria.where("member").in(id1).andOperator(Criteria.where("member").in(id2));
		List<Map> ret = template.find(new Query(c),Map.class,"chatlog");
		return ret;
	}
}
