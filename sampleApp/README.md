README
実行手順（サーバサイド）
Docker環境構築 docker-compose build

bundle install docker-compose run web bundle install

DB作成 docker-compose run web bundle exec rails db:create

Schema適用 docker-compose run web bundle exec ridgepole -c config/database.yml -E {env} --apply -f db/Schemafile

{env} を環境名に、開発環境の場合は docker-compose run web bundle exec ridgepole -c config/database.yml -E development --apply -f db/Schemafile
seed追加

イベントデータ追加 docker-compose exec web bundle exec rails r db/seeds/user.rb

イベントデータ追加 docker-compose exec web bundle exec rails r db/seeds/transaction_type.rb

イベントデータ追加 docker-compose exec web bundle exec rails r db/seeds/entity.rb

イベントデータ追加 docker-compose exec web bundle exec rails r db/seeds/item.rb

サーバ起動 docker-compose up

実行手順（フロントエンド）
npm install docker-compose exec web bash -c "cd frontend && npm install"

npm run watch docker-compose exec web bash -c "cd frontend && npm run watch"

javascriptのファイルを追加した場合は、/frontend/src/javascripts/application.tsx へ import してください。

cssのファイルを追加した場合は、/frontend/src/stylesheets/application.scss へimport してください。

コンテナにログインする
App
docker exec -it $(docker ps -qf 'name=am-agentapp-rails_web') bash

DB
docker exec -it $(docker ps -qf 'name=am-agentapp-rails_db') bash

Gem追加した場合
docker-compose exec web bundle install

Table追加
ridgepoleでschemaの管理をしているため、migrationは使用しません。 modelをgenerateする場合、以下のように--skip-migration を忘れないようにしてください。
docker-compose exec web rails g model model_name --skip-migration

rpsecの実行
DBのマイグレート docker-compose exec web bundle exec ridgepole -c config/database.yml -E test --apply -f db/Schemafile

rspec実行 docker-compose run web bundle exec rspec

active admin
管理モデルの追加 docker-compose exec web bin/rails generate active_admin:resource {model}
for Heroku
heroku run bundle exec ridgepole -c config/database.yml -E production --apply -f db/Schemafile