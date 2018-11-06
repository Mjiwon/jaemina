package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishlistRepository {

	@Autowired
	SqlSessionTemplate template;
	
	
	// 위시리스트 추가
	public int addWishlist(Map map) {
		return template.insert("wishlist.addWishlist", map);
	}
	
	// 위시리스트 가져오기
	public List<Map> getWishlist(String buyer) {
		return template.selectList("wishlist.getWishlist", buyer);
	}
	
	public int deleteWishList(Map map) {
		return template.delete("wishlist.deleteWishList", map);
	}
	
}
