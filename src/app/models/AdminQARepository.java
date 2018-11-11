package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminQARepository {
	@Autowired
	SqlSessionTemplate template;
	
	public int addadminQA1(Map data) {
		return template.insert("adminqa.addQA1", data);
	}
	
	public Map getadminQAinfo(int no) {
		return template.selectOne("adminqa.getadminQAinfo", no);
	}
	public List<Map> getadminQAalllist(){
		return template.selectList("adminqa.getadminQAalllist");
	}
	
	public List<Map> getadminQunreadllist(){
		return template.selectList("adminqa.getadminQunreadllist");
	}
	
	public int replyadminqa(Map data) {
		return template.update("adminqa.replyadminqa", data);
	}
	
	public List<Map> getReceiveQA(String id){
		return template.selectList("adminqa.getReceiveQA",id);
	}
	
}
