# workspace

## 프로젝트 개요

## 실행환경

## 수행항목 체크 리스트

## 1. 터미널 조작 로그 기록
```bat
// 현재 위치 확인
cloudsoswift0540@c4r1s1 workspace % pwd
/Users/cloudsoswift0540/Documents/workspace
// 파일 목록 확인(숨김 파일 포함)
cloudsoswift0540@c4r1s1 workspace % ls -a
.		..		.git		README.md
// 디렉토리 이동
cloudsoswift0540@c4r1s1 workspace % cd /Users/cloudsoswift0540/Documents 
// 빈 파일 생성. `touch A`는 A라는 이름의 빈 파일을 생성하겠다는 뜻
cloudsoswift0540@c4r1s1 Documents % touch emptyFile.txt
// 생성 되었는지 확인
cloudsoswift0540@c4r1s1 Documents % ls -a
.		..		.localized	emptyFile.txt	workspace
// 파일 복사. `cp A B`는 A 파일을 B라는 이름으로 복사하겠다는 뜻 
cloudsoswift0540@c4r1s1 Documents % cp emptyFile.txt emptyFile2.txt
// 복사되었는지 확인
cloudsoswift0540@c4r1s1 Documents % ls -a 
.		..		.localized	emptyFile.txt	emptyFile2.txt	workspace
// 이동/이름 변경. `mv A B`는 A라는 파일을 B로 이동하거나, B라는 이름으로 파일명 변경
// ex) `mv a.txt Documents/a.txt`: 현재 디렉토리의 a.txt 파일을 Documents 폴더로 이동
// ex) `mv a.txt b.txt`: 현재 디렉토리의 a.txt 파일의 이름을 b.txt로 변경
cloudsoswift0540@c4r1s1 Documents % mv emptyFile2.txt changedName.txt
// 이름 변경되었는지 확인
cloudsoswift0540@c4r1s1 Documents % ls
changedName.txt	emptyFile.txt	workspace
// 파일 삭제. `rm A` 는 A라는 파일을 삭제
cloudsoswift0540@c4r1s1 Documents % rm changedName.txt 
// 삭제되었는지 확인
cloudsoswift0540@c4r1s1 Documents % ls
emptyFile.txt	workspace
// 파일 내용 확인. `cat A`는 A 파일의 내용을 출력
cloudsoswift0540@c4r1s1 Documents % cat emptyFile.txt 
cloudsoswift0540@c4r1s1 Documents % cd ..
cloudsoswift0540@c4r1s1 ~ % cd Documents/workspace 
cloudsoswift0540@c4r1s1 workspace % cat README.md 
# workspace
cloudsoswift0540@c4r1s1 workspace % cd ..
// 파일 생성. `echo 'A' > B`는 A라는 내용을 포함하는 B라는 파일 생성
cloudsoswift0540@c4r1s1 Documents % echo 'Hello World!' > hello_world.txt
cloudsoswift0540@c4r1s1 Documents % ls                                   
emptyFile.txt	hello_world.txt	workspace
cloudsoswift0540@c4r1s1 Documents % cat hello_world.txt 
Hello World!
cloudsoswift0540@c4r1s1 Documents % 
```

