FROM ruby:2.6

LABEL maintainer="Hossam Hammady <github@hammady.net>"

# prepare system
RUN apt-get update -qq && \
    apt-get install -y \
        build-essential \
        libpq-dev \
        nodejs \
        texlive \
        texlive-latex-base

ENV RAILS_ENV development
ENV RACK_ENV development
ENV BUNDLE_GITHUB__HTTPS true
ENV BUNDLE_JOBS 4

WORKDIR /home

ADD Gemfile* /home/
RUN bundle install

RUN useradd -d /home webuser && \
    chown webuser:webuser /home
USER webuser

EXPOSE 8080

CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
