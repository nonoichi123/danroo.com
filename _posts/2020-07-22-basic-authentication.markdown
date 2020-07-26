---
layout: post
comments: true
title:  ".htaccessでベーシック認証を行う"
date:   2020-07-22 00:00:00 +0000
categories: apache htaccess
---
.htaccessを使った、ベーシック認証の設定方法です。

## 実行環境

```html
Linux サーバ
```

## 設定方法

#### .htaccess に以下を追記します。

```ruby
AuthUserFile "/home/nonoichi/htpasswd/.htpasswd"
AuthName "Member Site"
AuthType BASIC
```

#### .htpasswd ファイルを作成します。

```ruby
$ htpasswd -n user1
New password: [パスワードを入力]
Re-type new password: [パスワードを再入力]
user1:$apr1$bgEUTdlb$1y7FaSRMtsifDq/Z4eNYp1
↑↑↑
出力された内容を.htpasswdのファイル名でサーバに保存する
```

ブラウザから作成する場合は、こちらが便利でした。

（参考）htpasswd作成サイト  
[https://www.luft.co.jp/cgi/htpasswd.php](https://www.luft.co.jp/cgi/htpasswd.php)


## ベーシック認証はhttpsで使うべき

ベーシック認証は、ID／パスワードを暗号化せずに送信します。

そのため、httpプロトコルで利用した場合、ネットワークを盗聴されると、ID／パスワードがわかってしまいますので、
httpsプロトコルで利用しないと認証の意味がありません。
