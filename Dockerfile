FROM resin/raspberrypi3-debian

RUN sudo apt-get update
# Install curl and https apt transport
RUN sudo apt-get -y install curl apt-transport-https
RUN sudo apt-get install -y build-essential

# Install node.js 8.11
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# Add repo and its GPG key
RUN curl -sSL https://dtcooper.github.io/raspotify/key.asc | sudo apt-key add -v -
RUN echo 'deb https://dtcooper.github.io/raspotify jessie main' | sudo tee /etc/apt/sources.list.d/raspotify.list

# Install package
RUN sudo apt-get update
RUN sudo apt-get -y install raspotify 
 
# Defines our working directory in container 
WORKDIR /usr/src/app 
 
# Copies the package.json first for better cache on later pushes 
COPY package.json package.json 
 
# This install npm dependencies on the resin.io build server, 
# making sure to clean up the artifacts it creates in order to reduce the image size. 
RUN JOBS=MAX npm install --production --unsafe-perm && npm cache verify && rm -rf /tmp/* 
 
# This will copy all files in our root to the working  directory in the container 
COPY . ./ 
 
# Enable systemd init system in container 
ENV INITSYSTEM on 
 
# server.js will run when container starts up on the device 
CMD ["npm", "start"] 
