## これはなに

[Transactd](http://www.bizstation.jp/ja/transactd/) が入った MySQL の Docker Image

## transactd って？

MySQL 用の NoSQL プラグインです。詳しくは こちら [Transactd - ビズステーション株式会社](http://www.bizstation.jp/ja/transactd/)

あとは以下が参考になります。

- MySQLカジュアルでのプレゼン資料: [Transactd 高速・高機能なNoSQLプラグイン](http://www.slideshare.net/bizstation/transactd-nosql)
- Gihub: [bizstation/transactd: The high-speed and advanced NoSQL interface plugin for MySQL / MariaDB.](https://github.com/bizstation/transactd)

## 注意事項

plugin はロードされてますが、mysql.plugin テーブルでは確認できません。これは `INSTALL PLUGIN` クエリでインストールしたわけではなく、my.cnf で plugin-load を通して有効にしているためです。[こちら](https://dev.mysql.com/doc/refman/5.6/ja/server-plugin-loading.html) のリファレンスも合わせてご確認ください。
