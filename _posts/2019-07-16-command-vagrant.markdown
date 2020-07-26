---
layout: post
comments: true
title:  "Vagrantコマンド集"
date:   2019-07-16 00:00:00 +0000
categories: Vagrant Command
---
Vagrant でよく使うコマンドの一覧です。

### Vagrantfile 作成

```
$ vagrant init
```

### Vagrant 環境 起動

```
$ vagrant up
```

### Vagrant 環境 停止

```
$ vagrant halt
```

### Vagrant 環境 再起動

```
$ vagrant reload
```

### Vagrant 環境 SSHログイン

```
$ vagrant ssh
Last login: Sun Jun 23 11:08:00 2019 from 10.0.2.2
[vagrant@local ~]$ su -
Password: vagrant
Last login: 日  6月 23 11:08:05 JST 2019 on pts/0
[root@local ~]# 
```

### Vagrant 環境　削除

```
$ vagrant destroy
```

### Vagrant 環境 box作成

```
$ vagrant package

```

### Vagrant 環境 パッケージ化

```
$ vagrant box add php-dev package.box
$ vagrant box list
```

### パッケージ化した環境を使った Vagrantfile 作成

```
$ vagrant init php-dev
```