---
layout: post
comments: true
title:  "WP REST APIを利用不可にする"
date:   2020-07-21 00:00:00 +0000
categories: wordpress
---
Wordpress4.7以降から搭載されたREST API。
使っていないため、無効にする方法を調べました。

wordpressの設定で無効にしたかったのですが、
簡単にできないようなので、.htaccessで対応しました。

## 実行環境

```html
WordPress 5.4.2
```

## 反映方法

.htaccess に以下を追記する。

```ruby
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteCond %{REQUEST_URI} ^/wp-json/
RewriteCond %{REQUEST_URI} ^/oembed/
RewriteCond %{QUERY_STRING} rest_route=
RewriteRule ^$ /? [R=404,L]
</IfModule>
```
