---
layout: post
comments: true
title:  "Jekyll でサイトを作る"
date:   2019-07-17 00:00:00 +0000
categories: Jekyll
---
Jekyll はプレーンテキストで静的サイトやブログが作成できるサービスです。  
GitHub pagesやFirebase Hosting、Heroku、レンタルサーバなどの  
様々な環境で簡単に公開できるようになっています。

また、[Jekyll Theme](http://jekyllthemes.org/){:target="_blank"} で様々なテンプレートが選べます。

### 実行環境

```
MacOS 10.14.3
ruby ruby 2.3.7p456 (2018-03-28 revision 63024) [universal.x86_64-darwin18]
gem 2.5.2.3
```

### Jekyll インストール

```
$ sudo gem install bundler jekyll
```

### Jekyll のプロダクト作成

```
$ jekyll new sample.danroo.com
```

### ローカルサーバ起動

起動することで、_site ディレクトリに静的ファイル一式が出力されます。  
github pagesの場合は、pushするだけで表示されます。  
firebaseとherokuの場合は、DocumentRoot を「_site」に設定して、deployすれば表示されます。  
レンタルサーバの場合は、_site配下をアップロードすればOKです。

```
$ cd ./sample.danroo.com
$ bundle exec jekyll serve
```

### Github pages でカスタムドメインを使いたい場合の設定

_siteと同じ階層に、CNAMEファイルを作成し、  
カスタムドメイン名のみ記載して、保存

```
sample.danroo.com
```

### 本番環境にだけ反映したいタグを設定したい場合（GoogleAnalyticsなど）

```javascript
{％ if jekyll.environment == "production" ％}
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-00000000-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag() { dataLayer.push(arguments); }
  gtag('js', new Date());
  gtag('config', 'UA-00000000-1');
</script>
{％ endif ％}
```

envを指定して、build

```
$ JEKYLL_ENV=production bundle exec jekyll build
```
