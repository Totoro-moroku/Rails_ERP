# README

## ファイル構成
### 全体構成
```
ERP
├── README.md
├── docker-compose.yml
├── cilnet ← Next.js (Typescript)
└── server ← Ruby on Rails
```


### server構成 : 重要なものだけ
```
server
├── Dockerfile
├── app
│   ├── controllers
│   │    └── api
│   └── models
├── db
│    ├── seeds ← 初期データが入ってます
│    └── Schemafile ← テーブル構成
│
└── test ← まだ未対応
```
### client構成 : 重要なものだけ
```
client
├── Dockerfile
├── package.json
└── src
     └── pages ← 構成は再度考える

```

## 環境構築（back end & front end sides）
1. Docker環境構築
```
make first-build
```
2. DB作成 && テストデータインポート( [ridgepole](https://github.com/winebarrel/ridgepole) でSchemaの管理 )

```
make create-db
```


## Gem追加した場合
- dockerのserverが起動している場合
```
docker-compose exec server bundle install
```
- dockerのserverが起動していない場合
```
docker-compose run server bundle install
```


## Table追加

- [ridgepole](https://github.com/winebarrel/ridgepole)でschemaの管理をしているため、migrationは使用しません。

- modelをgenerateする場合、下記のように`--skip-migration` を忘れないようにしてください。

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