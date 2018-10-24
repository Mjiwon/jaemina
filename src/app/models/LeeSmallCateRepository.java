package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LeeSmallCateRepository {

	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> getSmallCate(int bigno){
		return template.selectList("smallcate.getSmallCate", bigno);
	}
}
