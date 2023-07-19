package kr.happyjob.study.emp.service;
import kr.happyjob.study.common.comnUtils.FileUtilCho;
//www
import kr.happyjob.study.emp.dao.EmpDao;
import kr.happyjob.study.emp.model.EmpModel;
import kr.happyjob.study.mngNot.model.NoticeModel;
import lombok.RequiredArgsConstructor;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
@Service
////
public class EmpServiceImpl implements EmpService{

    @Autowired
    EmpDao empDao;

    private final Logger logger = LogManager.getLogger(this.getClass());
    private final String className = this.getClass().toString();


    @Value("${sal_kuk_rate}")
    private Double sal_kuk_rate;	 //국민연금 %
    @Value("${sal_kun_rate}")   	
    private Double sal_kun_rate;	 //건강보험 %
    @Value("${sal_ko_rate}")
    private Double sal_ko_rate;		 //고용보험 %
    @Value("${sal_san_rate}")
    private Double sal_san_rate;	 //산재보험 %

    
	@Value("${fileUpload.rootPath}")
	private String rootPath;    	 // W:\\FileRepository
	
	@Value("${fileUpload.virtualRootPath}")
	private String virtualrootPath;  // /serverfile
	
	@Value("${fileUpload.noticePath}")
	private String noticePath;   	 // notice


	//인사관리 목록 조회
    @Override
    public List<EmpModel> empList(Map<String, Object> paramMap) throws Exception {
        return empDao.empList(paramMap);
    }

    //인사관리 목록 개수 조회
    @Override
    public int countempList(Map<String, Object> paramMap) throws Exception {
        return empDao.countempList(paramMap);
    }

    //선택한 사원의 상세 정보 조회  
    @Override
    public EmpModel empSelectOne(Map<String, Object> paramMap) throws Exception {
        return empDao.empSelectOne(paramMap);
    }

    //신규 사원 등록
    @Override
    public int empInsert(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {

     //사원 증명사진 등록 위한 파일 업로드 처리위해 Multipart form data 사용 
    	
     //파일 업로드 처리를 위해 HttpServletRequest request을 MultipartHttpServletRequest로 형변환
	 MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
	 
	 //파일 저장될 경로 설정
	 String noticedir = File.separator + noticePath + File.separator;
	 
	 //FileUtilCho 객체를 사용해 파일 업로드
	 FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest,rootPath, virtualrootPath, noticedir);
	 
	//fileup의 uploadFiles메소드 수행 후 리턴 받은 값을 filereturn Map에 담기
	 Map filereturn = fileup.uploadFiles();
	 
	 String upfile = (String) filereturn.get("file_nm");
	 paramMap.put("fileprc", "Y");
	 
		if(upfile == "" || upfile == null) {//파일 이름이 빈 값, null == 파일 없음
			//파일 존재 판단할 파라미터 전달(없음)
			paramMap.put("fileexist", "N");
			
		} else { // 파일 이름이 있음  -> 파일 존재

			//파일 정보가 담긴 filereturn Map 전달
			paramMap.put("filereturn", filereturn);
			//파일 존재를 판단할 파라미터 전달(있음)
			paramMap.put("fileexist", "Y");

			//파일 테이블에 삽입
			empDao.fileinsert(paramMap);
		}
	 
	 //초기화
     int emp_yr_sal=0;

     //직급 코드로 변수 설정
     String levelCd = (String) paramMap.get("level_cd");
     
     //직급별 연봉 지정을 위한 배열 선언
     String[] level_cdArray= {"10","20","30","40","50","60","70","80","90"}; //직급
     int[] emp_yr_salArray  = {30000000,35000000,40000000,45000000,50000000,55000000,60000000,65000000,70000000}; //연봉
     
     for (int i=0; i<level_cdArray.length; i++) {
         if(level_cdArray[i].equals(levelCd)) {
             emp_yr_sal = emp_yr_salArray[i];
             break;
         }
     }

     	//연봉에 따른 4대보험 금액 계산
        double sal_pre =emp_yr_sal/12.0;								   //세전 급여
        double sal_kuk = sal_pre * sal_kuk_rate;						   //국민연금
        double sal_kun = sal_pre * sal_kun_rate;		                   //건강보험
        double sal_ko = sal_pre * sal_ko_rate;                             //고용보험
        double sal_san = sal_pre * sal_san_rate;                           //산재보험 
        double sal_after = sal_pre - sal_kuk - sal_kun - sal_ko - sal_san; //세후 급여

        //paramMap에 해당 금액 포함해서 전달
        paramMap.put("emp_yr_sal", emp_yr_sal);
        paramMap.put("sal_pre", sal_pre);
        paramMap.put("sal_kuk", sal_kuk);
        paramMap.put("sal_kun", sal_kun);
        paramMap.put("sal_ko", sal_ko);
        paramMap.put("sal_san", sal_san);
        paramMap.put("sal_after", sal_after);

        //신규 사원 등록 
        return empDao.empInsert(paramMap);
    }

 
	
	
    //신규 등록한 사원 번호 조회
	 @Override
	 public String maxMethod3(Map<String, Object> paramMap) {
	     return empDao.maxMethod3(paramMap);
	 }
	 
	 
 
