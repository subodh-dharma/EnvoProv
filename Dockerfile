FROM node:6.2-onbuild

RUN python --version
RUN chmod +x setup.sh
RUN curl -L https://omnitruck.chef.io/install.sh
RUN chef gem install knife-block
RUN /usr/src/app/setup.sh


