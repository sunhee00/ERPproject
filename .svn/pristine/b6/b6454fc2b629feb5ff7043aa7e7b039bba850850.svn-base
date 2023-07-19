package kr.happyjob.study.accAcm.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.accAcm.model.accAcmModel;
import kr.happyjob.study.accAcm.service.accAcmService;
import kr.happyjob.study.accAcs.model.accAcsModel;
import kr.happyjob.study.common.comnUtils.ComnCodUtil;
import kr.happyjob.study.mngNot.model.NoticeModel;
import kr.happyjob.study.mngNot.service.MngNotService;
import kr.happyjob.study.system.model.ComnDtlCodModel;

@Controller
@RequestMapping("/accAcm/")
public class accAcmController {

	@Autowired
	accAcmService AccAcmService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	/**
	 * 계정과목 관리 초기화면
	 */
	@RequestMapping("accManagement.do")
	public String accManagement(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".accAcm");
		logger.info("   - paramMap : " + paramMap);
		logger.info("+ End " + className + ".accAcm");

		return "accAcm/accAcmList";
	}

	/**
	 * 계정과목 목록 & 수입/비용 검색 화면
	 */
	@RequestMapping("accManagementList.do")
	public String accManagementList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".accAcm");

		// 페이지네이션을 위한 변수 선언
		int pagenum = Integer.parseInt((String) paramMap.get("pagenum")); // 현재 페이지 번호
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 한 페이지에 보여질 리스트 개수
		int pageindex = (pagenum - 1) * pageSize; // 해당 페이지네이션 첫 리스트 번호

		paramMap.put("pageSize", pageSize);
		paramMap.put("pageindex", pageindex);

		// paramMap의 값을 이용하여 조건에 맞는 리스트를 List<accAcmModel> 형식으로 가져오기
		List<accAcmModel> accAcmSearchList = AccAcmService.accAcmSearchList(paramMap);

		// 총 리스트 개수
		int totalcnt = AccAcmService.countactlist(paramMap);

		// 리스트와 총 리스트 개수 JSP로 값 넘김
		model.addAttribute("accAcmSearchList", accAcmSearchList);
		model.addAttribute("totalcnt", totalcnt);

		logger.info("+ End " + className + ".accountSearchList");

		return "accAcm/accAcmListGrd";

	}

	/**
	 * 계정대분류 신규등록시
	 */
	@RequestMapping("bigInsert.do")
	@ResponseBody
	public Map<String, Object> bigInsert(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".bigInsert");
		logger.info("   - paramMap : " + paramMap);

		// paramMap의 action의 값을 따로 저장
		String action = (String) paramMap.get("action");

		// 초기화
		int returncval = 0;

		// action 값이 "I"일 경우 계정대분류 값 등록하는 insert 메소드 생성(성공시 returncval == 1)
		if ("I".equals(action)) {
			returncval = AccAcmService.bigInsert(paramMap);
		}

		// Map객체에 insert 결과를 넣어 JSP로 전달 (returncval의 값에 따라 로직이 달라지게 jQuery 설정)
		Map<String, Object> returnmap = new HashMap<String, Object>();
		returnmap.put("returncval", returncval);

		logger.info("+ End " + className + ".noticesave");

		return returnmap;
	}

	/**
	 * 계정상세 코드 목록 조회
	 */
	@RequestMapping("accAcmSList.do")
	public String accAcmSList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".accAcmSList");
		logger.info("   - paramMap : " + paramMap);

		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재 페이지 번호
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 페이지 사이즈
		int pageIndex = (currentPage - 1) * pageSize; // 페이지 시작 row 번호

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);

		// 계정 상세코드 목록 조회
		List<accAcmModel> accAcmDtModel = AccAcmService.accAcmSListSearch(paramMap);
		model.addAttribute("accAcmDtModel", accAcmDtModel);

		// 계정 상세코드 목록 총 개수 조회
		int totalCount = AccAcmService.countSList(paramMap);
		model.addAttribute("totalCount", totalCount);

		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnDtlCod", currentPage);

		logger.info("+ End " + className + ".accAcmModel");

		logger.info("   - paramMap5554888 : " + paramMap);
		return "/accAcm/accAcmListDGrd";
	}

	/**
	 * 계정상세 신규등록시
	 */
	@RequestMapping("smallInsert.do")
	@ResponseBody
	public Map<String, Object> smallInsert(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".smallInsert");
		logger.info("   - paramMap : " + paramMap);

		// Ajax에서 설정했던 action값을 가져와서 변수에 대입
		String action = (String) paramMap.get("action");

		// 초기화
		int returncval = 0;
		// action 값이 "I"일 경우 계정대분류 값 등록하는 insert 메소드 생성(성공시 returncval == 1)
		if ("I".equals(action)) {
			returncval = AccAcmService.smallInsert(paramMap);
		}

		// Map객체에 insert 결과를 넣어 JSP로 전달 (returncval의 값에 따라 로직이 달라지게 jQuery 설정)
		Map<String, Object> returnmap = new HashMap<String, Object>();
		returnmap.put("returncval", returncval);

		logger.info("+ End " + className + ".noticesave");

		return returnmap;
	}

	/**
	 * 계정 대분류코드 중복 확인
	 */
	@RequestMapping("LCdDupChk.do")
	@ResponseBody
	public int LCdDupChk(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		// 신규등록하는 계정대분류코드 중복확인(result > 0 -> 중복)
		int result = AccAcmService.LCdDupChked(paramMap);
		return result;

	}

	/**
	 * 계정 대분류 이름 중복 확인
	 */
	@RequestMapping("LNmDupChk.do")
	@ResponseBody
	public int LNmDupChk(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		// 신규등록하는 계정대분류코드명 중복확인(result > 0 -> 중복)
		int result = AccAcmService.LNmDupChked(paramMap);

		return result;

	}

	/**
	 * 계정상세코드 중복 확인
	 */
	@RequestMapping("SCdDupChk.do")
	@ResponseBody
	public int SCdDupChk(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		// 신규등록하는 계정상세코드 중복확인(result > 0 -> 중복)
		int result = AccAcmService.SCdDupChk(paramMap);

		return result;

	}

}