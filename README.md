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
```bat
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

## 3. Docker 설치 및 기본 점검
```bat
// 도커 버전
cloudsoswift0540@c4r1s1 workspace % docker --version
Docker version 29.4.0, build 9d7ad9f
// 도커 상태
cloudsoswift0540@c4r1s1 workspace % docker info     
Client:
 Version:    29.4.0
 Context:    orbstack
 Debug Mode: false
 Plugins:
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.33.0
    Path:     /Users/cloudsoswift0540/.docker/cli-plugins/docker-buildx
  compose: Docker Compose (Docker Inc.)
    Version:  v5.1.2
    Path:     /Users/cloudsoswift0540/.docker/cli-plugins/docker-compose

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 29.4.0
 Storage Driver: overlayfs
  driver-type: io.containerd.snapshotter.v1
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 77c84241c7cbdd9b4eca2591793e3d4f4317c590
 runc version: c241c0bb5e60a8e8c1b2e53d4eca8d0068d8d57e
 init version: de40ad0
 Security Options:
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.19.13-orbstack-gbd1dc07b8cf4
 Operating System: OrbStack
 OSType: linux
 Architecture: x86_64
 CPUs: 6
 Total Memory: 15.67GiB
 Name: orbstack
 ID: 5fa467f8-e72c-4295-aff9-6916d7d79f6f
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Experimental: false
 Insecure Registries:
  ::1/128
  127.0.0.0/8
 Live Restore Enabled: false
 Product License: Community Engine
 Default Address Pools:
   Base: 192.168.97.0/24, Size: 24
   Base: 192.168.107.0/24, Size: 24
   Base: 192.168.117.0/24, Size: 24
   Base: 192.168.147.0/24, Size: 24
   Base: 192.168.148.0/24, Size: 24
   Base: 192.168.155.0/24, Size: 24
   Base: 192.168.156.0/24, Size: 24
   Base: 192.168.158.0/24, Size: 24
   Base: 192.168.163.0/24, Size: 24
   Base: 192.168.164.0/24, Size: 24
   Base: 192.168.165.0/24, Size: 24
   Base: 192.168.166.0/24, Size: 24
   Base: 192.168.167.0/24, Size: 24
   Base: 192.168.171.0/24, Size: 24
   Base: 192.168.172.0/24, Size: 24
   Base: 192.168.181.0/24, Size: 24
   Base: 192.168.183.0/24, Size: 24
   Base: 192.168.186.0/24, Size: 24
   Base: 192.168.207.0/24, Size: 24
   Base: 192.168.214.0/24, Size: 24
   Base: 192.168.215.0/24, Size: 24
   Base: 192.168.216.0/24, Size: 24
   Base: 192.168.223.0/24, Size: 24
   Base: 192.168.227.0/24, Size: 24
   Base: 192.168.228.0/24, Size: 24
   Base: 192.168.229.0/24, Size: 24
   Base: 192.168.237.0/24, Size: 24
   Base: 192.168.239.0/24, Size: 24
   Base: 192.168.242.0/24, Size: 24
   Base: 192.168.247.0/24, Size: 24
   Base: fd07:b51a:cc66:d000::/56, Size: 64
 Firewall Backend: iptables

WARNING: DOCKER_INSECURE_NO_IPTABLES_RAW is set
```

## 4. Docker 기본 운영 명령 수행
### 이미지

```bat
cloudsoswift0540@c4r1s1 workspace % docker image ls 
                                                            i Info →   U  In Use
IMAGE   ID             DISK USAGE   CONTENT SIZE   EXTRA
cloudsoswift0540@c4r1s1 workspace % docker images   
                                                            i Info →   U  In Use
IMAGE   ID             DISK USAGE   CONTENT SIZE   EXTRA
cloudsoswift0540@c4r1s1 workspace % docker image pull alpine 
Using default tag: latest
latest: Pulling from library/alpine
55afa1ecc21d: Pull complete 
56dceff11b33: Download complete 
f5124fb579e2: Download complete 
Digest: sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b
Status: Downloaded newer image for alpine:latest
docker.io/library/alpine:latest
cloudsoswift0540@c4r1s1 workspace % docker images                  
                                                            i Info →   U  In Use
IMAGE           ID             DISK USAGE   CONTENT SIZE   EXTRA
alpine:latest   28bd5fe8b56d         14MB         3.93MB  
cloudsoswift0540@c4r1s1 workspace % docker image rm alpine
Untagged: alpine:latest
Deleted: sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

