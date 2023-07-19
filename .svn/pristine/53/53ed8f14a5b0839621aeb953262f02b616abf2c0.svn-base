package kr.happyjob.study.accAcs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.happyjob.study.accAcs.model.accAcsModel;
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;

@Service
public interface accAcsService {

	//회계전표 목록 조회
	List<accAcsModel> accountSearchList(Map<String, Object> paramMap);

	//회계전표 총 개수 조회
	int countactlist(Map<String, Object> paramMap);

	//회계전표 상세 내용 데이터를 accAcsModel통해 받아오기
	accAcsModel accountSearchSelectone(Map<String, Object> paramMap);
	
}
