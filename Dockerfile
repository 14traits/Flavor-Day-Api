### STAGE ONE: BUILD ###
FROM ruby:3.1.2-alpine
RUN apk update && apk upgrade --available && sync
RUN apk add libpq-dev
ADD Gemfile ./
ADD Gemfile.lock ./
RUN apk --update add --virtual build-dependencies ruby-dev build-base && \
  gem install bundler --no-document
#RUN bundle config set --local without development:test && \
# apk del build-dependencies
RUN apk update \
  && apk add build-base \
  tzdata
ADD . /app
ADD . /lib
RUN bundle install
# RUN chown -R nobody:nogroup /app
# USER nobody
ENV PORT 3000
EXPOSE 3000

WORKDIR /app
# CMD bundle exec whenever --update-crontab && cron -f
RUN bundle exec whenever -i 
CMD rails s 