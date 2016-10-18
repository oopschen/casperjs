FROM node:4.6.0

RUN useradd -m -s /bin/bash casperjs
USER casperjs

ENV PHATOMJS_VERSION=2.1.1 \
    PHATOMJS_HOME=~/phantomjs-2.1.1-linux-x86_64 \
    CASPERJS_HOME=~/.npm/casperjs \
    CASPERJS_VERSION=1.1.3

ENV PATH=$PHATOMJS_HOME/bin:$CASPERJS_HOME/bin/:$PATH

WORKDIR /home/casperjs

# make directory for temp work
RUN ls . && mkdir -p .temp/

# install phatomjs
RUN cd .temp/ && curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    && pwd && tar -xf -C /home/casperjs phantomjs-2.1.1-linux-x86_64.tar.bz2 &&  cd ..

# install casper
RUN npm install -g casperjs@1.1.3

# clean up
RUN rm -rf ./temp

ENTRYPOINT ["casperjs"]
CMD ["selftest"]
