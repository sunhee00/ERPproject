<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

							<c:if test="${totalCount eq 0 }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<!--계정상세 목록 개수로 판단 -->
							<c:if test="${totalCount > 0 }" >
								<c:forEach items="${accAcmDtModel}" var="list">
									<tr>
										<td>
											<c:if test="${list.acnt_sbjct_inout == 1 }">수입</c:if>
											<c:if test="${list.acnt_sbjct_inout == 2 }">비용</c:if>
										</td>
										<td>${list.acnt_sbject_name}</td>
										<td>${list.acnt_dt_sbject_cd}</td>
										<td>${list.acnt_dt_sbjct_name}</td>
										<td>-</td>
									</tr>
								</c:forEach>
							</c:if>
							
							<!-- 리스트 총 개수 input hidden 으로 파라미터에 포함되도록 작성 -->
							<input type="hidden" id="totalCount" name="totalCount" value ="${totalCount}"/>