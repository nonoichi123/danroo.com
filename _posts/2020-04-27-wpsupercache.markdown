---
layout: post
comments: true
title:  "WPSuperCache でトップページだけキャッシュされない"
date:   2020-04-27 00:00:00 +0000
categories: wordpress
---
WPSuperCache でキャッシュを有効化したところ、トップページだけキャッシュされない事象が発生しました。
別のプラグインの設定が悪さをしていました。原因と解消方法を載せておきます。

## 原因

原因は、多言語化対応用プラグイン「PolyLangs」が悪さをしていました。

## 解消方法

「PolyLangs」の設定にある、「ブラウザーの言語の検出」を無効化することで解消しました。

![PolyLangs設定](/assets/images/2020-04-27-wpsupercache/bd58d76e462f26d90a9154fdf671fbbf.png)

[参考] [https://wordpress.org/support/topic/preload-not-working-on-homepage/](https://wordpress.org/support/topic/preload-not-working-on-homepage/)

## WP Super Cache とは

初回アクセス時に静的なHTMLを生成し、2回目以降は、静的なHTMLを表示することで、ページ表示速度を改善するするプラグインです。
日本語化もある程度されており、簡単に使えるプラグインです。

▼プラグイン紹介ページ  
[https://ja.wordpress.org/plugins/wp-super-cache/](https://ja.wordpress.org/plugins/wp-super-cache/)