	//사원 정보 수정( + 직급 수정시 연봉 수정) 
    @Override
    public int empUpdate(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
       
    	//초기화
    	int emp_yr_sal=0;

        //직급 코드로 변수 설정
        String levelCd = (String) paramMap.get("level_cd");
        
        //직급별 연봉 지정을 위한 배열 선언
        String[] level_cdArray= {"10","20","30","40","50","60","70","80","90"};
        int[] emp_yr_salArray  = {30000000,35000000,40000000,45000000,50000000,55000000,60000000,65000000,70000000};
        
        for (int i=0; i<level_cdArray.length; i++) {
            if(level_cdArray[i].equals(levelCd)) {
                emp_yr_sal = emp_yr_salArray[i];
                break;
            }
        }

        double sal_pre =emp_yr_sal/12.0;
        double sal_kuk = sal_pre * sal_kuk_rate;
        double sal_kun = sal_pre * sal_kun_rate;
        double sal_ko = sal_pre * sal_ko_rate;
        double sal_san = sal_pre * sal_san_rate;
        double sal_after = sal_pre - sal_kuk - sal_kun - sal_ko - sal_san;

        paramMap.put("emp_yr_sal", emp_yr_sal);
        paramMap.put("sal_pre", sal_pre);
        paramMap.put("sal_kuk", sal_kuk);
        paramMap.put("sal_kun", sal_kun);
        paramMap.put("sal_ko", sal_ko);
        paramMap.put("sal_san", sal_san);
        paramMap.put("sal_after", sal_after);
        
        //사원 상세 정보 조회
        EmpModel selectone = empDao.empSelectOne(paramMap);
        
        //selectone에서의 파일이 존재할 경우
		if(selectone.getFile_name() != "" && selectone.getFile_name() != null) {
			
			//파일의 물리적 경로에 파일 객체 생성 후 파일 삭제
			File attfile = new File(selectone.getPhysic_path());  
			attfile.delete();
			
			//파일 테이블에서 해당 파일 제거
			empDao.deletefileinfo(paramMap);
		} 
				
		
    	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
    	
    	String noticedir = File.separator + noticePath + File.separator;
    	FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest,rootPath, virtualrootPath, noticedir);
    	Map filereturn = fileup.uploadFiles();
    	
    	String upfile = (String) filereturn.get("file_nm");
    	paramMap.put("fileprc", "Y");
    	
		
		if(upfile == "" || upfile == null) {
			paramMap.put("fileexist", "N");
		} else {
			paramMap.put("filereturn", filereturn);
			paramMap.put("fileexist", "Y");
			
			//파일 존재할 경우 파일 먼저 삽입
			empDao.fileinsert(paramMap);
		}
        
		//사원 정보 수정
        return empDao.empUpdate(paramMap);
    }
    
    
    //사원 퇴사 처리(재직구분 : N, 퇴사일자 등록)
    @Override
    public int empDelete(Map<String, Object> paramMap) throws Exception {
        
    	EmpModel selectone = empDao.empSelectOne(paramMap);
		
    	//selectone에서의 파일이 존재할 경우
		if(selectone.getFile_name() != "" && selectone.getFile_name() != null) {
			
			//물리적 경로에서 파일 삭제
			File attfile = new File(selectone.getPhysic_path());     
			attfile.delete();
			
			//파일 테이블에서 제거
			empDao.deletefileinfo(paramMap);
		} 
    	
		//사원 재직구분 수정, 퇴사일자 삽입
    	return empDao.empDelete(paramMap);
    }
    
    
    //신규 등록한 사원의 휴가일수 계산 후 삽입
    @Override
    public int vaceInsert(Map<String, Object> paramMap) throws Exception {
        
    	//초기화
    	int dt_va_tot=0;		//총연차
        int dt_vaca_rest = 0;	//잔여연차

        //직급 따른 연차 계산 위해 직급, 연차 배열 생성
        String levelCd = (String) paramMap.get("level_cd");
        String[] level_cdArray= {"10","20","30","40","50","60","70","80","90"};
        int[] dt_va_totArray  = {12,13,14,15,16,17,18,19,20,21};
        
        //직급의 index, 연차의 index 비교해 직급에 맞는 연차 지정
        for (int i=0; i<level_cdArray.length; i++) {
            if(level_cdArray[i].equals(levelCd)) {
                dt_va_tot = dt_va_totArray[i];
                break;
            }
        }
        
        //신규 등록시 사원의 총연차와 잔여연차는 동일하게 삽입
        dt_vaca_rest = dt_va_tot;
        paramMap.put("dt_va_tot", dt_va_tot);
        paramMap.put("dt_vaca_rest", dt_vaca_rest);
        
        //연차 테이블에 해당 정보 삽입
        return empDao.vaceInsert(paramMap);
    }
    
    
    
    //사원 정보 직급 수정시 휴가일수 수정
    @Override
    public int vaceUpdate(Map<String, Object> paramMap) throws Exception {
       
    	//초기화
    	int dt_va_tot=0;
        int dt_vaca_rest = 0;

        //직급 따른 연차 계산 위해 직급, 연차 배열 생성
        String levelCd = (String) paramMap.get("level_cd");
        String[] level_cdArray= {"10","20","30","40","50","60","70","80","90"};
        int[] dt_va_totArray  = {12,13,14,15,16,17,18,19,20,21};
       
        //직급의 index, 연차의 index 비교해 직급에 맞는 연차 지정
        for (int i=0; i<level_cdArray.length; i++) {
            if(level_cdArray[i].equals(levelCd)) {
                dt_va_tot = dt_va_totArray[i];
                break;
            }
        }
        dt_vaca_rest = dt_va_tot;
        paramMap.put("dt_va_tot", dt_va_tot);
        paramMap.put("dt_vaca_rest", dt_vaca_rest);
        
        //연차 테이블에 해당 정보 수정
        return empDao.vaceUpdate(paramMap);
    }


}
