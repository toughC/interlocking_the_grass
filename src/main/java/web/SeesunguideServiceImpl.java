package web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import web.SeesunguideService;
import web.SeesunguideVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("SeesunguideService")
public class SeesunguideServiceImpl extends EgovAbstractServiceImpl implements SeesunguideService {

	@Resource(name = "SeesunguideDAO")
	private SeesunguideDAO seesunguideDAO;

	@Override
	public List<?> selectList(SeesunguideVO vo, String deptCd) throws Exception {
		return seesunguideDAO.selectList(vo, deptCd);
	}

	@Override
	public List<?> searchList(SeesunguideVO vo, String lv1, String keyword) throws Exception {
		return seesunguideDAO.searchList(vo, lv1, keyword);
	}

	@Override
	public List<?> sampleBodyList(SeesunguideVO vo, String lv1) throws Exception {
		return seesunguideDAO.sampleBodyList(vo, lv1);
	}

}
