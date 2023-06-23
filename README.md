# Project
OIDC MSA Project


## Dockerfile 실행방법

1. 프로젝트 터미널 키기

<img width="1755" alt="스크린샷 2023-06-24 오전 12 39 19" src="https://github.com/OIDC-team/backend/assets/101400894/97d23e27-7910-43b6-834d-9f28840f7baf">

<br>

2. 도커컴포즈 실행 시키기

<img width="1768" alt="스크린샷 2023-06-24 오전 12 40 03" src="https://github.com/OIDC-team/backend/assets/101400894/40af2425-66fb-49e0-b461-965ceebbd02a">

<br>

3. 제대로 동작하는지 확인

+ localhost:8080/test 들어갔을때 "안녕하세요 테스트입니다."가 뜨면 backend server가 제대로 동작


![스크린샷 2023-06-24 오전 12 41 22](https://github.com/OIDC-team/backend/assets/101400894/b5f12805-2e05-448c-8961-3f139af12c43)

<br>

+ 터미널에서 컨테이너 접속 후 mysql의 database에 기본 sql이 잘 입력되었는지 확인

<img width="1414" alt="스크린샷 2023-06-24 오전 12 44 24" src="https://github.com/OIDC-team/backend/assets/101400894/7cb89c69-11e5-42d4-bab1-3ad657370810">

<br>


<img width="880" alt="스크린샷 2023-06-24 오전 12 45 01" src="https://github.com/OIDC-team/backend/assets/101400894/6a405eac-7a2f-46b3-9304-0bc35d660db9">

+ 컨테이너로 접속후 컨테이너 내에서 mysql 접속
+ 이후 mysql의 TEST 데이터베이스 내에서 테이블들 확인
	+ 쿼리 날려서 데이터 확인(각 테이블 별로 1개씩 데이터 입력해놨음)