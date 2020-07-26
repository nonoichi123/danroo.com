---
layout: post
comments: true
title:  "独自ドメインメールをGmailで受信する"
date:   2019-07-29 00:00:00 +0000
categories: Gmail
---
独自ドメインのメールを、Gmailで送受信する手順となります。  
Gmailを既に利用していて、スマホ端末でメールを受信したいときには、便利な設定です。

### 実行環境

```
MacOS 10.14.6
Mac Google Chrome 75.0
```

Windows環境でも同様の手順で設定できます。

### 事前準備項目

システム管理者から以下の情報を提供してもらってください。

項目名|入力例
--|--
アカウントID|cs1234567
パスワード|password
受信サーバまたは、POPサーバ|mail.sample.com
受信サーバのポート番号|110
送信サーバまたは、SMTPサーバ|mail.sample.com
送信サーバのポート番号|587

### メール受信設定

右上部の「＊」をクリックし、「アカウントとインポート」タブを選択  
「メールアカウントを追加」をクリック

![image](/assets/images/mydomain-receive-from-gmail/001.png)

送受信したいメールアドレスを入力し、「次へ」

![image](/assets/images/mydomain-receive-from-gmail/002.png)

「他のアカウントからメールを読み込む」を選択し、「次へ」

![image](/assets/images/mydomain-receive-from-gmail/003.png)

メール受信設定を入力  
ユーザ名、パスワード、popサーバ、popサーバのポート番号を入力  

![image](/assets/images/mydomain-receive-from-gmail/004.png)

続いて、メール送信設定を行う

![image](/assets/images/mydomain-receive-from-gmail/005.png)

### メール送信設定

送信したメールに付与する表示名称を入力し、「次のステップ」をクリック

![image](/assets/images/mydomain-receive-from-gmail/006.png)

メール送信設定を入力  
smtpサーバ、smtpサーバのポート番号、ユーザ名、パスワードを入力  
「TLS」を選択し、「アカウントを追加」をクリック

![image](/assets/images/mydomain-receive-from-gmail/007.png)

設定している、gmailのメールボックスにメールが届くので、確認コードをチェックする

![image](/assets/images/mydomain-receive-from-gmail/008.png)

確認コードを入力

![image](/assets/images/mydomain-receive-from-gmail/009.png)

「名前」と「他のアカウントでメールを確認」の２項目に、  
メールアドレスが追加されていることを確認

![image](/assets/images/mydomain-receive-from-gmail/010.png)

### 署名設定

メールの末尾に自動で署名を入れる場合は、以下の設定を行う

入力し、末尾の「変更を保存」をクリック

![image](/assets/images/mydomain-receive-from-gmail/011.png)

メール作成画面で、自動的に署名を入ることを確認する

![image](/assets/images/mydomain-receive-from-gmail/012.png)


