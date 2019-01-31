# docker-jenkins
docker-jenkins

 Usage:  
========================================

To quckly deploy Jenkins on the Linux.

<pre>
    To Build Image.
    
    Clone the repo.
    
    git clone [ as usual ]

    docker build -t jenkins:version .


Run a container

docker run \
      -d \
      --name=name of container \
      -v /local/path:/opt/jenkins \
      -p 8080:8080 \
      jenkins:latest \ - [ build name of image ]
	  
<pre>

