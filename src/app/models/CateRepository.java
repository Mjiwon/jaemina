package app.models;

import java.util.List;
import java.util.Map;

import javax.xml.transform.Templates;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CateRepository {

	@Autowired
	SqlSessionTemplate template;
	
	// category ajax 용 
		public List<Map> getBigCate(){
			return template.selectList("cate.getBigCate");
		}
		public List<Map> getSmallCate(int bigno){
			return template.selectList("cate.getSmallCate", bigno);
		}
		
		public Map getCate(Map cates) {
			return template.selectOne("cate.getCate",cates);
		}
		
		public List<Map> getSmallcateAllList(){
			return template.selectList("cate.getSmallcateAllList");
		}
		

}
