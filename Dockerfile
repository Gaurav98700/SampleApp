FROM ubuntu:16.04  //BaseImage
//Label Provides metadata
LABEL owner='Gaurav'  \
      version=1.0.0
      
//Installing Apache server      
RUN apt-get update -y   
RUN apt-get install apache2 -y
RUN apt-get install wget -y            //to install app as zip we need to install wget cmd
RUN apt-get install unzip -y            //to unzip

//Now download code from GIT keep code in tmp location in docker file
WORKDIR /tmp            

RUN wget https://github.com/javahometech/javahome-app/archive/master.zip

RUN unzip master.zip

//Move this code to apache server(Apache server deployment directory is /var/www/html)
RUN cp -r javahome-app-master/*  /var/www/html/   //create a folder and keep all files there after unziping

EXPOSE 8080

CMD ["apachectl","-D","FOREGROUND"]


/*To build Image based on docker file
in cmd
docker build -t 

*/
