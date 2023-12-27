FROM nginx:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y

WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/

ADD https://github.com/AndreasMarjen/CapstoneCloud-225410044/raw/main/CapstoneCloud-225410044.zip .
RUN unzip CapstoneCloud-225410044.zip
RUN mv CapstoneCloud-225410044/* .
RUN rm -rf CapstoneCloud-225410044 CapstoneCloud-225410044.zip

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
