FROM 667347940230.dkr.ecr.us-east-1.amazonaws.com/beenverifiedinc-ruby:2.6.6-buster-slim-jemalloc

MAINTAINER Patrick Tulskie <patrick@beenverified.com>

RUN apt-get update \
    && apt-get install -y git build-essential libgsl0-dev \
    && rm -rf /var/lib/apt/lists/*

RUN /usr/local/bin/gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock treat.gemspec /app/

COPY . /app

RUN rm -rf .git

RUN bundle install

RUN rake treat:install

