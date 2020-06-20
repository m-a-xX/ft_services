FROM alpine

RUN apk update
RUN apk add nginx
RUN mkdir /run/nginx/

COPY files/nginx.conf /etc/nginx/nginx.conf
#COPY files/index.html /var/lib/nginx/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]