## 2. 권한 실습 및 증거 기록
```
// 초기 권한 상태 확인
cloudsoswift0540@c4r1s1 workspace % ls -l
total 8
-rw-r--r--  1 cloudsoswift0540  cloudsoswift0540  2393 Jul 27 19:19 README.md
drwxr-xr-x  2 cloudsoswift0540  cloudsoswift0540    64 Jul 27 20:07 empty_folder
// 1. 기호 모드 (Symbolic mode)
// 기호 모드는 `chmod [ugoa] [-+=] [permissions]` 와 같은 조합으로 권한을 변경하는 방식.
// [ugoa]는 파일 소유자(u), 파일 그룹에 속한 다른 사용자(g), 파일 그룹에 속하지 않은 다른 사용자(o),
// 모든 사용자(a) 를 지정.
// [-+=] 는 파일 권한 비트를 추가할지(+), 제거할지(-), 대체할지(=)를 지정.
// [permissions]는 rwxXst 집단에 속하는 0개 이상의 문자.
// r은 읽기, w는 쓰기, x는 실행(또는 디렉토리 검색)을 뜻함.
// `u+x`는 파일 소유자에게 실행 권한을 추가할 것임을 뜻함
cloudsoswift0540@c4r1s1 workspace % chmod u+x README.md 
// 변경되었는지 확인
cloudsoswift0540@c4r1s1 workspace % ls -l
total 8
-rwxr--r--  1 cloudsoswift0540  cloudsoswift0540  2393 Jul 27 19:19 README.md
drwxr-xr-x  2 cloudsoswift0540  cloudsoswift0540    64 Jul 27 20:07 empty_folder
// `g-r`는 '파일 그룹에 속한 다른 사용자'에게 읽기 권한을 제거할 것임을 뜻함.
cloudsoswift0540@c4r1s1 workspace % chmod g-r README.md 
// 변경되었는지 확인
cloudsoswift0540@c4r1s1 workspace % ls -l
total 8
-rwx---r--  1 cloudsoswift0540  cloudsoswift0540  2393 Jul 27 19:19 README.md
drwxr-xr-x  2 cloudsoswift0540  cloudsoswift0540    64 Jul 27 20:07 empty_folder
// `o=rw`는 '파일 그룹에 속하지 않는 다른 사용자'의 권한을 '읽기/실행 가능' 으로 대체할 것을 뜻함.
cloudsoswift0540@c4r1s1 workspace % chmod o=rw README.md
// 변경 되었는지 확인
cloudsoswift0540@c4r1s1 workspace % ls -l
total 8
-rwx---rw-  1 cloudsoswift0540  cloudsoswift0540  2393 Jul 27 19:19 README.md
drwxr-xr-x  2 cloudsoswift0540  cloudsoswift0540    64 Jul 27 20:07 empty_folder
// 2. 숫자 모드 (numeric mode)
// 숫자 모드는 `chmod [ugo] 파일명`으로 권한을 설정
// 정확히는, ugo 위치에 각각에 대한 권한 비트합(0~7 사이의 값)을 위치시킴
// 권한 비트합은 읽기(4), 쓰기(2), 실행(1)의 합을 뜻함.
// ex) 5 = 읽기+실행, 6 = 읽기 + 쓰기
// 즉, 만약 `chmod 733 file.txt` 와 같이 명령을 실행했다면,
// '파일 소유자'(u)에게는 읽기+쓰기+실행 권한을,
// '파일 그룹에 속한 다른 사용자'(g)에게는 쓰기+실행 권한을 지정
// '파일 그룹에 속하지 않은 다른 사용자'(o)에게는 쓰기+실행 권한을 지정
// 예시로, 아래 644는 u에게 읽기+쓰기 권한을, g와 o에게는 읽기 권한을 부여한 것임
cloudsoswift0540@c4r1s1 workspace % chmod 644 README.md
// 변경 되었는지 확인
cloudsoswift0540@c4r1s1 workspace % ls -l
total 8
-rw-r--r--  1 cloudsoswift0540  cloudsoswift0540  2393 Jul 27 19:19 README.md
drwxr-xr-x  2 cloudsoswift0540  cloudsoswift0540    64 Jul 27 20:07 empty_folder
// 다음으로, 디렉토리의 권한을 수정
// 아래 711은 u에게 읽기+쓰기+실행 권한을, g와 o에게는 실행 권한을 부여
cloudsoswift0540@c4r1s1 workspace % chmod 711 empty_folder 
// 반영 되었는지 확인
cloudsoswift0540@c4r1s1 workspace % ls -l
total 8
-rw-r--r--  1 cloudsoswift0540  cloudsoswift0540  2393 Jul 27 19:19 README.md
drwx--x--x  2 cloudsoswift0540  cloudsoswift0540    64 Jul 27 20:07 empty_folder
// g에게 읽기 권한 추가
cloudsoswift0540@c4r1s1 workspace % chmod g+r empty_folder 
// 반영 되었는지 확인
cloudsoswift0540@c4r1s1 workspace % ls -l
total 8
-rw-r--r--  1 cloudsoswift0540  cloudsoswift0540  2393 Jul 27 19:19 README.md
drwxr-x--x  2 cloudsoswift0540  cloudsoswift0540    64 Jul 27 20:07 empty_folder
// o에게 읽기+쓰기 권한 부여
cloudsoswift0540@c4r1s1 workspace % chmod o=rx empty_folder 
// 반영 되었는지 확인
cloudsoswift0540@c4r1s1 workspace % ls -l
total 8
-rw-r--r--  1 cloudsoswift0540  cloudsoswift0540  2393 Jul 27 19:19 README.md
drwxr-xr-x  2 cloudsoswift0540  cloudsoswift0540    64 Jul 27 20:07 empty_folder
```

