############################
#			               #	
#     Jenkins 			   #
# 			               #	
############################


FROM debian
MAINTAINER  Andrew 
ENV \  
    JAVA_HOME=/opt/java \
    JENKINS_MIRROR=http://mirrors.jenkins-ci.org/war-stable/latest \
    JAVA_OPTS="-Xmx1024m -Xms256m -XX:MaxPermSize=1024m" \
    JENKINS_WAR=/opt/war \
    JENKINS_HOME=/opt/jenkins \
    TIME_CREATE="31.01.2019" \
    JENKINS_USER="jenkins" \
    JAVA_VERSION="jdk-8u202-linux-x64" \
    JAVA_LINK="https://download.oracle.com/otn-pub/java/jdk/8u202-b08/1961070e4c9b4e26a04e7f5a083f551e"


#Install 
RUN apt-get update -qq \
    && sed -i '1d' /etc/apt/sources.list \
    && echo "deb http://httpredir.debian.org/debian/ stretch main contrib" >> /etc/apt/sources.list \
    && apt-get update -qq && apt-get install -qqy java-package curl wget vim tar gzip git \
    && mkdir ${JENKINS_HOME} ${JAVA_HOME} ${JENKINS_WAR} \
    && curl -s -L ${JENKINS_MIRROR}/jenkins.war -o ${JENKINS_WAR}/jenkins.war \
    && curl -sL -H "Cookie: oraclelicense=accept-securebackup-cookie" ${JAVA_LINK}/${JAVA_VERSION}.tar.gz -o ${JAVA_HOME}/${JAVA_VERSION}.tar.gz \
    && cd ${JAVA_HOME} && tar -xzf ${JAVA_VERSION}.tar.gz && rm ${JAVA_VERSION}.tar.gz \ 
    && groupadd -r jenkins -g 555 \
    && useradd -u 555 -r -g jenkins -d ${JENKINS_HOME} -s /bin/bash -c "User for jenkins" jenkins \
    && apt-get clean autoclean \
    && apt-get autoremove -yqq \
    && rm -rf  /var/lib/{apt,cache}/ 

ENV  PATH ${JAVA_HOME}/jdk*/jre/bin:$PATH

EXPOSE 8080

ENTRYPOINT ["java"] 
CMD        ["-jar", "/opt/war/jenkins.war"] 
