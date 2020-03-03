FROM cloudron/base:1.0.0@sha256:147a648a068a2e746644746bbfb42eb7a50d682437cead3c67c933c546357617


# install nodejs
RUN mkdir -p /usr/local/node-10.15.3 && \
    curl -L https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-x64.tar.gz | tar zxf - --strip-components 1 -C /usr/local/node-10.15.3


# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red \
    && mkdir -p /app/data/nodes

WORKDIR /usr/src/node-red

RUN chown -R cloudron:cloudron /app/data
RUN chown -R cloudron:cloudron /app/data/nodes
RUN chown -R cloudron:cloudron /usr/src/node-red

USER cloudron

ENV PATH /usr/local/node-10.15.3/bin:$PATH

COPY package.json /usr/src/node-red/
RUN npm install
RUN npm config set cache /tmp/npm

# Expose port
EXPOSE 1880

# Set the default command to execute when creating a new container
CMD npm start -- --userDir /app/data --nodesDir /app/data/nodes
