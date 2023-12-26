FROM nginx:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y

WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/

ADD https://github.com/AndreasMarjen/CapstoneCloud-225410044/raw/main/WebStatis.zip .
RUN unzip WebStatis.zip
RUN mv WebStatis/* .
RUN rm -rf WebStatis WebStatis.zip

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
