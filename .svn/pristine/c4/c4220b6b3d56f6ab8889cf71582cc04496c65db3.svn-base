<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

							<c:if test="${totalcnt eq 0 }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<!-- 리스트 총 개수로 데이터 유무 판단 -->
							<c:if test="${totalcnt > 0 }">
								<c:forEach items="${accAcmSearchList}" var="list">
									<tr>
										<td>
											<c:if test="${list.acnt_sbjct_inout == 1 }">수입</c:if>
											<c:if test="${list.acnt_sbjct_inout == 2 }">비용</c:if>
										<td>${list.acnt_sbject_cd}</td>
										
										<!-- 해당 계정대분류 선택시 하위의 계정상세 목록이 나올 수 있도록 하는 fn_accAcmSListSearch (계정대분류코드, 계정대분류명) -->
										<td><a href="javascript:fn_accAcmSListSearch(1, '${list.acnt_sbject_cd}', '${list.acnt_sbject_name}')">${list.acnt_sbject_name}</a></td>
									</tr>
								</c:forEach>
							</c:if>
							
							<!-- 리스트 총 개수 input hidden 으로 파라미터에 포함되도록 작성 -->
							<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>
							
							<!-- 현재 선택한 계정대분류 코드, 명 파라미터로 전달하기 위한 input hidden -->
							<input type="hidden" id="LL_acnt_sbject_cd" name="LL_acnt_sbject_cd" value ="${acnt_sbject_cd}"/>
							<input type="hidden" id="LL_acnt_sbject_name" name="LL_acnt_sbject_name" value ="${acnt_sbject_name}"/>
							
