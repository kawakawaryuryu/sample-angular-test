# SampleAngularTest
Qiita記事の「[AngularのテストをDocker(CentOS 7)上で回すときに設定したこと](https://qiita.com/kawakawaryuryu/items/f4f9149179aa5b0c12fe)」で使用したサンプルコードです。

## Dockerfile
[Dockerfile](./Dockerfile)を参照してください。

## ビルド
```bash
$ docker build -t sample-angular-test .
```

## テスト実行
```
$ docker run sample-angular-test
```
