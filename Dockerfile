############################
#			               #	
#     Jenkins 			   #
# 			               #	
############################


FROM debian
MAINTAINER  Andrew "apravdyvyi@gmail.com"
ENV \  
    JAVA_HOME=/opt/java \
    JENKINS_MIRROR=http://mirrors.jenkins-ci.org/war-stable/latest \
    JAVA_OPTS="-Xmx768m -Xms256m -XX:MaxPermSize=768m" \
    JENKINS_WAR=/opt/war \
    JENKINS_HOME=/opt/jenkins \
    TIME_CREATE="27.06.2017" \
    JENKINS_USER="jenkins"

#Install 
RUN apt-get update -qq \
    && sed -i '1d' /etc/apt/sources.list \
    && echo "deb http://httpredir.debian.org/debian/ jessie main contrib" >> /etc/apt/sources.list \
    && apt-get update -qq && apt-get install -qqy java-package curl wget vim tar gzip git \
    && mkdir ${JENKINS_HOME} ${JAVA_HOME} ${JENKINS_WAR} \
    && curl -s -L ${JENKINS_MIRROR}/jenkins.war -o ${JENKINS_WAR}/jenkins.war \
    && curl -sL -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz -o ${JAVA_HOME}/jdk-8u131-linux-x64.tar.gz \
    && cd ${JAVA_HOME} && tar -xzf jdk-8u131-linux-x64.tar.gz && rm jdk-8u131-linux-x64.tar.gz \ 
    && groupadd -r jenkins -g 555 \
    && useradd -u 555 -r -g jenkins -d ${JENKINS_HOME} -s /bin/bash -c "User for jenkins" jenkins \
    && apt-get clean autoclean \
    && apt-get autoremove -yqq \
    && rm -rf  /var/lib/{apt,cache}/ 

ENV  PATH ${JAVA_HOME}/jdk1.8.0_131/jre/bin:$PATH

EXPOSE 8080

ENTRYPOINT ["java"] 
CMD        ["-help"] 
