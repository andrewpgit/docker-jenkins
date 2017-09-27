# docker-jenkins
docker-jenkins
To quckly deploy Jenkins on the Linux.

 Usage: docker run 
========================================



    Usage 
   -------


<pre>
	docker run \
	-d \
	--name=name of counteiner \
	-v /local/path:/opt/jenkins \
	-p 8080:8080 \
 	 jenkins:v1 \ - [ build name of image ]
	 --jar /opt/war/jenkins.war 
<pre>

