FROM ruby:latest

RUN useradd --user-group --create-home --shell /bin/false ruby
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

RUN chmod -R 777 /usr/local/bundle

USER ruby
EXPOSE 2300