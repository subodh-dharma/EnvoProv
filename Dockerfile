FROM node:6.2-onbuild

# Linking nodejs and node - required for wit ai token
RUN ln -s /usr/bin/nodejs /usr/bin/node
#RUN chmod +x setup.sh

# Installing chef and knife
RUN wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.19.6-1_amd64.deb
RUN dpkg -i chefdk_0.19.6-1_amd64.deb > /dev/null
RUN chef gem install knife-block > /dev/null
#RUN /usr/src/app/setup.sh

# Installing mongodb
#RUN apt-get update
#RUN apt-get -y install mongodb

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org
COPY ./mongodb.service /etc/systemd/system/
RUN systemctl start mongodb
RUN systemctl enable mongodb
RUN ufw allow from 127.0.0.1/32 to any port 27017

# Running mongodb service
#RUN service mongod start
