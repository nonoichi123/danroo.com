---
layout: post
comments: true
title:  "Heroku のProcfileが動作してくれない"
date:   2019-07-23 00:00:00 +0000
categories: Heroku
---
Procfile がうまく認識してくれない事象がありました。

Procfileの記載を間違うと、キャッシュが効いてしまうのか、修正してもすぐに反映しなかった。  
なんでだろう・・・？

### 実行環境

```
MacOS 10.14.3
Github連携
```

### エラー内容

「heroku open」でWeb表示確認を行なったところ、
以下のエラーが出てしまった。

```
AH01276: Cannot serve directory /app/: No matching DirectoryIndex (index.php,index.html,index.htm) found, and server-generated directory index forbidden by Options directive, referer: https://dashboard.heroku.com/

```

### 対処法

「public/」の記載が「pubic/」になっていたので、修正したのだが、
エラーが解消されない。

以前はこの記載で、正しく動いていたと思うのだが、、、

```
web:vendor/bin/heroku-php-apache2 public/
```

「public/」の前に、「./」をつけたり、  
「heroku-php-apache2」から、「heroku-php-nginx」に切り替えたりしていたら、  
動くようになった。。


```
web:vendor/bin/heroku-php-apache2 ./public/
```
 

```
web:vendor/bin/heroku-php-nginx ./public/
```

キャッシュでも効いていたのだろうか。。
とりあえず、解消してよかった。