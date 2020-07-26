---
layout: post
comments: true
title:  "WordPress(ワードプレス)脆弱性診断を試してみる"
date:   2019-07-25 00:00:00 +0000
categories: WordPress
---
WordPress のセキュリティチェック方法を調べてみたら、  
URLを入力するだけで診断してくれるサイトがありました。

WPScanを使ってチェックしてくれているようです。  
簡単にできて、便利ですね。

[WordPress(ワードプレス)脆弱性診断 セキュリティースキャナ](https://wp-doctor.jp/blog/wordpress%E3%83%AF%E3%83%BC%E3%83%89%E3%83%97%E3%83%AC%E3%82%B9%E3%82%BB%E3%82%AD%E3%83%A5%E3%83%AA%E3%83%86%E3%82%A3%E3%83%BC%E3%82%B9%E3%82%AD%E3%83%A3%E3%83%8A%E3%83%BC/)


![Security Check Site](/assets/images/wordpress-securitycheck/001.png)

### 実行結果

試しに、「https://ja.wordpress.org/」を入力して、
実行してみたら、こんな感じでした。

![Security Check Result1](/assets/images/wordpress-securitycheck/002.png)

![Security Check Result2](/assets/images/wordpress-securitycheck/003.png)

### 結果からの考察

```
XML-RPCによるブルートフォースアタックを受ける可能性があります https://ja.wordpress.org/xmlrpc.php
```

xmlrpc.phpは、使っていないなら、削除しておくか、無効にするなどの対応をしておく方がよさそうですね。

また、使用しているバージョンは漏れているだろうという認識の上、  
常に最新状態にしておかないと怖いですね。