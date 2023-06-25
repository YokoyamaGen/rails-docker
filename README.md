# README

## 環境構築方法

<br>


1. ターミナルに以下コマンドを入力して、環境構築に必要なプログラムをローカル環境にダウンロード
```
git clone https://github.com/YokoyamaGen/rails-docker.git
```

<br> 

2. ディレクトリ移動 

```
cd rails-docker
```

<br> 

3. アプリケーションを起動
```
docker-compose up
```

<br> 

4. データベースを作成。`docker-compose up`を実行したターミナルとは別のターミナルを新たに開き、以下コマンドを実行。
```
docker-compose run web rake db:create
```

<br> 

5. データベースにテーブルを作成

```
docker-compose run web rake db:migrate
```

<br>

6. ブラウザを開き、以下URLを入力

```
http://localhost:3000/
```

<br>

以下画面が表示される。

<img width="833" alt="image" src="https://github.com/YokoyamaGen/rails-docker/assets/66200883/72940065-a100-4db4-a30d-6aeabea7d83f">

<br>

7. アプリケーションを停止。`docker-compose up`を実行したターミナルで以下を実行

```
Ctrl-C
```

<br>

8. アプリケーションを再起動

```
docker-compose up
```
