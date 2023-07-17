# ERPproject
![대광물산mainPage](https://github.com/sunhee00/ERPproject/assets/104435431/b5accf54-fe29-4420-8188-23102f55f609)

<br>

## 🖥️ 프로젝트 소개
 - ERP란?
   ERP(Enterprise Resource Planning) System - 전사적 자원 관리 시스템
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
 - PM  : 강문주 - 결재관리, 공지사항, 공통코드관리, 월별결재관리
 - 팀원1 : 이선희(본인) - 발주내역조회, 휴가신청 및 연차조회, 휴가신청내역, 급여관리, 급여조회 ([구현상세](https://github.com/sunhee00/ERPproject/wiki/%EC%9D%B4%EC%84%A0%ED%9D%AC(%EB%B3%B8%EC%9D%B8)-%E2%80%90-%EB%B0%9C%EC%A3%BC%EB%82%B4%EC%97%AD%EC%A1%B0%ED%9A%8C,-%ED%9C%B4%EA%B0%80%EC%8B%A0%EC%B2%AD-%EB%B0%8F-%EC%97%B0%EC%B0%A8%EC%A1%B0%ED%9A%8C,-%ED%9C%B4%EA%B0%80%EC%8B%A0%EC%B2%AD%EB%82%B4%EC%97%AD,-%EA%B8%89%EC%97%AC%EA%B4%80%EB%A6%AC,-%EA%B8%89%EC%97%AC%EC%A1%B0%ED%9A%8C))
 - 팀원2 : 이은지 - 계정과목관리, 회계전표, 인사관리
 - 팀원3 : 이수경 - 영업계획, 영업실적조회, 고객기업관리, 납품기업관리, 주문관리
 - 팀원4 : 조하나 - 지출결의서 신청, 지출결의서 조회 및 승인, 마이페이지
 - 팀원5 : 박동근 - 제품정보, 일별매출현황, 월별매출현황, 연별매출현황

<br>

## ⚙️ 개발 환경
- 개발환경
>Eclipse(eGovFrameDev-3.6.0)

>My SQL(5.1.30)

>SpringFramework(4.3.0)

>SVN

>eXERD

>apache-tomcat(8.0)

- 개발언어
>JAVA(1.8.0)

>JSP(2.3)

>JavaScript(1.0)

>HTML5

>CSS3

>jQuery(3.4)

>XML

- 개발도구
>AJAX

>MYBATIS(3.0.6)

>JSON
  
<br>

## 📌 주요 기능
#### 💵회계
- 계정과목관리
  1. <a href="src/main/java/kr/happyjob/study/accAcm" >java file</a>
  2. <a href="src/main/resources/sql/accAcm" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/accAcm" >jsp file</a>
  
- 지출결의서 신청
  1. <a href="src/main/java/kr/happyjob/study/accEpr" >java file</a>
  2. <a href="src/main/resources/sql/accEpr" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/accEpr" >jsp file</a>
  
- 지출결의서 조회 및 승인
  1. <a href="src/main/java/kr/happyjob/study/accEps" >java file</a>
  2. <a href="src/main/resources/sql/accEps" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/accEps" >jsp file</a>
  
- 회계전표
  1. <a href="src/main/java/kr/happyjob/study/accAcs" >java file</a>
  2. <a href="src/main/resources/sql/accAcs" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/accAcs" >jsp file</a>

#### 📞영업
- 영업계획
  1. <a href="src/main/java/kr/happyjob/study/busSap" >java file</a>
  2. <a href="src/main/resources/sql/busSap" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/busSap" >jsp file</a>
  
- 영업실적조회
  1. <a href="src/main/java/kr/happyjob/study/busSas" >java file</a>
  2. <a href="src/main/resources/sql/busSas" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/busSas" >jsp file</a>
  
- 고객기업 관리
  1. <a href="src/main/java/kr/happyjob/study/busClm" >java file</a>
  2. <a href="src/main/resources/sql/BusClm" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/busClm" >jsp file</a>
  
- 납품기업 관리
  1. <a href="src/main/java/kr/happyjob/study/busSpm" >java file</a>
  2. <a href="src/main/resources/sql/BusSpm" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/busSpm" >jsp file</a>
  
- 주문관리(수주관리)
  1. <a href="src/main/java/kr/happyjob/study/busOdm" >java file</a>
  2. <a href="src/main/resources/sql/BusOdm" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/busOdm" >jsp file</a>
  
- 발주내역조회
  1. <a href="src/main/java/kr/happyjob/study/busDlv" >java file</a>
  2. <a href="src/main/resources/sql/busDlv" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/busDlv" >jsp file</a>
  
- 제품정보
  1. <a href="src/main/java/kr/happyjob/study/busPd" >java file</a>
  2. <a href="src/main/resources/sql/busPd" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/busPd" >jsp file</a>

#### 👤인사
- 인사관리
  1. <a href="src/main/java/kr/happyjob/study/emp" >java file</a>
  2. <a href="src/main/resources/sql/emp" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/emp" >jsp file</a>
  
- 마이페이지
  1. <a href="src/main/java/kr/happyjob/study/empMpg" >java file</a>
  2. <a href="src/main/resources/sql/empMpg" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/empMpg" >jsp file</a>
  
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
  1. <a href="src/main/java/kr/happyjob/study/empApm" >java file</a>
  2. <a href="src/main/resources/sql/empApm" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/empApm" >jsp file</a>

#### 📊매출
- 일별매출현황
  1. <a href="src/main/java/kr/happyjob/study/selSaD" >java file</a>
  2. <a href="src/main/resources/sql/selSaD" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/selSaD" >jsp file</a>
  
- 월별매출현황
  1. <a href="src/main/java/kr/happyjob/study/selSaM" >java file</a>
  2. <a href="src/main/resources/sql/selSaM" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/selSaM" >jsp file</a>
  
- 연별매출현황
  1. <a href="src/main/java/kr/happyjob/study/selSaY" >java file</a>
  2. <a href="src/main/resources/sql/selSaY" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/selSaY" >jsp file</a>

#### 🗓달력
- 월별결재관리
  1. <a href="src/main/java/kr/happyjob/study/calDay" >java file</a>
  2. <a href="src/main/resources/sql/calDay" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/calDay" >jsp file</a>
  
#### 🔍운영
- 공지사항
  1. <a href="src/main/java/kr/happyjob/study/mngNot" >java file</a>
  2. <a href="src/main/resources/sql/MngNot" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/mngNot" >jsp file</a>
  
- 공통코드 관리
  1. <a href="src/main/java/kr/happyjob/study/system" >java file</a>
  2. <a href="src/main/resources/sql/system" >mapper file</a>
  3. <a href="src/main/webapp/WEB-INF/view/system" >jsp file</a>
