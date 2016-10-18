# casperjs
A casperjs with phatomjs makes life easier.

## version
phantomjs: 2.1.1
casperjs: 1.1.3

## User
casperjs

## Usage
docker run --entrypoint="phantomjs" oopschen/phantomjs -v 
docker run -v \`pwd\`:/home/casperjs/work oopschen/phantomjs ./work/[scriptfile]
