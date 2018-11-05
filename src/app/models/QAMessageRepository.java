package app.models;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.mongodb.client.result.UpdateResult;

@Repository
public class QAMessageRepository {

	@Autowired
	MongoTemplate template;

	public Map insertOne(Map map) {
		Map ret = template.insert(map, "chatlog");
		return ret;
	}

	public List<Map> getChatLog(String id1, String id2) {
		Criteria c = Criteria.where("member").all(id1,id2);
		List<Map> ret = template.find(new Query(c), Map.class, "chatlog");
		System.out.println("ret " +ret);
		return ret;
	}

	public void updateCheckMember(String room, String id) {
		Criteria c = new Criteria().where("room").in(room);

		Update u = new Update().push("log.$[].checkMember",id);
		UpdateResult rst = template.updateMulti(new Query(c), u, "chatlog");
	}

	public List<Map> getChatList(String id) {
		Criteria c = Criteria.where("member").in(id);
		List<Map> ret = template.find(new Query(c), Map.class, "chatlog");
		return ret;
	}

	public List<Map> getChatOneLog(String uuid) {
		Criteria c = new Criteria().where("id").in(uuid);
		List<Map> ret = template.find(new Query(c), Map.class, "chatlog");
		return ret;
	}
	
	public int updatelog(Map map, String room) {
		Criteria c = new Criteria().where("room").in(room);
		
		Update u = new Update().push("log", map);
		
		UpdateResult rst = template.updateMulti(new Query(c), u, "chatlog");
		return (int) rst.getModifiedCount();
	}

}
