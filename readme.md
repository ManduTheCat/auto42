# 자동 42서울 테스트 프로그램
## 기능

- 자동 norminette 평가 (flag 포함)
- 자동 main.c 파일 생성
- 자동 컴파일 (flag 포함)
- 자동 실행

## 실행 방법

1. git clone (이 리포지터리의 주소) 으로 작업 영역에 클론하기
2. 디렉토리는 다른 테스트에 쓸 폴더와 경로가 같아야 함
ex) auto42/ c00/ c01
3. cd auto42 한 이후 sh test.sh (테스트할 폴더 이름) 으로 실행

## 알려진 문제들
1. 0$i 형식으로 이름을 다루기 때문에 ex10+부터는 오류 발생 가능
2. 그밖에도 많을 수도...
3. 오류나 버그는 slack 에 youkim으로 DM 보내주시면 감사하겠읍니다
