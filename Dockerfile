FROM ruby:2.3.1
RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /computercore
WORKDIR /computercore
ADD Gemfile /computercore/Gemfile
ADD Gemfile.lock /computercore/Gemfile.lock
RUN bundle install
ADD . /computercore
