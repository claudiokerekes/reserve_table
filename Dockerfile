ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION

RUN apt-get update -qq && \
    apt-get install -y build-essential libvips bash bash-completion libffi-dev tzdata postgresql nodejs npm yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man  # Set an environment variable where the Rails app is installed to inside of Docker image

ENV RAILS_ROOT /my_app
  # Set working directory
WORKDIR $RAILS_ROOT

  # Setting env up
ENV RACK_ENV='development'
ENV RAILS_ENV='development'
ENV BUNDLE_WITHOUT="development:test"
ENV RAILS_LOG_TO_STDOUT enabled
ENV RAILS_SERVE_STATIC_FILES enabled

  # Adding gems
COPY Gemfile Gemfile.lock ./
RUN bundle install
  # Adding project files
COPY . .

#RUN bundle exec bootsnap precompile --gemfile app/ lib/

RUN SECRET_KEY_BASE="39898ASD9ASDJA9SDJA9SDJA9SD" && bundle exec rails assets:precompile


EXPOSE 3000
WORKDIR $RAILS_ROOT
RUN ["chmod", "+x", "./entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]