# PostgreSQL

## 導入手順

`.env`を作成(パスワードやメールアドレスは自分で書き込む)

```shell
cp .env.example .env
```

ポート番号やPSQLの情報を編集

```shell
vi .env
```

PostgreSQLコンテナを立ち上げる

```shell
docker compose up -d
```

## 停止、起動、削除

停止

```shell
docker compose stop
```

起動

```shell
docker compose start
```

Composeを削除(作成したデータは残る。データを削除したい場合は`docker volume ls`でデータを探して`docker volume rm psql-server_data_admin17 psql-server_data_psql17`といった感じで削除する)

```shell
docker compose down
```

## Postgresql 作業

dockerの中に入る(`docker compose ps`で`SERVICE`の列を指定する)

```shell
docker compose exec -it <service name> bash
```

(dockerに入った上で)データベースに接続する

```shell
psql -U postgres -d liveview_chat_app_dev
sudo -u postgres psql
```

スキーマのリスト

```postgresql
\dn
```

スキーマの作成

```postgresql
create schema <<schema_name>>;
```

現在のスキーマ

```postgresql
select current_schema();
```

スキーマを切り替える

```postgresql
SET search_path = <<schema_name>>;
```

スキーマ名を変更

```postgresql
ALTER SCHEMA <<before_scheama_name>> RENAME TO <<new_schema_name>>;
```

データベース一覧

```postgresql
\l
```

データベースを作成する

```psql
create database <<database_name>>;
```


現在のデータベース

```psql
select current_database();
```

データベース切り替え

```postgresql
\c <db name>
```

データベースから出る

```postgresql
\q
```

データベース名を変更

```postgresql
ALTER DATABASE <<before_name>> RENAME TO <<after_name>>
```

テーブル一覧

```postgresql
\dt
```

テーブルのスキーマ詳細

```postgresql
\d <table name>
```

VIEWの一覧

```postgresql
\dv
```

VIEWの定義詳細

```postgresql
select definition from pg_views where viewname = '<VIEW_NAME>';
```

テーブル名変更

```postgresql
alter table <CURRENT_DB_NAME> rename to <NEW_DB_NAME>;
```

テーブル削除

```postgresql
# (当然ですが)データも消えます
drop table <TABLE_NAME>;
```

スキーマ作成

```postgresql
create schema <schema name>;
```

スキーマ一覧

```postgresql
\dn
```

スキーマ確認

```postgresql
select current_schema;
```

スキーマ変更

```postgresql
set search_path to <schema name>;
```

現在のユーザ

```postgresql
select current_user;
```

ロールの一覧

```postgresql
\du
```

ユーザのロール一覧

```postgresql
select * from pg_user;
```

権限付与

```postgresql
grant select, insert, update, delete on <table name> to <user name>;
```

権限削除

```postgresql
revoke select, insert, update, delete on <table name> from <user name>;
```

ユーザをスーパーユーザに変更

```postgresql
alter role <user name> with creatural superuser;

# スーパーユーザを剥奪
alter role <user name> with creatural nosuperuser;
```

バックアップする

```postgresql
# portとuserは適宜変更する
pg_dump -h 127.0.0.1 -p 5432 -U postgres -d liveview_chat_app_dev -t <<table_name>> -F p -f <<table_name>>_backup.sql
psql -h 127.0.0.1 -p 5432 -U postgres -d liveview_chat_app_dev -f <<table_name>>_backup20250219.sql

```

## References
- https://mebee.info/2020/12/04/post-24686/
- https://zenn.dev/sarisia/articles/0c1db052d09921

