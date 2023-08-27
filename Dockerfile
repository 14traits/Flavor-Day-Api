# Stage 1: Build
FROM ruby:alpine3.18 as builder
RUN apk add \
  build-base \
  postgresql-dev
COPY Gemfile* .
RUN bundle install

# Stage 2: Devlop Local 

# Stage 3: Prod Build
FROM builder as prod-build
COPY . /app
RUN rails assets:precompile
RUN bundle config set --local without 'development test' && \
  bundle config set --local path /rubygems
RUN bundle install

# Stage 4: Prod (image for produciton)
FROM ruby:alpine3.18 as prod
RUN mkdir /app
WORKDIR /app
COPY --from=prod-build . .
#COPY --from=prod-build /app /app
#COPY --from=prod-build /rubygems /rubygems
#COPY --from=prod-build /lib /lib
RUN bundle config set --local without 'development test' && \
  bundle config set --local path /rubygems
EXPOSE 3000
#RUN bundle install
RUN bundle exec whenever -i 
CMD ["rails", "s", "-b",  "0.0.0.0"]
#CMD ["bundle" "rails", "s", "-b",  "0.0.0.0"]
#ENV RAILS_ENV=production
#RUN bundle exec rails assets:precompile