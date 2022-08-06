FROM ruby:3.1.1

WORKDIR /neko_cal

# bundlerのバージョンが最新になってないと警告が出るので明示的に最新バージョンをインストールする
RUN gem install bundler

# bundle install時にキャッシュを利用してビルド時間を短縮するため、先にGemfileを転送してinstallする
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
