# ERPproject
![대광물산mainPage](https://github.com/sunhee00/ERPproject/assets/104435431/b5accf54-fe29-4420-8188-23102f55f609)

<br>

## 🖥️ 프로젝트 소개
 - ERP란?
   ERP(Enterprise Resource Planning) System - 전사적 자원 관리 시스템<br>
   :재무, 인사 관리, 제조, 공급망, 서비스, 조달 등 비즈니스의 여러 부문에서 자동화와 프로세스를 지원해 운영 효율성을 높이도록 돕는 소프트웨어 시스템
   
 - 프로젝트 선정이유
   1. 비즈니스 프로세스를 개선하고 효율성을 향상시킬 수 있는 업무 자동화 솔루션을 개발한다.
   2. 회계, 인사, 영업, 매출 데이터를 처리하여 실무 현장에서 활용할 수 있는 개발 역량을 강화한다.
 
 - 기대효과
   1. 비즈니스의 불필요한 절차를 최소화하고 업무 중복을 제거하여, 직업의 일관성을 유지하고 생산성을 향상시킨다.
   2. 파편적으로 처리하던 서류 작업을 자동화하여, 업무 처리 시간을 단축하고 인력과 자원의 효율성을 극대화한다.
   3. 전체 데이터를 하나의 중앙 데이터베이스에 통합하여, 실시간 공유가 가능해지고 데이터의 일관성과 정확성을 높인다.

<br>

## 🕰️ 개발 기간
* 2023.05.31 - 2023.07.12

<br>

## 🧑‍🤝‍🧑 멤버구성
 - 강문주 - 결재관리, 공지사항, 공통코드관리, 월별결재관리
 - 이선희 - 발주내역조회, 휴가신청 및 연차조회, 휴가신청내역, 급여관리, 급여조회 
 - 이은지 - 계정과목관리, 회계전표, 인사관리
 - 이수경 - 영업계획, 영업실적조회, 고객기업관리, 납품기업관리, 주문관리
 - 조하나 - 지출결의서 신청, 지출결의서 조회 및 승인, 마이페이지
 - 박동근 - 제품정보, 일별매출현황, 월별매출현황, 연별매출현황

<br>
## ✏️ 기획
- 아키텍처



## ⚙️ 개발 환경
<img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=ffffff"/> <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jquery&logoColor=ffffff"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=ffffff"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=ffffff"/> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=ffffff"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=ffffff"/> <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat-square&logo=apachetomcat&logoColor=ffffff"/>


>개발언어

JAVA(1.8.0), JSP(2.3), JavaScript(1.0), HTML5, CSS3, XML

>라이브러리/프레임워크

SpringFramework(4.3.0), jQuery(3.4), MYBATIS(3.0.6)

>개발툴

Eclipse(eGovFrameDev-3.6.0), eXERD, JSON, AJAX

>서버

apache-tomcat(8.0)

>DB

My SQL(5.1.30)

>형상관리

SVN

<br>

## 📐 설계
(ERP사진)

## 📌 주요 기능([구현상세](https://github.com/sunhee00/ERPproject/wiki/%EC%9D%B4%EC%84%A0%ED%9D%AC(%EB%B3%B8%EC%9D%B8)-%E2%80%90-%EB%B0%9C%EC%A3%BC%EB%82%B4%EC%97%AD%EC%A1%B0%ED%9A%8C,-%ED%9C%B4%EA%B0%80%EC%8B%A0%EC%B2%AD-%EB%B0%8F-%EC%97%B0%EC%B0%A8%EC%A1%B0%ED%9A%8C,-%ED%9C%B4%EA%B0%80%EC%8B%A0%EC%B2%AD%EB%82%B4%EC%97%AD,-%EA%B8%89%EC%97%AC%EA%B4%80%EB%A6%AC,-%EA%B8%89%EC%97%AC%EC%A1%B0%ED%9A%8C))
#### 💵회계
- 계정과목관리
- 지출결의서 신청
- 지출결의서 조회 및 승인
- 회계전표

#### 📞영업
- 영업계획
- 영업실적조회
- 고객기업 관리
- 납품기업 관리
- 주문관리(수주관리)
- 발주내역조회
  1. <a href="src/main/java/kr/happyjob/study/busDlv" >java file</a>
  2. <a href="src/main/resources/sql/busDlv" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/busDlv" >jsp file</a>
  
- 제품정보

#### 👤인사
- 인사관리
- 마이페이지
- 휴가 신청 및 연차 조회
  1. <a href="src/main/java/kr/happyjob/study/empVcp" >java file</a>
  2. <a href="src/main/resources/sql/empVcp" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/empVcp" >jsp file</a>
  
- 휴가신청내역
  1. <a href="src/main/java/kr/happyjob/study/empVcs" >java file</a>
  2. <a href="src/main/resources/sql/empVcs" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/empVcs" >jsp file</a>
  
- 급여관리
  1. <a href="src/main/java/kr/happyjob/study/empSam" >java file</a>
  2. <a href="src/main/resources/sql/empSam" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/empSam" >jsp file</a>
  
- 급여조회
  1. <a href="src/main/java/kr/happyjob/study/empSas" >java file</a>
  2. <a href="src/main/resources/sql/empSas" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/empSas" >jsp file</a>

- 결재관리

#### 📊매출
- 일별매출현황
- 월별매출현황
- 연별매출현황

#### 🗓달력
- 월별결재관리
  
#### 🔍운영
- 공지사항
- 공통코드 관리

## 📌 통합테스트
(통합테스트 사진)
