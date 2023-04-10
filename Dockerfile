FROM jenkins/jenkins:lts-alpine
USER root
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
USER jenkins

