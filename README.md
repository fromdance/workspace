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

