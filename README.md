# README

## ファイル構成
### 全体構成
```
ERP
├── README.md
├── docker-compose.yml
├── cilnet
└── server
```
### server構成 : 重要なものだけ
```
server
├── app
│   ├── controllers
│   │    └── api
│   └── models
├── db
│    ├── seeds ← 初期データが入ってます
│    └── Schemafile ← テーブル構成
└── test ← まだ未対応
```
### clinet構成 : 重要なものだけ
```
server
└── app
```
これから構成を考えます.....


## 実行手順（back end & front end sides）
1. Docker環境構築
```
docker-compose build
```
2. bundle install
```
docker-compose run server bundle install
```
3. npm install
```
docker-compose run clinet npm install
```

4. サーバ起動
```
docker-compose up
```

下記の処理はコードを流して処理したいな

5. DB作成
```
docker-compose run server bundle exec rails db:create
```

6. Schema適用([ridgepole](https://github.com/winebarrel/ridgepole)でSchemaの管理してます)

    * Templete (`{env}`を環境名に置き換えてください）
    ```
    docker-compose run server bundle exec ridgepole -c config/database.yml -E {env} --apply -f db/Schemafile
    ```

    * 例） `{env}` を環境名に、開発環境`(development)`の場合は
    ```
    docker-compose run server bundle exec ridgepole -c config/database.yml -E development --apply -f db/Schemafile
    ```


7. seed追加
    * Templete (`{file_name}`をファイル名に置き換えてください）
    ```
    docker-compose exec server bundle exec rails r db/seeds/{file_name}
    ```

     * 例） `{env}` ファイル名が`entity.rb`の場合は
    ```
    docker-compose exec server bundle exec rails r db/seeds/entity.rb
    ```

## Gem追加した場合
```
docker-compose exec server bundle install
```

## Table追加

- [ridgepole](https://github.com/winebarrel/ridgepole)でschemaの管理をしているため、migrationは使用しません。

modelをgenerateする場合、以下のように`--skip-migration` を忘れないようにしてください。

```
docker-compose exec server rails g model {model_name} --skip-migration
```

## rpsecの実行
1. DBのマイグレート
```
docker-compose exec server bundle exec ridgepole -c config/database.yml -E test --apply -f db/Schemafile
```

1. rspec実行
```
docker-compose run server bundle exec rspec
```

## active admin
1. 管理モデルの追加
```
docker-compose exec server bin/rails generate user:resource {model}
```