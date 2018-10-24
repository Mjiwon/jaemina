package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LeeBigCateRepository {

	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> getBigCate(){
		return template.selectList("bigcate.getBigCate");
	}
}
