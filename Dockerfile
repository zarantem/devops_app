FROM ruby:2.6.1

WORKDIR /devops_app
COPY .. .

RUN gem install bundler -v 2.1.4
RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]