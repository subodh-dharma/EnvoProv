FROM node:6.2-onbuild

RUN python --version
RUN chmod +x setup.sh
RUN wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.19.6-1_amd64.deb
RUN sudo dpkg -i chefdk_0.19.6-1_amd64.deb
RUN chef gem install knife-block
RUN /usr/src/app/setup.sh


