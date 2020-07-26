---
layout: post
comments: true
title:  "ハローワーク求人情報CSVをバッチで取得する"
date:   2019-07-18 00:00:00 +0000
categories: ShellScript
---
ハローワーク求人情報提供サービスから求人情報CSVファイルを日次で取得したくて、
スクリプトを作成しました。

ハローワーク求人情報提供サービスサイトがリニューアルされるそうで、
使えなくなるかもしれませんが、参考として載せておきます。

### 実行環境

```
CentOS 7
Bash, curl が実行できること
```

### ダウンロードスクリプト

事前に以下を確認、調整の上、実行してください。

- ユーザIDとパスワードを設定してください。
- ダウンロードする情報は、大阪求人のみを指定していますので、必要な都道府県に変更してください。
- ハローワーク求人情報提供サービスに不利益とならないようにしてください。

```
#!/bin/bash

# login
curl -c ./uploads/hellowork/cookie.txt \
https://api.hellowork.go.jp/online/200010.do -k \
-d "txtUserId=[ユーザID]" \
-d "txtPassword=[パスワード]" \
-d "login=%E3%83%AD%E3%82%B0%E3%82%A4%E3%83%B3" \
-d "screenId=200010" \
-d "action=" -d "codeAssistType=" -d "codeAssistKind=" -d "codeAssistCode=" \
-d "codeAssistItemCode=" -d "codeAssistItemName=" -d "codeAssistDivide=" \
-d "xad_vrbs=login" -d "loginFlag=1";

# download zipfile.
curl -b ./uploads/hellowork/cookie.txt \
https://api.hellowork.go.jp/online/230010.do -k \
-d "chkDownload=[取得したい都道府県コード]" \
-d "commonMultiDownload=%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89" \
-d "screenId=230010" \
-d "action=" -d "codeAssistType=" -d "codeAssistKind=" -d "codeAssistCode=" \
-d "codeAssistItemCode=" -d "codeAssistItemName=" -d "codeAssistDivide=" \
-d "xad_vrbs=commonLogout%2CcommonDownload%2CcommonMultiDownload" \
-o ./uploads/hellowork/hellowork.zip;
```