package web;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("SeesunguideDAO")
public class SeesunguideDAO extends EgovComAbstractDAO {
	public List<?> selectList(SeesunguideVO vo, String deptCd) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("deptCd", deptCd);
		return selectList("SeesunguideDAO.selectList", map); // 문자열을 받아서 리스트를 반환
	}

	public List<?> searchList(SeesunguideVO vo, String lv1, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("lv1", lv1);
		map.put("keyword", keyword);
		return selectList("SeesunguideDAO.searchList", map); // 문자열을 받아서 리스트를 반환
	}

	public List<?> sampleBodyList(SeesunguideVO vo, String lv1) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("lv1", lv1);
		return selectList("SeesunguideDAO.sampleBodyList", map); // 문자열을 받아서 리스트를 반환
	}

}
