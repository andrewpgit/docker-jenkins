# docker-jenkins
docker-jenkins

 Usage:  
========================================

To quckly deploy Jenkins on the Linux.

<pre>
    Clone the repo.
    
    git clone [ as usual ]
    
    Build container.

    docker build -t jenkins:v1 .


Run a container

docker run \
	-d \
	--name=name of container \
	-v /local/path:/opt/jenkins \
	-p 8080:8080 \
 	 jenkins:v1 \ - [ build name of image ]
	 -jar /opt/war/jenkins.war 
<pre>

