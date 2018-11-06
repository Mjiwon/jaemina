package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyRepository {

	
	@Autowired
	SqlSessionTemplate template;
	
	
	//댓글
	public int WriteReply(Map map){
		return template.insert("reply.WriteReply",map);
	}
	
	public List<Map> ReplyLIst(int bno){		
		return template.selectList("reply.ReplyList",bno);
	}
	
	public List<Map> onlyreply(Map map){
		return template.selectList("reply.onlyreply",map);
	}
	
	public int Modify_Reply(Map data) {
		return template.update("reply.modify_reply",data);
	}
	
	public int deletereply(Map data) {
		return template.delete("reply.deletereply",data);
	}
	
	
	
}
