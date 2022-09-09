### STAGE ONE: BUILD ###
FROM ruby:3.1.2-alpine
ADD Gemfile ./
ADD Gemfile.lock ./
RUN apk update && apk upgrade --available && sync
RUN apk add libpq-dev
RUN apk --update add --virtual build-dependencies ruby-dev build-base && \
  gem install bundler --no-ri --no-rdoc && \
  # cd /app ; bundle install && \
  cd /app ; bundle install --without develoepment test && \
  apk del build-dependencies
ADD . /app
ADD . /lib
RUN chown -R nobody:nogroup /app
USER nobody
ENV PORT 3000
EXPOSE 3000

WORKDIR /app
CMD bundle exec whenever --update-crontab && cron -f
ENTRYPOINT [ "/bin/echo", "Hello friend, this is your api in docker!" ]