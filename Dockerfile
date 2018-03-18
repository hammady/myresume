FROM ruby:1.9

LABEL maintainer="Hossam Hammady <github@hammady.net>"

# prepare system
RUN apt-get update -qq && \
    apt-get install -y \
        build-essential \
        libpq-dev \
        nodejs \
        texlive \
        texlive-latex-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production
ENV RACK_ENV production
ENV BUNDLE_GITHUB__HTTPS true
ENV BUNDLE_JOBS 4

WORKDIR /home

ADD Gemfile* /home/

RUN bundle install --deployment --without development:test

COPY / /home/

RUN bundle exec rake assets:precompile

RUN useradd -m webuser
USER webuser

EXPOSE 8080

CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
