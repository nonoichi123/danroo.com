---
layout: post
comments: true
title:  "firebase deploy で権限エラーになる"
date:   2020-07-25 00:00:00 +0000
categories: firebase
---
firebase ホスティングで、deployしようとしたら、権限エラーが発生した。
原因調査結果を残しておきます。

## 状況

ログインをすると、すでにログイン済みとなったので、deployをしようとした。

```ruby
$ firebase login
Already logged in as nonoichi@hoge.com
```

しかし、権限がないというエラーが返ってきた。

```ruby
$ firebase deploy

Error: Failed to get Firebase project hogehoge.
Please make sure the project exists and your account has permission to access it.
```

## 解消した方法

一度、ログアウトを行い、再ログインを行ったところ、権限エラーが解消された。

```ruby
$ firebase logout
⚠  Invalid refresh token, did not need to deauthorize
✔  Logged out from nonoichi123@gmail.com
```

ログインしてから、一定期間操作をしないと認証が切れてしまっていたが、
コマンドライン上では認証切れが把握できていないようです。

## ひとこと

時々は、リセットすることも大事なんだなと感じた出来事でした。