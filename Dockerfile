FROM ruby:3.0.0

ENV APP_PATH /myapp
# ENV RAILS_ENV=production

RUN apt-get update -qq && apt-get install -y build-essential libxslt-dev libxml2-dev curl && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y default-libmysqlclient-dev nodejs yarn

WORKDIR $APP_PATH
ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]