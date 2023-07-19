package kr.happyjob.study.accAcs.controller;

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

import kr.happyjob.study.accAcs.model.accAcsModel;
import kr.happyjob.study.accAcs.service.accAcsService;
import kr.happyjob.study.common.comnUtils.ComnCodUtil;
import kr.happyjob.study.mngNot.model.NoticeModel;
import kr.happyjob.study.mngNot.service.MngNotService;
import kr.happyjob.study.system.model.comcombo;

@Controller
@RequestMapping("/accAcs/")
public class accAcsController {
   
   @Autowired
   accAcsService AccAcsService;
   
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger - 로거사용시 해당 클래스 이름을 명시하기 위해 toString 사용
   private final String className = this.getClass().toString();
   
   
   
   /**
    * 회계전표 리스트 출력(초기 페이지)
    */
   @RequestMapping("accountSearch.do")
   public String accountSearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".accAcs");
      logger.info("   - paramMap : " + paramMap);
      logger.info("+ End " + className + ".accAcs");

      return "accAcs/accountSearchList";
      
   }
       

   /**
    * 검색(시작날짜, 마감날짜, 계정대분류, 계정상세, 거래처명 조건 설정)
    */
   @RequestMapping("accountSearchList.do")
   public String accountSearchList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		   HttpServletResponse response, HttpSession session) throws Exception {
	   
	   logger.info("+ Start " + className + ".accAcs");

	   //페이지네이션을 위한 변수 선언
       int pagenum = Integer.parseInt((String) paramMap.get("pagenum")); //현재 페이지 번호
       int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); //한 페이지에 보여질 리스트 개수
       int pageindex = (pagenum - 1) * pageSize; //해당 페이지네이션 첫 리스트 번호
       
       paramMap.put("pageSize", pageSize);
       paramMap.put("pageindex", pageindex);
       
       //paramMap의 값을 이용하여 조건에 맞는 리스트를 List<accAcsModel> 형식으로 가져오기 
       List<accAcsModel> accountSearchList = AccAcsService.accountSearchList(paramMap);
       
       //총 리스트 개수
       int totalcnt = AccAcsService.countactlist(paramMap);
       
       //리스트와 총 리스트 개수 JSP로 값 넘김
       model.addAttribute("accountSearchList", accountSearchList);
       model.addAttribute("totalcnt", totalcnt);
       
       logger.info("+ End " + className + ".accountSearchList");

       return "accAcs/accountSearchListGrd";
       
   }
   
   
   /**
    * 선택한 회계전표 상세내용 조회
    */
   @RequestMapping("accountSearchSelectone.do")
   @ResponseBody	// JSON 형식 데이터를 주고받기 위한 어노테이션
   public Map<String, Object> accountSearchSelectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".accountSearcheselectone");
      logger.info("   - paramMap : " + paramMap);
      
      //paramMap의 현재 선택한 글의 번호 이용해 상세 내용조회하고 accAcsModel모델 객체로 값 받아오기
      accAcsModel accountSearchSelectone= AccAcsService.accountSearchSelectone(paramMap);
      
      //Map을 생성해 db의 값을 받아온 모델을 넣어 ajax에서 응답데이터 확인할 수 있도록 함
      Map<String, Object> returnmap = new HashMap<String, Object>();
      returnmap.put("accountSearchSelectone", accountSearchSelectone);
      
      logger.info("+ End " + className + ".accountSearchSelectone");

      return returnmap;
   }  
   
}