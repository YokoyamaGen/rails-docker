FROM node:14.8.0-stretch as node

FROM ruby:3.0.2

ENV YARN_VERSION 1.22.4
COPY --from=node /opt/yarn-v$YARN_VERSION /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client

WORKDIR /rails-docker
COPY Gemfile Gemfile.lock /rails-docker/
RUN bundle install