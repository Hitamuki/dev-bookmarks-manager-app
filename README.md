# Bookmarks Manager

## 概要

- raindrop.ioを模したブックマーク管理アプリを開発する

## 機能

- ブックマークの保存
- 階層構造で管理
- ブックマークの編集、移動、削除
- 非表示
- パスワード
- ログイン
- ゲスト
- サブスクリプション
- スマホ対応
- PWA

## 目的

- ペアプロやモブプロなど共同開発を通して、C#を中心に将来性のある技術をキャッチアップする
- GitHubを使った共同開発を体験する
- コーチング、ティーチング、レビュー経験を通して説明力を上げる

## 技術選定

- ASP.NET Core MVCを検討
  - 案件が多いか
  - 将来性があるか
- ランキング
  - Webフレームワークランキング
  - スタックオーバーフロー
- フリーランスエンジニアの案件から需要を知る
  - フリーランススタート

## 開発フロー

1. 共同開発のための環境構築
2. 開発の進め方の方針決め
3. 使用技術と使用目的の解説
4. ローカル環境で動作確認
5. 公式ドキュメントのチュートリアルを通してフレームワーク、ライブラリの使い方を知る
6. 開発
7. デプロイ

## 技術スタック

| 項目           | 詳細                           |
| -------------- | ------------------------------ |
| エディタ       | VSCode                         |
| バージョン管理 | GitHub</br>Git                 |
| DB             | Postgresql                     |
| DBクライアント | DBeaver                        |
| 言語           | C#                             |
| フレームワーク | ASP.NET Core MVC               |
| 単体テスト     | xUnit                          |
| E2Eテスト      | Playwright                     |
| ライブラリ     | Entity Framework Core</br>NLog |
| CI/CD          | GitHubActions                  |
| PaaS           | fly.io                         |
| その他         | Docker                         |

## MacとWindowsの共同開発

- Dockerで異なるOS間でも同じ環境を用意することが可能
- VSCodeの拡張機能「Dev Containers」で、ローカル環境を汚さずに開発環境を用意できる
- VSCodeの拡張機能「Live Share」で、リアルタイムの共同開発ができる

## 作業準備

- Dockerを起動する
- VSCodeでこのリポジトリを開く
- 開発用のコンテナを起動する
  - 拡張機能「Dev Containers」を有効にする
  - VSCodeの左下のアイコンをクリック→「コンテナーで再度開く」を選択
  - (\*)「Dev Containers」の設定を変更した場合
    - dockerのvolumeを削除する
- PostgreSQLコンテナに接続

```bash
  docker compose up -d
  # psqlで操作する場合
  docker exec -it postgres_container psql -U admin -d main_db
  docker exec -it postgres_container psql -U admin -d log_db
```
