FROM node:6.2-onbuild
# Linking nodejs and node - required for wit ai token
RUN ln -s /usr/bin/nodejs /usr/bin/node
#RUN chmod +x setup.sh

# Installing chef and knife
RUN wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.19.6-1_amd64.deb
RUN dpkg -i chefdk_0.19.6-1_amd64.deb
RUN chef gem install knife-block
#RUN /usr/src/app/setup.sh

# Installing mongodb server locally
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update
RUN apt-get install -y mongodb-org=3.0.13 mongodb-org-server=3.0.13 mongodb-org-shell=3.0.13 mongodb-org-mongos=3.0.13 mongodb-org-tools=3.0.13
RUN echo "mongodb-org hold" | dpkg --set-selections
RUN echo "mongodb-org-server hold" | dpkg --set-selections
RUN echo "mongodb-org-shell hold" | dpkg --set-selections
RUN echo "mongodb-org-mongos hold" | dpkg --set-selections
RUN echo "mongodb-org-tools hold" | dpkg --set-selections

# Running mongodb service
RUN service mongo start
