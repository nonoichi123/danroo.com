---
layout: post
comments: true
title:  "Dockerコマンド集（docker-compose含む）"
date:   2020-05-17 00:00:00 +0000
categories: Docker
---
よく利用するDockerコマンドとdocker-composeコマンドをまとめました。

## dockerコンテナを起動する

```ruby
docker-compose up -d
```

## dockerコンテナを停止する

```ruby
docker-compose down
```

## dockerコンテナをビルドする

```ruby
docker-compose build
```

## dockerコンテナの起動確認

```ruby
docker-compose ps
```

## dockerコンテナにシェルログインする

web の部分がコンテナ名を指している

```ruby
docker-compose exec [web] bash
```

## dockerコンテナに対して、シェルスクリプトを実行する

web コンテナに対して、./docker/test.sh を実行する

```ruby
docker-compose exec web sh /docker/test.sh
```

## 全ての停止中のコンテナ、ボリューム、ネットワーク、イメージをまとめて削除する

```ruby
docker system prune
```

## 使用している永続化ボリュームリスト

```ruby
docker volume ls
```

## 永続化ボリュームの削除

docker volume rm [www_mysql-data] ←永続化ボリュームを指定する
