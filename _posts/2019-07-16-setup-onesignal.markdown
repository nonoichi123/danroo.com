---
layout: post
comments: true
title:  "OneSignal を使って、Webプッシュ配信を行う"
date:   2019-07-16 00:00:00 +0000
categories: OneSignal WebPush
---
Ionic アプリで、OneSignal を使ってWebプッシュ配信を行う手順です。

無料プランでは以下の制限がありますが、初期フェーズでは十分なスペックかと考えます。
- Webプッシュは30,000ユーザまで
- スマホへのプッシュは制限なし
- In-Appメッセージング機能は不可
- サポートは制限あり
- ユーザ権限、配信リストアップロードなどの一部機能制限あり

[OneSignal][onesignal] とは、無料で始められるプッシュ配信サービスです。

### 実行環境

```
macOS Mojave 10.14.5
nodejs v12.6.0
Ionic 3.9.5
```

### セットアップ手順

#### Google Chrome, Firefox, Edge

- OneSignalセットアップを行う

[OneSignal](https://app.onesignal.com/signup){:target="_blank"}

- 「Add App」をクリック

![Add App](/assets/images/setup-onesignal/000.png)

- OneSignal用の識別名（サイト名やアプリ名など）を入力

![Add App](/assets/images/setup-onesignal/001.png)

- Web Push を選択

![Add App](/assets/images/setup-onesignal/002.png)

- Typical Site を選択

![Add App](/assets/images/setup-onesignal/003-1.png)

- Webプッシュ配信をしたいサイト名とサイトURLを入力
デフォルトアイコンやHTTPS限定などの制限があれば、変更する

![Add App](/assets/images/setup-onesignal/003-2.png)

ローカル環境で実行したい場合は、以下のような設定にすると動作します。

```
SITE URL: http://localhost:8100
AUTO RESUBSCRIBE: OFF
LOCAL TESTING: ON
```

- 「Add A Prompt」を押下し、通知許可ダイアログの表示方法を選択する

![Add App](/assets/images/setup-onesignal/003-3.png)

- 今回は、「Native Prompt」を選択した

![Add App](/assets/images/setup-onesignal/003-4.png)

- 通知許可設定時の初期メッセージを設定するかどうか
今回は、「オフ」で設定

![Add App](/assets/images/setup-onesignal/003-5.png)

- その他の設定
今回は、すべてデフォルトのままで設定

![Add App](/assets/images/setup-onesignal/003-6.png)

- 「OneSignal-Web-SDK-HTTPS-Integration-Files.zip」をダウンロードし、
Webサイトのルートディレクトリ直下に配置する

![Add App](/assets/images/setup-onesignal/004.png)

- src配下のindex.htmlファイルに以下を、</head>タグのすぐ上に追記します。

```javascript
　<link rel="manifest" href="/manifest.json" />
  <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
  <script>
    var OneSignal = window.OneSignal || [];
    OneSignal.push(function() {
      OneSignal.init({
        appId: "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx",
      });
    });
  </script>
```

![Add App](/assets/images/setup-onesignal/005.png)

- ブラウザで表示確認を行う。正常にPush通知確認ダイアログが表示されれば、完了

![Add App](/assets/images/setup-onesignal/006.png)


#### Apple Safari

- Apple Safariの場合も、サイト名、サイトURLを同様に設定します。  
ただし、Safariの場合は、本番環境ドメインでしか動作しないようです。

また、p12ファイルのアップロードも行う必要があります。



[onesignal]: https://onesignal.com/
[onesignal-setup]: https://app.onesignal.com/signup