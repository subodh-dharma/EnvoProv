FROM node:6.2-onbuild

RUN pwd
RUN chmod +x setup.sh
RUN setup.sh

