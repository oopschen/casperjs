FROM node:4.6.0

RUN useradd -m -s /bin/bash casperjs
USER casperjs

ENV PHATOMJS_VERSION=2.1.1 \
    PHATOMJS_HOME=~/phantomjs-2.1.1-linux-x86_64 \
    CASPERJS_HOME=~/node_modules/casperjs \
    CASPERJS_VERSION=1.1.3

ENV PATH=$PHATOMJS_HOME/bin:$CASPERJS_HOME/bin:$PATH

WORKDIR /home/casperjs

# install phatomjs
RUN curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    && tar -xf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    && rm ./phantomjs-2.1.1-linux-x86_64.tar.bz2

# install casper
RUN npm install casperjs@1.1.3

ENTRYPOINT ["casperjs"]
CMD ["selftest"]
