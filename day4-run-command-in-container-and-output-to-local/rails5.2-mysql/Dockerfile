FROM ruby:2.5.0-slim
RUN apt-get update && apt-get install -qq -y build-essential nodejs --fix-missing --no-install-recommends
RUN gem install rails

RUN apt-get install -qq -y --fix-missing --no-install-recommends git 
RUN apt-get install -qq -y --fix-missing --no-install-recommends default-libmysqlclient-dev
#RUN apt-get install -qq -y --fix-missing --no-install-recommends sqlite3 libsqlite3-dev 
#RUN apt-get install -qq -y --fix-missing --no-install-recommends graphicsmagick

