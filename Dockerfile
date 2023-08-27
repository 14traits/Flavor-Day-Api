FROM ruby:alpine3.18
RUN apk update && apk upgrade --available && sync
RUN apk add libpq-dev

ADD Gemfile ./
ADD Gemfile.lock ./

RUN apk --update add --virtual build-dependencies ruby-dev build-base && \
  gem install bundler --no-document
RUN apk update \
  && apk add build-base \
  tzdata

ADD . /app
ADD . /lib

RUN bundle install

ENV PORT 3000
EXPOSE 3000
WORKDIR /app

RUN bundle exec whenever -i 
CMD ["rails", "s", "-b",  "0.0.0.0"]
