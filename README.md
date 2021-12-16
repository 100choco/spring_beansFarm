# spring_beansFarm

# yiTeamProject
Spring MVC 쇼핑몰 프로젝트

## 차례

[프로젝트 소개](#프로젝트-소개)  
[적용해본 것](#적용해본-것)  
[주요 기능](#주요-기능)  
[링크](#링크)  
[외부 리소스](#외부-리소스)

## 프로젝트 소개

Spring Framework 를 활용하여 쇼핑몰 사이트를 제작해 보았습니다.

### 환경

- Spring Framework 5.2.6
- JDK 8u202
- Maven 3.8.4
- Server: CentOS8, Docker (20.10.11), Tomcat (8.5.69), MariaDB (latest), Nginx (latest), Jenkins (lts)

### 구성원

- 김태수 : [https://github.com/taedi90](https://github.com/taedi90)
- 서승아 : [https://github.com/seungaseo01](https://github.com/seungaseo01)
- 유한빈 : [https://github.com/Yu-hanbin](https://github.com/Yu-hanbin)

### 기간

- 2021-11-03~2021-12-03 (약 5주)

## 적용해본 것

### 🔐 스프링 시큐리티 & oAuth2.0

스프링 시큐리티를 적용하여 인증과 인가를 관리하였고, 추가적으로 oAuth 를 활용해 소셜 회원가입도 가능하도록 구현했습니다.

### 🧲 반응형 디자인

브라우저 크기에 따라 레이아웃이 수정되도록 구성하여 모바일과 PC 에서의 사용자 환경을 동시에 충족시키는 방법을 고려하였습니다.

### 🗃 모듈화

[Ajax](https://log.taedi.net/vanillajs-ajax-module/), [모달창](https://log.taedi.net/vanillajs-modal-window/), [페이징 처리](https://log.taedi.net/spring-mybatis-paging/), 이미지 리사이즈 등 반복적으로 사용되는 기능에 대한 모듈화를 진행하여 코드 중복을 줄이고 유지보수에 신경 썼습니다.

### 📬 이메일 인증

메일 발송 & 암호화/복호화 & 세션을 이용하여 회원 가입시 가입자의 이메일 소유 여부를 인증하는 절차를 구현해 보았습니다.

### ⛓ 트랜잭션 처리

데이터 무결성이 필요한 일부 로직과 Junit 테스트 모듈에 트랜잭션을 적용하였습니다.

### 💰 외부 API 활용 (결제 & 도로명 주소 등)

공부 목적으로 가급적 기본 라이브러리와 자체 구현으로 로직을 구성하였으나, 불가피한 부분에 대하여 외부에 공개 된 API를 프로젝트에 적용시켜 기능을 완성하였습니다.



### 📦  배포 자동화

프로젝트 변경 사항이 발생할 경우 github webhook 기능을 통해 Jenkins 에 빌드를 유발시키고 tomcat 으로 배포할 수 있도록 파이프라인을 구축시켜 보았습니다.

## 주요 기능

### 메인페이지

- 이미지 슬라이더, 그리드 레이아웃

![스크린샷 2021-12-07 오전 8.58.10.png](images/pic-0007.png)

### 로그인 & 회원가입

- 이메일 인증, 로그인 유지, 소셜 & 일반 회원 가입

로그인|회원가입
|---|---|
![스크린샷 2021-12-07 오전 8.55.27.png](images/pic-0009.png)|![스크린샷 2021-12-07 오전 8.55.17.png](images/pic-0001.png)

![스크린샷 2021-12-07 오전 8.56.22.png](images/pic-0003.png)

### 상품상세

- 옵션 선택, 장바구니 &  주문 로직 연동

![스크린샷 2021-12-07 오전 8.51.44.png](images/pic-0008.png)

### 장바구니

- 상품 선택, 수량 변경, 상품 삭제, 주문 로직 연동

![스크린샷 2021-12-07 오전 9.07.31.png](images/pic-0004.png)

### 주문

- 배송지 조회, 결제 로직 연동

![스크린샷 2021-12-07 오전 8.53.05.png](images/pic-0005.png)

### 마이페이지

- 주문 내역, 회원 탈퇴

![스크린샷 2021-12-07 오전 8.53.28.png](images/pic-0002.png)

### 관리자 페이지

- 관리자 설정, 회원 관리, 상품 관리, 주문 조회, 질문 답변

![스크린샷 2021-12-07 오전 8.54.04.png](images/pic-0006.png)

## 링크
- [프로젝트 사이트](https://web.taedi.net/shop/)
- [프로젝트 후기](https://log.taedi.net/yi-teamproject-log-1/)

## 외부 리소스

- 아이콘 - 자체제작
- 상품 이미지 - [https://unsplash.com/](https://unsplash.com/)
