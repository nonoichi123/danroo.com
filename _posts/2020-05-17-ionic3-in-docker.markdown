---
layout: post
comments: true
title:  "Ionic3系の環境をDockerで構築する"
date:   2020-05-17 00:00:00 +0000
categories: Docker Ionic3
---
Ionic3系の環境をDockerで構築したので、設定を残しておきます。

## 実行環境

```
macOS Catalina 10.15.4
Docker Desktop 2.2.0.0
ionic-cli 5.4.16
ionic-angular 3.9.9
```

## docker-compose.yml

```ruby
version: "3"
services:
  web:
    build: ./docker/ionic
    privileged: true
    tty: true
    volumes:
      - ./:/var/www/html
    ports:
      - 8100:8100
    container_name: dra
    networks:
      - dra_app_net
networks:
  dra_app_net:
```

## Dockerfile

```ruby
FROM centos:7.6.1810

RUN yum -y update

RUN yum -y install epel-release
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

RUN yum -y upgrade

RUN yum -y install https://rpm.nodesource.com/pub_10.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm
RUN yum install -y gcc-c++ make
RUN yum install -y nodejs

RUN npm install -g ionic
RUN npm install -g cordova

ENV HOST 0.0.0.0

WORKDIR /var/www/html
```

## Dockerコンテナ起動

```ruby
$ docker-compose build
$ docker-compose up -d
$ docker-compose exec web bash
```

## Ionicプロダクト作成

```ruby
# ionic start -type=ionic-angular
```

#### 実行結果

```ruby
Every great app needs a name! 

Please enter the full name of your app. You can change this at any time. To bypass this prompt next time, supply name,
the first argument to ionic start.

? Project name: app

Let's pick the perfect starter template! 

Starter templates are ready-to-go Ionic apps that come packed with everything you need to build your app. To bypass this
prompt next time, supply template, the second argument to ionic start.

? Starter template: tabs
✔ Preparing directory ./app - done!
✔ Downloading and extracting tabs starter - done!

Installing dependencies may take several minutes.
```

## Ionic バージョン確認

```ruby
# ionic info
```

#### 実行結果

```ruby
Ionic:

   Ionic CLI          : 5.4.16 (/usr/lib/node_modules/ionic)
   Ionic Framework    : ionic-angular 3.9.9
   @ionic/app-scripts : 3.2.4

Utility:

   cordova-res : not installed
   native-run  : not installed

System:

   NodeJS : v10.20.1 (/usr/bin/node)
   npm    : 6.14.4
   OS     : Linux 4.19


  ────────────────────────────────────────────────────────────

           Ionic CLI update available: 5.4.16 → 6.9.1

     The package name has changed from ionic to @ionic/cli!

             To update, run: npm uninstall -g ionic
                 Then run: npm i -g @ionic/cli

  ────────────────────────────────────────────────────────────
```

## Ionic起動

```ruby
# ionic serve -port 8100 -address=0.0.0.0
```

## 起動確認

http://localhost:8100 でIonicの画面が表示されることを確認する
