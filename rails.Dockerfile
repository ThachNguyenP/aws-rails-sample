FROM ruby:2.5.3
LABEL “maintainer”=“viral@fakemail.com”
LABEL “app_type”=“backend”
LABEL “service_type”=“API”
USER root
ENV APP /usr/src/app
ENV RAIL_ENV development
RUN mkdir -p $APP
RUN apt-get -y update && apt-get install -y --no-install-recommends \
libgmp-dev \
gcc make git \
postgresql-client \
dnsutils \
libpq-dev libglib2.0-dev build-essential patch zlib1g-dev liblzma-dev \
&& rm -rf /var/lib/apt/lists/*
WORKDIR $APP
COPY Gemfile $APP/Gemfile
COPY Gemfile.lock $APP/Gemfile.lock
RUN gem install bundler -v 2.1.4
RUN bundle install
COPY . $APP
RUN apt-get purge -y --auto-remove \
gcc make git \
libpq-dev libglib2.0-dev build-essential patch zlib1g-dev liblzma-dev \
&& rm -rf /var/lib/apt/lists/*
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
