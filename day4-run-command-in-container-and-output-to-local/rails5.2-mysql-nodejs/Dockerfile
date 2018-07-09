FROM ruby:2.5

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

CMD [ "bash" ]

RUN apt-get install -qq -y --fix-missing --no-install-recommends default-libmysqlclient-dev
RUN apt-get install -qq -y --fix-missing --no-install-recommends sqlite3 libsqlite3-dev 
#RUN apt-get install -qq -y --fix-missing --no-install-recommends graphicsmagick

RUN gem install rails -v 5.2.0
