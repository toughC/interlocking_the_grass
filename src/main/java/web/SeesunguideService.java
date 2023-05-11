package web;

import java.util.List;

public interface SeesunguideService {
	public List<?> selectList(SeesunguideVO vo, String deptCd) throws Exception;

	public List<?> searchList(SeesunguideVO vo, String lv1, String keyword) throws Exception;

	public List<?> sampleBodyList(SeesunguideVO vo, String lv1) throws Exception;

}
