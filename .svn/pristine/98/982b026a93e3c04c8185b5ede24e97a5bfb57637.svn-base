package kr.happyjob.study.emp.service;

import kr.happyjob.study.emp.model.EmpModel;
import kr.happyjob.study.mngNot.model.NoticeModel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface EmpService {
	
	//인사관리 목록 조회
    public List<EmpModel> empList(Map<String, Object> paramMap) throws Exception;

    //인사관리 목록 개수 조회
    public int countempList(Map<String, Object> paramMap) throws Exception;

    //선택한 사원의 상세 정보 조회
    public EmpModel empSelectOne(Map<String, Object> paramMap) throws Exception;

    //신규 사원 등록
    public int empInsert(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

    //신규 등록한 사원 번호 조회
    String maxMethod3(Map<String, Object> paramMap) throws Exception;

    //신규 등록한 사원의 휴가일수 계산 후 삽입
    public int vaceInsert(Map<String, Object> paramMap) throws Exception;

    //사원 정보 수정( + 직급 수정시 연봉 수정)
    public int empUpdate(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

    //사원 정보 직급 수정시 휴가일수 수정
    public int vaceUpdate(Map<String, Object> paramMap) throws Exception;

    //사원 퇴사 처리(재직구분 : N, 퇴사일자 등록)
    public int empDelete(Map<String, Object> paramMap) throws Exception;





}
