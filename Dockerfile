FROM ruby:alpine3.18 AS builder
RUN apk add \
  build-base \
  postgresql-dev
COPY Gemfile* .
#RUN bundle install --without development test
ENV BUNDLER_WITHOUT development test
RUN bundle install --deployment
FROM ruby:alpine3.18 AS runner
RUN apk add \
  tzdata \
  nodejs \
  postgresql-dev
WORKDIR /app
# We copy over the entire gems directory for our builder image, containing the already built artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . .
EXPOSE 3000
RUN bundle exec whenever -i 
CMD ["rails", "server", "-b", "0.0.0.0"]