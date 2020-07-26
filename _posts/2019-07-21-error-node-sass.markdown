---
layout: post
comments: true
title:  "ionic serve実行時に、node-sassのエラーが出た"
date:   2019-07-21 00:00:00 +0000
categories: NodeJs
---
ionic serve をしたときに、node_modules/node-sass/vendor 見つからないというエラーが発生しましたので、
node-sassのインストールとリビルドを行いました。

エラーログが残っていなくて、ブログにするとそれだけの話なのですが、
一応、自分のつまづいた箇所なので、残しておきます。


### 実行環境

```
MacOS 10.14.3
```

### 対処法

```
$ npm install -g node-sass
$ npm rebuild
```
