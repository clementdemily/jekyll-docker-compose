FROM ruby:2.6.3-alpine3.8
WORKDIR /app
COPY Gemfile .

RUN apk add --no-cache g++ gcc make musl-dev && \
  bundle install && \
	gem install jekyll eventmachine && \
  bundle update

COPY . .

EXPOSE 4000
EXPOSE 35729

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000", "--livereload" ]
