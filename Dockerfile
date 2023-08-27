FROM ruby:alpine3.18 AS builder
RUN apk add \
  build-base \
  postgresql-dev
#ENV RAILS_ENV="production" 
#\
#    BUNDLE_WITHOUT="development"
COPY Gemfile* .
RUN bundle install 
FROM ruby:alpine3.18 AS runner
RUN apk add \
  tzdata \
  nodejs \
  postgresql-dev
WORKDIR /app
# We copy over the entire gems directory for our builder image, containing the already built artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . .
ENV RAILS_ENV=production
RUN bundle exec rails assets:precompile
EXPOSE 3000
RUN bundle exec whenever -i 
CMD ["rails", "server", "-b", "0.0.0.0"]