```

- `docker image ls`(또는 `docker images`): 모든 `최상위(Top-level) 이미지`와 해당 레포지토리, 태그(버전), 크기를 표시하는 명령어
    - `[REPOSITORY[:TAG]]`을 지정하여 특정 레포지토리의, 특정 태그의 이미지만 표시할 수도 있으며, `--filter` 옵션을 사용해 필터링도 가능.
- `docker image pull [OPTIONS] NAME[:TAG|@DIGEST]`(또는 `docker pull`): [Docker Hub 레지스트리](https://hub.docker.com/)로부터 이미지를 다운로드하는 명령어
    - `NAME`을 통해 어떤 이미지를 다운로드 받을지, `NAME:TAG`를 통해 어떤 이미지의 어떤 태그를 다운로드 받을지 지정 가능함.
- `docker image rm [OPTIONS] IMAGE`: 호스트 노드로부터, 하나 이상의 이미지를 삭제 및 태그 해제하는 명령어.
### 컨테이너
```bat
cloudsoswift0540@c4r1s1 workspace % docker container create alpine
f84f98cd2f8af5aba24d082ec105e4327229cc795f35ae430ca80c03c454cc58
cloudsoswift0540@c4r1s1 workspace % docker container ls -a
CONTAINER ID   IMAGE     COMMAND     CREATED         STATUS    PORTS     NAMES
f84f98cd2f8a   alpine    "/bin/sh"   7 seconds ago   Created             festive_herschel
cloudsoswift0540@c4r1s1 workspace % docker container start f84f
f84f
cloudsoswift0540@c4r1s1 workspace % docker container ls -a     
CONTAINER ID   IMAGE     COMMAND     CREATED          STATUS                     PORTS     NAMES
f84f98cd2f8a   alpine    "/bin/sh"   29 seconds ago   Exited (0) 5 seconds ago             festive_herschel
cloudsoswift0540@c4r1s1 workspace % docker container run alpine
cloudsoswift0540@c4r1s1 workspace % docker container ls -a     
CONTAINER ID   IMAGE     COMMAND     CREATED          STATUS                      PORTS     NAMES
0cf8f425d677   alpine    "/bin/sh"   3 seconds ago    Exited (0) 2 seconds ago              busy_aryabhata
f84f98cd2f8a   alpine    "/bin/sh"   49 seconds ago   Exited (0) 25 seconds ago             festive_herschel
cloudsoswift0540@c4r1s1 workspace % docker container stop 0cf8
0cf8
cloudsoswift0540@c4r1s1 workspace % docker container ls -a    
CONTAINER ID   IMAGE     COMMAND     CREATED              STATUS                      PORTS     NAMES
0cf8f425d677   alpine    "/bin/sh"   17 seconds ago       Exited (0) 16 seconds ago             busy_aryabhata
f84f98cd2f8a   alpine    "/bin/sh"   About a minute ago   Exited (0) 40 seconds ago             festive_herschel
cloudsoswift0540@c4r1s1 workspace % docker container rm 0cf8
0cf8
cloudsoswift0540@c4r1s1 workspace % docker container ls -a  
CONTAINER ID   IMAGE     COMMAND     CREATED              STATUS                      PORTS     NAMES
f84f98cd2f8a   alpine    "/bin/sh"   About a minute ago   Exited (0) 52 seconds ago             festive_herschel
```
- `docker container ls`(또는 `docker ps`): 존재하는 컨테이너들의 목록을 표시하는 명령어.
    - 기본값으로 현재 실행중인 컨테이너만 표시하며, `-a` 플래그를 사용할 경우 모든 컨테이너를 표시
- `docker container create IMAGE`(또는 `docker create`): 지정된 이미지를 기반으로 새로운 컨테이너를 생성하는 명령어.
    - 지정된 이미지 위에 '쓰기 가능한 컨테이너 레이어'를 생성하고, 지정된 명령어를 실행할 준비함.
    - 컨테이너를 생성하지만, 실행은 하지 않음.
- `docker container start CONTAINER`(또는 `docker start`): 멈춰있는 하나 이상의 컨테이너를 시작하는 명령어.
    - `-a` 옵션을 통해 컨테이너의 표준 출력(STDOUT), 표준 에러(STDERR), signal에 붙거나, `-i`옵션을 통해 표준 입력(STDIN)에 붙을 수 있음.
- `docker container run IMAGE [COMMAND]`(또는 `docker run`): 지정된 이미지를 기반으로, 새 컨테이너를 만들어 명령어를 실행하는 명령어.
    - `create` + `start` + `attach` 와 같음
- `docker container stop`(또는 `docker stop`): 컨테이너 내부의 메인 프로세스에게 `SIGTERM` 신호와 `SIGKILL` 신호를 보내는 명령어.
    - `SIGTERM`는 프로세스에게 현재 진행중인 작업을 종료할 것을, `SIGKILL`는 프로세스를 강제로 종료할 것을 의미함
- `docker container rm CONTAINER`(또는 `docker rm`): 하나 이상의 컨테이너를 지우는 명령어
- `docker container exec CONTAINER`(또는 `docker exec`): 실행중인 컨테이너에 새 명령을 실행하도록 하는 명령어.
    - 위 명령어를 통해 실행한 명령은 컨테이너의 메인 프로세스(pid 1)가 실행중인 동안만 실행 됨.
### 운영