# コピペでOK, app_nameもそのままでOK
# 19.01.20現在最新安定版のイメージを取得
FROM ruby:2.5.3

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /usr/src/app_server
WORKDIR ${APP_ROOT}

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
COPY ["./Gemfile","./Gemfile.lock", "./"]

# Gemfileのbundle install
RUN bundle install

ADD . $APP_ROOT

# DBの作成からSchemafileの読み込み → テストデータのインポート
# RUN bundle exec rails db:create && \
#     bundle exec ridgepole -c config/database.yml -E development --apply -f db/Schemafile && \
#     bundle exec rails r db/seeds/entity.rb && \
#     bundle exec rails r db/seeds/sublist_type.rb && \
#     bundle exec rails r db/seeds/user.rb
