# jenkins-jbc
This repo is used as a sample to start the learning with Jenkins and Python execution. 
Note that Jenkins default Docker image (jenkins/jenkins) doesn't contains Python3, nor the default, neither the jenkins-alpine. 
in order to have it working, it's needed to add the Python packages in the docker image, build, then run it. 

## to create a Docker file with python

```
RUN apk add python3 \
        && curl -O https://bootstrap.pypa.io/get-pip.py \
        && python3 get-pip.py
RUN if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
 if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
 rm -r /root/.cache
RUN pip3 install alpine==1.0.14
RUN apk add pkgconf
RUN apk add build-base
RUN apk add python3-dev
```

## to build an image
``` docker build -t jenkins-jbc:latest . ```

## to run the image (-> container)

``` 
docker run --name jenkins-jbc --restart=on-failure --detach   --network jenkins --env DOCKER_HOST=tcp://docker:2376   --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1   --publish 8080:8080 --publish 50000:50000   --volume jenkins-data:/var/jenkins_home   --volume jenkins-docker-certs:/certs/client:ro   jenkins-jbc
``` 
