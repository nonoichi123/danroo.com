---
layout: post
comments: true
title:  "facebook Graph API を使って、フィードを取得する"
date:   2019-07-28 00:00:00 +0000
categories: Facebook GraphApi
---
facebook Graph API を使って、Facebookページのフィード情報を取得する流れを整理しました。

### Facebookの個人アカウントとFacebookページの違いについて

facebook は、個人アカウントとFacebookページという２つの投稿方法があります。

個人アカウントは、個人名で登録し、facebookにログインしている人しか見れないページです。  
facebookを利用する上で、必ず登録するアカウントです。  

Facebookページは、昔はファンページと呼ばれていたようですが、  
facebookにログインしていない方にも見てもらいたいときに使うアカウントです。  
企業やサービス名の他、個人名でも登録することが可能なアカウントです。

　|個人アカウント|Facebookページ
--|--|--
登録方法|個人名で登録|企業名、サービス名、個人名で登録
閲覧者|Facebookにログインしている人のみ|誰でも閲覧可能
検索結果表示（Google, Yahooなど）|されない|される

2018年9月の個人情報流出事件を契機に、GraphAPIの利用が厳しくなりました。  
現在、以下の項目以外を利用したい場合は、投稿レビュー申請が必須となりました。

- email
- public_profile（利用者の氏名、プロフィール写真、性別、年齢層などの基本情報）
- user_friends（利用者の友達で、アプリを利用している人のリストへのアクセス）

### facebook for developers でアプリを作成する

https://developers.facebook.com/apps/

![Add App](/assets/images/wordpress-facebookapi/001.png)

新しいアプリIDを作成

![Add App](/assets/images/wordpress-facebookapi/002.png)

本アプリの利用用途を設定

![Add App](/assets/images/wordpress-facebookapi/003.png)

アプリIDとapp secret をメモしておく

![Add App](/assets/images/wordpress-facebookapi/004.png)

プラットフォームを追加をクリックし、「ウェブサイト」を選択

![Add App](/assets/images/wordpress-facebookapi/005.png)

ウェブサイトのサイトURLを設定

![Add App](/assets/images/wordpress-facebookapi/006.png)

### アクセストークンを発行する

https://developers.facebook.com/tools/accesstoken/

「アクセス許可を与えてください」をクリック

![Regist Token](/assets/images/wordpress-facebookapi/007.png)

![Regist Token](/assets/images/wordpress-facebookapi/008.png)

User Token のデバッグボタンをクリック

![Regist Token](/assets/images/wordpress-facebookapi/009.png)

これで、アクセストークンは発行されましたが、有効期限が2ヶ月以内となっています。  
そのため、無期限のアクセストークンを発行します。

### 無期限のアクセストークンを発行する

アプリ認証を行う

パラメータは、設定 > ベーシックで設定した内容を使う

```
https://www.facebook.com/dialog/oauth?client_id={アプリID}&redirect_uri={サイトURL}  

```


URL例：
```
https://www.facebook.com/dialog/oauth?client_id=41000000000000&redirect_uri=http://localhost:8080/  

```

「OK」を押すと、

![Regist Token](/assets/images/wordpress-facebookapi/020.png)

サイトURLが表示され、URLに認証コード（codeパラメータ）が付与されています

![Regist Token](/assets/images/wordpress-facebookapi/021.png)

この認証コードを使って、アクセストークンを取得します。  
それ以外のパラメータは、設定 > ベーシックで設定した内容を引き続き使う

```
https://graph.facebook.com/oauth/access_token?client_id={アプリID}&redirect_uri={サイトURL}&client_secret={app secret}&code={認証コード}  

```

access_token が発行されたことを確認

![Regist Token](/assets/images/wordpress-facebookapi/022.png)

これを使って、無期限のアクセストークンを発行

```
https://graph.facebook.com/me/accounts?access_token={ユーザアクセストークン}  

```

![Regist Token](/assets/images/wordpress-facebookapi/023.png)


アクセツストークンデバッガーページで、発行されたアクセストークンを確認する

https://developers.facebook.com/tools/debug/accesstoken/


![Regist Token](/assets/images/wordpress-facebookapi/024.png)

有効期限が「受け取らない」になっていることを確認できたら、OK

### アクセス権限を設定する

グラフAPIエクスプローラを開く

https://developers.facebook.com/tools/explorer

![Graph Explorer](/assets/images/wordpress-facebookapi/010.png)

送信ボタンを押すと、ログインユーザの情報が返ってくる

![Graph Explorer](/assets/images/wordpress-facebookapi/011.png)

「ユーザアクセストークンを取得する」を選択

![Graph Explorer](/assets/images/wordpress-facebookapi/012.png)

manage_pages をチェックする

![Graph Explorer](/assets/images/wordpress-facebookapi/013.png)

「ログイン」をクリック

![Graph Explorer](/assets/images/wordpress-facebookapi/014.png)

対象のfacebookページを選択して、「次へ」

![Graph Explorer](/assets/images/wordpress-facebookapi/015.png)

apiで取得したいfacebookページを選択する

![Graph Explorer](/assets/images/wordpress-facebookapi/016.png)

レビュー申請はひとまずあとで行うこととし、「完了」をクリック

![Graph Explorer](/assets/images/wordpress-facebookapi/017.png)

「OK」を押すと、設定完了です。

![Graph Explorer](/assets/images/wordpress-facebookapi/018.png)

### api接続確認を行う

GET / v3.3 / の後のURLは以下を入力する

```
[App ID]/feed?limit=30&locale=ja&fields=id,message,permalink_url,created_time,attachments
```

送信ボタンを押すと、フィード情報が返ってくる

![Graph Explorer](/assets/images/wordpress-facebookapi/019.png)
