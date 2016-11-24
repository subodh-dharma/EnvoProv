FROM node:6.2-onbuild

RUN python --version
RUN ls -la
RUN chmod +x setup.sh
RUN /usr/src/app/setup.sh
RUN which chef

