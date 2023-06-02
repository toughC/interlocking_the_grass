package web;

import java.util.List;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class SeesunguideController {

	@Resource(name = "SeesunguideService")
	private SeesunguideService SeesunguideService;

	@RequestMapping(value = { "/", "guide" })
	public String guide() {
		System.out.println("가이드 접속");
		return "/guide";

	}

	@Controller
	@RequestMapping("/sample")
	public class MapController {

		@GetMapping("")
		public String sample() {
			System.out.println("샘플 접속");
			return "sample";
		}

		@GetMapping("/basicMap")
		public String basicMap() {
			return "sample/basicMap";
		}

		@GetMapping("/moveMap")
		public String moveMap() {
			return "sample/moveMap";
		}

		@GetMapping("/changeLevel")
		public String changeLevel() {
			return "sample/changeLevel";
		}

		@GetMapping("/mapInfo")
		public String mapInfo() {
			return "sample/mapInfo";
		}

		@GetMapping("/addMapControl")
		public String addMapControl() {
			return "sample/addMapControl";
		}

		@GetMapping("/addMapCustomControl")
		public String addMapCustomControl() {
			return "sample/addMapCustomControl";
		}

		@GetMapping("/drawFeatures")
		public String drawFeatures() {
			return "sample/drawFeatures";
		}
		
		@GetMapping("/drawShape")
		public String drawShape() {
			return "sample/drawShape";
		}
		
		@GetMapping("/drawLineStringArrows")
		public String drawLineStringArrows() {
			return "sample/drawLineStringArrows";
		}

		@GetMapping("/sample/{path}")
		public String redirect(@PathVariable String path) {
			return "redirect:/sample/" + path;
		}
	}

	@RequestMapping(value = "docs")
	public String docs() {
		System.out.println("문서 접속");
		return "/docs";

	}
	@Controller
	@RequestMapping("/help")
	public class MapController1 {

		@GetMapping("")
		public String help() {
			System.out.println("샘플 접속");
			return "help";
		}
		@GetMapping("/help/")
		public String redirect(@PathVariable String path) {
			return "redirect:/help/";
		}
	}

	@RequestMapping(value = "/main")
	public String main() {
		System.out.println("관리자 페이지");
		return "main";

	}

	@ResponseBody
	@RequestMapping(value = { "/get_depth1_id", "/sample/get_depth1_id" })
	public List<?> get_depth1_id(HttpServletRequest req, HttpServletResponse response, SeesunguideVO vo) {
		List<?> selectOne = null;

		try {
			selectOne = SeesunguideService.selectList(vo, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return selectOne;
	}

	@ResponseBody
	@RequestMapping(value = { "/get_depth2_3_ids", "/sample/get_depth2_3_ids" })
	public List<?> get_depth2_3_ids(HttpServletRequest req, HttpServletResponse response, SeesunguideVO vo,
			@RequestParam(value = "lv1") String lv1, @RequestParam(value = "keyword") String keyword) {
		List<?> selectOne = null;

		try {
			selectOne = SeesunguideService.searchList(vo, lv1, keyword);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return selectOne;
	}

	@ResponseBody
	@RequestMapping(value = { "/sampleBodyList", "/sample/sampleBodyList" })
	public List<?> sampleBodyList(HttpServletRequest req, HttpServletResponse response, SeesunguideVO vo,
			@RequestParam(value = "lv1") String lv1) {
		List<?> selectOne = null;

		try {
			selectOne = SeesunguideService.sampleBodyList(vo, lv1);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return selectOne;
	}

}
