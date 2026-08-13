# 1) 베이스 이미지: 공식 NGINX
FROM nginx:alpine

# 2) 내 HTML을 NGINX 기본 웹 루트로 복사
COPY src/ /usr/share/nginx/html/

# 3) Nginx설정 파일 교체
# COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY default.conf.template /etc/nginx/templates/

# 4) 컨테이너의 80번 포트를 공개해야 함을 기록(별도 프로토콜 명시가 없다면 기본은 TCP)
# (아래 명령어는 실제로 포트를 공개하지 않음. 단지 문서 역할)
EXPOSE 80