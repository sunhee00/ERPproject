<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

							<c:if test="${totalcnt eq 0 }">
								<tr>
									<td colspan="7">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<!-- 리스트 총 개수로 데이터 유무 판단 -->
							<c:if test="${totalcnt > 0 }">
								<c:forEach items="${accountSearchList}" var="list" >
									<tr>
										<!-- 회계전표 번호, 날짜 클릭시 fn_selectone 함수로 이동해 해당 전표 상세 조회 가능 -->
										<td><a href="javascript:fn_selectone('${list.budget_no}')">${list.budget_no}</a></td>
										<td><a href="javascript:fn_selectone('${list.budget_no}')">${list.pdate}</a></td>
										<td>${list.acnt_sbjct_inout}</td>
										<td>${list.acnt_dt_sbjct_name}</td>
										<td>${list.client}</td>
										<td><fmt:formatNumber value="${list.outamt}" pattern="#,##0" /></td>
										<td><fmt:formatNumber value="${list.inamt}" pattern="#,##0" /></td>
									</tr>
								</c:forEach>
							</c:if>
							
							<!-- 리스트 총 개수 input hidden 으로 파라미터에 포함되도록 작성 -->
							<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>