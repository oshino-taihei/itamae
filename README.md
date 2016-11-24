# itamae
## 共通
rakeタスクで実行可能なレシピ:サーバの一覧を管理している。
現在はCDH5関連のみ。

```
$ rake -T
rake cdh01  # itamae ssh -u root -h cdh01 -y nodes/cdh5/cdh01.yaml recipes/cdh5/os_config.rb
rake cdh02  # itamae ssh -u root -h cdh02 -y nodes/cdh5/cdh02.yaml recipes/cdh5/os_config.rb
rake cdh03  # itamae ssh -u root -h cdh03 -y nodes/cdh5/cdh03.yaml recipes/cdh5/os_config.rb
rake cdh04  # itamae ssh -u root -h cdh04 -y nodes/cdh5/cdh04.yaml recipes/cdh5/os_config.rb
rake db1    # itamae ssh -u root -h db1 -y nodes/cdh5/db1.yaml recipes/cdh5/os_config.rb
rake db2    # itamae ssh -u root -h db2 -y nodes/cdh5/db2.yaml recipes/cdh5/os_config.rb
rake edge   # itamae ssh -u root -h edge -y nodes/cdh5/edge.yaml recipes/cdh5/os_config.rb
```

rake対象サーバは以下のyamlで管理しているので、サーバを増やす場合はコピーして<サーバ名>.yamlファイルを配置し、中身を適宜設定する。
```
$ ls nodes/cdh5/*.yaml
nodes/cdh5/cdh01.yaml  nodes/cdh5/cdh02.yaml  nodes/cdh5/cdh03.yaml  nodes/cdh5/cdh04.yaml  nodes/cdh5/db1.yaml  nodes/cdh5/db2.yaml  nodes/cdh5/edge.yaml
```

前提として、itamaeユーザから各サーバのrootユーザでsshパスワードなしログインができるように公開鍵設定がされていること。

## CDH5
CDH5インストール前に必要なホスト名変更等のレシピを定義


