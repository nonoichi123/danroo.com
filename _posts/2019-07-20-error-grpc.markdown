---
layout: post
comments: true
title:  "grpc@1.20.1 のインストールができない"
date:   2019-07-20 00:00:00 +0000
categories: NodeJs
---
npm install を実行したときに、以下のようなエラーが表示されてしまったので、その時の対処法です。

### 実行環境

```shellscript
MacOS 10.14.3
```

### エラー内容

```
../ext/channel.cc:292:56: error: too few arguments to function call, expected 2, have 1
  int try_to_connect = (int)info[0]->Equals(Nan::True());
                            ~~~~~~~~~~~~~~~            ^
/Users/rhinonolike/.node-gyp/12.6.0/include/node/v8.h:2572:3: note: 'Equals' declared here
  V8_WARN_UNUSED_RESULT Maybe<bool> Equals(Local<Context> context,
  ^
/Users/rhinonolike/.node-gyp/12.6.0/include/node/v8config.h:351:31: note: expanded from macro 'V8_WARN_UNUSED_RESULT'
#define V8_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
                              ^
1 error generated.
make: *** [Release/obj.target/grpc_node/ext/channel.o] Error 1
gyp ERR! build error 
gyp ERR! stack Error: `make` failed with exit code: 2
gyp ERR! stack     at ChildProcess.onExit (/Users/rhinonolike/.nodebrew/node/v12.6.0/lib/node_modules/npm/node_modules/node-gyp/lib/build.js:262:23)
gyp ERR! stack     at ChildProcess.emit (events.js:203:13)
gyp ERR! stack     at Process.ChildProcess._handle.onexit (internal/child_process.js:272:12)
gyp ERR! System Darwin 18.6.0
gyp ERR! command "/Users/rhinonolike/.nodebrew/node/v12.6.0/bin/node" "/Users/rhinonolike/.nodebrew/node/v12.6.0/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js" "build" "--fallback-to-build" "--library=static_library" "--module=/Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc/src/node/extension_binary/node-v72-darwin-x64-unknown/grpc_node.node" "--module_name=grpc_node" "--module_path=/Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc/src/node/extension_binary/node-v72-darwin-x64-unknown" "--napi_version=4" "--node_abi_napi=napi" "--napi_build_version=0" "--node_napi_label=node-v72"
gyp ERR! cwd /Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc
gyp ERR! node -v v12.6.0
gyp ERR! node-gyp -v v3.8.0
gyp ERR! not ok 
node-pre-gyp ERR! build error 
node-pre-gyp ERR! stack Error: Failed to execute '/Users/rhinonolike/.nodebrew/node/v12.6.0/bin/node /Users/rhinonolike/.nodebrew/node/v12.6.0/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js build --fallback-to-build --library=static_library --module=/Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc/src/node/extension_binary/node-v72-darwin-x64-unknown/grpc_node.node --module_name=grpc_node --module_path=/Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc/src/node/extension_binary/node-v72-darwin-x64-unknown --napi_version=4 --node_abi_napi=napi --napi_build_version=0 --node_napi_label=node-v72' (1)
node-pre-gyp ERR! stack     at ChildProcess.<anonymous> (/Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc/node_modules/node-pre-gyp/lib/util/compile.js:83:29)
node-pre-gyp ERR! stack     at ChildProcess.emit (events.js:203:13)
node-pre-gyp ERR! stack     at maybeClose (internal/child_process.js:1021:16)
node-pre-gyp ERR! stack     at Process.ChildProcess._handle.onexit (internal/child_process.js:283:5)
node-pre-gyp ERR! System Darwin 18.6.0
node-pre-gyp ERR! command "/Users/rhinonolike/.nodebrew/node/v12.6.0/bin/node" "/Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc/node_modules/.bin/node-pre-gyp" "install" "--fallback-to-build" "--library=static_library"
node-pre-gyp ERR! cwd /Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc
node-pre-gyp ERR! node -v v12.6.0
node-pre-gyp ERR! node-pre-gyp -v v0.12.0
node-pre-gyp ERR! not ok 
Failed to execute '/Users/rhinonolike/.nodebrew/node/v12.6.0/bin/node /Users/rhinonolike/.nodebrew/node/v12.6.0/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js build --fallback-to-build --library=static_library --module=/Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc/src/node/extension_binary/node-v72-darwin-x64-unknown/grpc_node.node --module_name=grpc_node --module_path=/Users/rhinonolike/works/danroo-arumonorisuto/node_modules/grpc/src/node/extension_binary/node-v72-darwin-x64-unknown --napi_version=4 --node_abi_napi=napi --napi_build_version=0 --node_napi_label=node-v72' (1)
npm WARN @ionic-native/transfer@3.14.0 requires a peer of @ionic-native/core@^3.6.0 but none is installed. You must install peer dependencies yourself.
npm WARN ionic-image-loader@3.2.1 requires a peer of @ionic-native/file@^3.6.1 but none is installed. You must install peer dependencies yourself.

npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! grpc@1.20.0 install: `node-pre-gyp install --fallback-to-build --library=static_library`
npm ERR! Exit status 1
npm ERR! 
npm ERR! Failed at the grpc@1.20.0 install script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

npm ERR! A complete log of this run can be found in:
npm ERR!     /Users/rhinonolike/.npm/_logs/2019-07-21T08_41_33_902Z-debug.log
```

### 原因

grpc@1.20.1 が、Node12 からサポート対象外になったようです。
そのため、NodeのバージョンをLTS版に変更しました。

### 対処法

現在のバージョンを確認

```
$ nodebrew list
v12.6.0

current: v12.6.0
```

LTSバージョンをインストール

```
$ nodebrew install-binary 10.16.0
Fetching: https://nodejs.org/dist/v10.16.0/node-v10.16.0-darwin-x64.tar.gz
######################################################################## 100.0%
Installed successfully

$ nodebrew list
v10.16.0
v12.6.0

current: v12.6.0
```

LTSに切り替え

```
$ nodebrew use v10.16.0
use v10.16.0

$ node -v
v10.16.0
```

これでエラーが解消されました。

### 参考URL

[https://github.com/grpc/grpc-node/issues/834](https://github.com/grpc/grpc-node/issues/834)