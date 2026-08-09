# 1) 베이스 이미지: 공식 NGINX
FROM nginx:alpine

# 2) 내 HTML을 NGINX 기본 웹 루트로 복사
COPY index.html /usr/share/nginx/html/index.html

# 3) Nginx설정 파일 교체
COPY nginx.conf /etc/nginx/conf.d/default.conf