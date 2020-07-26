---
layout: post
comments: true
title:  "Docker でWordPress環境を作る"
date:   2019-07-25 00:00:00 +0000
categories: WordPress Docker
---
Docker を使って、WordPress環境を作りましたので、
Dockerのインストールから、WordPress初期画面表示までの流れをまとめました。

### 実行環境

```
MacOS 10.14.5
Docker 2.0.0.3
WordPress 5.2.2
```

### Docker ダウンロード

- 会員登録またはログインを行う

-「Get started with Docker Desktop」ボタンをクリック

![Docker Site](/assets/images/setup-wordpress-in-docker/001.png)

- 「Download Docker Desktop for Mac」ボタンをクリックして、[Docker](https://www.docker.com/) のダウンロードを行う

![Docker Site](/assets/images/setup-wordpress-in-docker/002.png)

### Docker インストール

- ダウンロードされたら、dmgファイルを展開し、アプリケーションフォルダに移動

- 起動して、ログインを行う

![Docker Site](/assets/images/setup-wordpress-in-docker/003.png)

### WordPress ダウンロード

WprdPressをダウンロードする

![Docker Site](/assets/images/setup-wordpress-in-docker/004.png)

### Docker起動設定ファイルを作成

Docker起動設定ファイルを作成します。  
Docker Composeという機能を利用します。

```
$ vi docker-compose.yml
```

```
version: '2'

services:
   db:
     image: mysql:5.6
     volumes:
       - db_data:/var/lib/mysql
     ports:
      - "3306:3306"
     environment:
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wp_user
       MYSQL_PASSWORD: password
       MYSQL_ROOT_PASSWORD: password
   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8080:80"
     volumes:
       - ./src:/var/www/html
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wp_user
       WORDPRESS_DB_PASSWORD: password
volumes:
    db_data:
```

この設定で、以下のことを行なっています。  
・mysql5.6とwordpressのDockerイメージを取得  
・DB接続設定は、ユーザ名「wp_user」、パスワード「password」、  
　データベース「wordpress」、Rootパスワード「password」を指定します。  
・./src ディレクトリを、Dockerサーバの/var/www/html にマウントします。  

### Dockerサーバ用ファイルを配置

WordPressを解凍し、wordpress → srcにディレクトリ名を変更します。

### サーバ起動

Dockerを起動します。
-d は、バックエンド起動オプションです。

```
$ docker-compose up -d
```

### 起動確認

正常に起動されたら、起動確認をします。  
Stateが「Up」となっていたら、正常に起動されています。

```
$ docker-compose ps
        Name                       Command               State           Ports         
---------------------------------------------------------------------------------------
wordpress_db_1          docker-entrypoint.sh mysqld      Up      0.0.0.0:3306->3306/tcp
wordpress_wordpress_1   docker-entrypoint.sh apach ...   Up      0.0.0.0:8080->80/tcp  
```

### WordPress 表示確認

- http://localhost:8080 にアクセスし、正常に表示されたら、OKです。

![Docker Site](/assets/images/setup-wordpress-in-docker/005.png)

### コマンド集

#### Docker イメージ起動

```
$ docker-compose up -d
```

#### Docker イメージ停止

```
$ docker-compose stop
```

#### Docker イメージ起動（stop時に利用）

```
$ docker-compose start
```

#### Docker イメージ再起動

```
$ docker-compose restart
```

#### Docker イメージ削除

```
$ docker-compose rm
```

#### Docker ログ確認

```
$ docker-compose logs
```

#### Docker イメージ確認

```
$ docker-compose images
```