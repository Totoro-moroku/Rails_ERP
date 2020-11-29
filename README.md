# README
## 実行手順（back end side）
1. Docker環境構築
```
docker-compose build
```
2. bundle install
```
docker-compose run backend bundle install
```

3. DB作成
```
docker-compose run backend bundle exec rails db:create
```

4. Schema適用([ridgepole](https://github.com/winebarrel/ridgepole)でSchemaの管理してます)

    * Templete (`{env}`を環境名に置き換えてください）
    ```
    docker-compose run backend bundle exec ridgepole -c config/database.yml -E {env} --apply -f db/Schemafile
    ```

    * 例） `{env}` を環境名に、開発環境`(development)`の場合は
    ```
    docker-compose run backend bundle exec ridgepole -c config/database.yml -E development --apply -f db/Schemafile
    ```


5. seed追加
    * Templete (`{file_name}`をファイル名に置き換えてください）
    ```
    docker-compose exec backend bundle exec rails r db/seeds/{file_name}
    ```

     * 例） `{env}` ファイル名が`entity.rb`の場合は
    ```
    docker-compose exec backend bundle exec rails r db/seeds/entity.rb
    ```

6. サーバ起動
`docker-compose up`

## 実行手順（フロントエンド）
1. npm install
`docker-compose exec dockee bash -c "cd frontend && npm install"`

1. npm run watch
`docker-compose exec backend bash -c "cd frontend && npm run watch"`

1. javascriptのファイルを追加した場合は、`/frontend/src/javascripts/application.tsx` へ import してください。
1. cssのファイルを追加した場合は、`/frontend/src/stylesheets/application.scss` へimport してください。

## Gem追加した場合
```
docker-compose exec backend bundle install
```

## Table追加

- [ridgepole](https://github.com/winebarrel/ridgepole)でschemaの管理をしているため、migrationは使用しません。

modelをgenerateする場合、以下のように`--skip-migration` を忘れないようにしてください。

```
docker-compose exec backend rails g model {model_name} --skip-migration
```

## rpsecの実行
1. DBのマイグレート
```
docker-compose exec backend bundle exec ridgepole -c config/database.yml -E test --apply -f db/Schemafile
```

1. rspec実行
```
docker-compose run backend bundle exec rspec
```

## active admin
1. 管理モデルの追加
```
docker-compose exec backend bin/rails generate user:resource {model}
```