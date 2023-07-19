package kr.happyjob.study.emp.controller;

import kr.happyjob.study.emp.model.EmpModel;
import kr.happyjob.study.emp.service.EmpService;
import kr.happyjob.study.mngNot.model.NoticeModel;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/empEpm/")
public class empController {

	@Autowired
    EmpService empService;

    private final Logger logger = LogManager.getLogger(this.getClass());
    private final String className = this.getClass().toString();

    
	/**
	 * 인사관리 초기화면
	 */
    @RequestMapping("empmanagement.do")
    public String emp(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
                      HttpServletResponse response, HttpSession session)throws Exception{
        logger.info("+ Start " + className  + ".emp");
        logger.info("   - paramMap : " + paramMap);
        logger.info("+ End " + className + ".notice");

        return "emp/empList";

    }
    
	/**
	 * 인사관리 목록 조회
	 */
    @RequestMapping("emplist.do")
    public String noticelist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
                             HttpServletResponse response, HttpSession session) throws Exception {

        logger.info("+ Start " + className + ".emplist");
        logger.info("   - paramMap : " + paramMap);

        // 페이지네이션을 위한 변수 선언
        int pagenum = Integer.parseInt((String) paramMap.get("pagenum")); // 현재 페이지 번호
        int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 한 페이지에 보여질 리스트 개수
        int pageindex = (pagenum - 1) * pageSize; // 해당 페이지네이션 첫 리스트 번호

        paramMap.put("pageSize", pageSize);
        paramMap.put("pageindex", pageindex);

        //paramMap의 값을 이용하여 조건에 맞는 리스트를 List<EmpModel>에 담기
        List<EmpModel> empSearchList = empService.empList(paramMap);
        
        // 총 리스트 개수
        int totalcnt = empService.countempList(paramMap);

        model.addAttribute("empSearchList", empSearchList);
        model.addAttribute("totalcnt", totalcnt);

        logger.info("+ End " + className + ".emplist");

        return "emp/emplistgrd";
    }
    
    
	/**
	 * 사원 상세정보 조회
	 */
    @RequestMapping("empSelectOne.do")
    @ResponseBody
    public Map<String, Object> empSelectOne(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
                                            HttpServletResponse response, HttpSession session) throws Exception{
        logger.info("+ Start " + className + ".empselectone");
        logger.info("   - paramMapdddddd : " + paramMap);
        
        //paramMap의 현재 선택한 사원번호 이용해 상세 내용조회하고 EmpModel모델 객체로 값 받아오기
        EmpModel empSearch = empService.empSelectOne(paramMap);

        Map<String, Object> returnmap = new HashMap<String, Object>();
        returnmap.put("empSearch", empSearch);

        logger.info("+ End " + className + ".empselectone");

        return returnmap;

    }

	/**
	 * 신규사원 등록, 사원정보 수정, 사원 퇴사 처리
	 */
    @RequestMapping("empSave.do")
    @ResponseBody
    public Map<String, Object> empSave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
                                          HttpServletResponse response, HttpSession session) throws Exception {

        logger.info("+ Start " + className + ".empSave");
        logger.info("   - paramMap : " + paramMap);

        //Ajax에서 설정했던 action값을 가져와서 변수에 대입
        String action = (String) paramMap.get("action");

        paramMap.put("loginid", (String) session.getAttribute("loginId"));

        //초기화
        int returncval = 0;

        if("I".equals(action)) { //신규 사원 등록
        	logger.info("   - insert : " + paramMap);
        	
        	//신규사원 정보 등록
            returncval = empService.empInsert(paramMap,request);
            
            //방금 등록한 신규사원 사번 조회
            String max3 = empService.maxMethod3(paramMap);
            logger.info("   - max2 : " + max3);
            paramMap.put("max3",max3);
            
            //신규 사원등록과 동시에 tb_dt_vacation에 삽입(휴가 일수 등록)
            empService.vaceInsert(paramMap);
      
        } else if("U".equals(action)) {//사원 정보 수정
            logger.info("   - update : " + paramMap);
            
            //사원 정보 수정
            returncval = empService.empUpdate(paramMap,request);
            
            //사원 휴가 일수 수정(직급 변경시 휴가 일수 변경)
            empService.vaceUpdate(paramMap);
            
        } else if("D".equals(action)) {//사원 퇴사 처리
            logger.info("   - delete : " + paramMap);
            
            //삭제 버튼 클릭 시 퇴사처리(재직여부 : N, 퇴사일자 등록)
            returncval = empService.empDelete(paramMap);
        }


        Map<String, Object> returnmap = new HashMap<String, Object>();

        returnmap.put("returncval", returncval);

        logger.info("+ End " + className + ".empSave");
        logger.info("+ End " + className + ".empSave");

        return returnmap;
    }

}
