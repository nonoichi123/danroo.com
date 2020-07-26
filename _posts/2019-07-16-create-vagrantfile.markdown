---
layout: post
comments: true
title:  "Vagrantfileだけでphp環境を構築する"
date:   2019-07-16 00:00:00 +0000
categories: Vagrant VirtualBox
---
boxファイルを共有して、チームメンバー内で開発環境するのも良いのですが、  
boxファイルはサイズが大きくなってしまうので、Vagrantfileだけでphp環境を構築できるよう、  
初期起動スクリプトを追加したVagrantfileを作成しました。

### 実行環境

```
macOS Mojave 10.14.5
VirtualBox 6.0.8
VirtualBox Extension Pack 6.0.8
Vagrant 2.2.5
```

### 構築したサーバのOS、ミドルウェア

```
CentOS7
Apache2.4.6
mod_ssl
php7
composer
nodejs, npm
```

### Vagantfile

主な記載内容
- VirtualBox Guest Addition のバージョンがVagrantと不一致の場合に、自動アップデートを行う
- cpuコア2、メモリ2GBを確保
- 初期で利用するboxファイルは、centos7を利用
- プライベートIPアドレスを「192.168.33.10」を指定
- ホスト名は、「local.danroo.com」を指定
- ローカルファイルと同期
- 同期されたファイルは、48（apacheユーザ）、777（アクセス権限）を指定
- 初回起動時のみ、shellスクリプトを実行する処理を記載
  timezone〜Apache〜phpなどをセットアップ
- 全ての起動処理が完了後、apacheを再起動

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #config.vbguest.auto_update = false
  config.vm.box = "centos/7" # https://app.vagrantup.com/centos/boxes/7
  config.vm.box_version = "1902.01"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "local.danroo.com"
  config.vm.synced_folder "./danroo.com", "/virtual/develop/public_html/danroo.com", 
  mount_options: ['uid=48', 'gid=48', 'dmode=777','fmode=777']


  config.vm.provider :virtualbox do |vb|
      vb.name = "danroo"
      vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "2", "--ioapic", "on"]
  end


  config.vm.provision "shell", inline: <<-EOT
        # timezone
        cp -p /usr/share/zoneinfo/Japan /etc/localtime

        # history format
        HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ';

        # selinux
        cp -p /virtual/develop/public_html/danroo.com/provision-script/etc/selinux /etc/sysconfig/selinux
        setenforce 0


        # Apache
        yum -y install httpd-2.4.6 mod_ssl
        yum -y install epel-release
        rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

        systemctl enable httpd.service


        chown vagrant:vagrant /etc/httpd/conf/httpd.conf
        cp /virtual/develop/public_html/danroo.com/provision-script/etc/camplog-jp.conf /etc/httpd/conf.d/danroo.com.conf
        cp /virtual/develop/public_html/danroo.com/provision-script/etc/keyfile201907p /etc/pki/tls/private/keyfile201907p
        cp /virtual/develop/public_html/danroo.com/provision-script/etc/danroo.com.crt /etc/pki/tls/certs/danroo.com.crt
        cp /virtual/develop/public_html/danroo.com/provision-script/etc/ca-bundle.ca /etc/pki/tls/certs/ca-bundle.ca


        # php
        yum -y install --enablerepo=remi,remi-php70 php php-devel php-mbstring php-mysqli php-xml

        # composer
        curl -sS https://getcomposer.org/installer | php
        mv composer.phar /usr/local/bin/composer


        # nodejs, npm
        yum -y install nodejs npm
  EOT


  config.vm.provision :shell, run: "always", :inline => <<-EOT
        service httpd restart
  EOT
end
```

### セットアップ手順

#### VirtualBox インストール

```
ローカルPCのOSに合わせて、ダウンロードおよびインストールを行なう。

[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
```

#### VirtualBox Oracle VM VirtualBox Extension Pack　インストール

```
VirtualBox のダウンロードリンクの下あたりに記載されている、
Extension Packのダウンロードおよびインストールを行なう。

[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
```

#### Vagrant　インストール

```
Vagrant をダウンロードおよびインストールを行なう。

[https://www.vagrantup.com/](https://www.vagrantup.com/)
```

#### 設置したい場所へ移動

```
$ cd /Users/[xxxx]/danrooProject
```

#### ソース配置

```
$ ls /Users/[xxxx]/danrooProject/Vagrantfile
$ ls /Users/[xxxx]/danrooProject/danroo.com
```

#### VirtualBox Guest Addition インストール

```
$ vagrant plugin install vagrant-vbguest
```

#### Vagrant 環境 起動

```
$ vagrant up
```

#### hosts 設定

```
hostsへ以下を登録

192.168.33.10 local.danroo.com
```

#### サイト表示確認

```
http://local.danroo.com
```