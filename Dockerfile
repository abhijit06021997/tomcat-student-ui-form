# tomcat-student-ui-form dockerfile
FROM amazonlinux
RUN yum update -y && yum install -y java-17-amazon-corretto.x86_64 -y && yum install -y unzip && yum install -y wget && yum install -y maven
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.90/bin/apache-tomcat-9.0.90.zip
RUN unzip apache-tomcat-9.0.90.zip
RUN mv apache-tomcat-9.0.90 /mnt/tomcat/
RUN chmod 770 /mnt/tomcat/bin/catalina.sh
COPY . /app
WORKDIR /app
RUN mvn clean package
RUN cp target/*.war /mnt/tomcat/webapps/student.war
EXPOSE 8080
CMD ["/mnt/tomcat/bin/catalina.sh", "run"]
