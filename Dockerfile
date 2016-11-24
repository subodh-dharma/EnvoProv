FROM node:6.2-onbuild

RUN ls -la
RUN chmod +x setup.sh
RUN setup.sh

